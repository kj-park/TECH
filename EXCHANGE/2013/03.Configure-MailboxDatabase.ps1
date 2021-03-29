

#region Create Database

    $DBRootPath = "E:\EXCHDB"
    $servers = @("EX01", "EX02")
    foreach ( $server in $servers ) { Invoke-Command -ScriptBlock { New-Item -Path "E:\EXCHDB" -ItemType Directory } -ComputerName $server }
    


    $DBConfigs = @(
        [PSCustomObject]@{
            DBName = 'DB001'
            edbPath = "$DBRootPath\MDB001\DB001.edb"
            logPath = "$DBRootPath\MDB001"
            Active = $servers[0]
            Copy = $servers[1]
        },
        [PSCustomObject]@{
            DBName = 'DB002'
            edbPath = "$DBRootPath\MDB002\DB002.edb"
            logPath = "$DBRootPath\MDB002"
            Active = $servers[1]
            Copy = $servers[0]
        },
        [PSCustomObject]@{
            DBName = 'DB003'
            edbPath = "$DBRootPath\MDB003\DB003.edb"
            logPath = "$DBRootPath\MDB003"
            Active = $servers[0]
            Copy = $servers[1]
        },
        [PSCustomObject]@{
            DBName = 'DB004'
            edbPath = "$DBRootPath\MDB004\DB004.edb"
            logPath = "$DBRootPath\MDB004"
            Active = $servers[1]
            Copy = $servers[0]
        }
    )

    # [X] Create The Mailbox Databases
    foreach ( $DBConfig in $DBConfigs ) {
        New-MailboxDatabase -Server ($DBConfig.Active) -Name ($DBConfig.DBName) -EdbFilePath ($DBConfig.edbPath) -LogFolderPath ($DBConfig.logPath)
    }

    # [X] Mount the Databases
    foreach ( $DBConfig in $DBConfigs ) {
        Mount-Database -Identity ($DBConfig.DBName)
    }

    # Checking Mount status for Mailbox Databases
    foreach ( $server in $servers ) { Get-MailboxDatabaseCopyStatus -Server $server | Format-Table -AutoSize }
    foreach ( $server in $servers ) { Invoke-Command -ScriptBlock { Restart-Service -Name MSExchangeIS -PassThru } -ComputerName $server }

    Get-Transportconfig | FL SafetyNetHoldtime

    # [X] DBs: Add The Servers for The Mailbox Database Copy
    foreach ( $DBConfig in $DBConfigs ) {
        Add-MailboxDatabaseCopy -Identity $DBConfig.DBName -MailboxServer $DBConfig.Copy -ActivationPreference 2 -ReplayLagTime "00:00:00" 
    }

    # [X] Restart MSExchangeIS Service
    foreach ( $server in $servers ) { Invoke-Command -ScriptBlock { Restart-Service -Name MSExchangeIS -PassThru } -ComputerName $server }

    foreach ( $server in $servers ) { Get-MailboxDatabaseCopyStatus -Server $server | Format-Table -AutoSize }

    # DB Config Retiontion
    foreach ( $DBConfig in $DBConfigs ) {
        Set-MailboxDatabase -Identity $DBConfig.DBName -IssueWarningQuota 0.4GB -ProhibitSendQuota 0.5GB -ProhibitSendReceiveQuota 0.5GB   -DeletedItemRetention 7 -MailboxRetention 30
    }

    # Check The DB Config Retention
    foreach ( $server in $servers ) {
        Get-MailboxDatabase -Server $server | Ft Identity, IssueWarningQuota, ProhibitSendQuota, ProhibitSendReceiveQuota, DeletedItemRetention, MailboxRetention -AutoSize
    }


    Get-MailboxDatabase -Server EX01
    Get-Mailbox -Database 'Mailbox Database 0623045712'
    Get-Mailbox -Database 'Mailbox Database 0623045712' -Arbitration

    Get-MailboxDatabase -Server EX02
    Get-Mailbox -Database 'Mailbox Database 1394986399' | New-MoveRequest -TargetDatabase DB002
    Get-MoveRequest -TargetDatabase DB002 | Remove-MoveRequest

    Get-Mailbox -Database 'Mailbox Database 1394986399' -Arbitration | New-MoveRequest -TargetDatabase DB001
    Get-MoveRequest -TargetDatabase DB001 | Remove-MoveRequest

    Remove-MailboxDatabase -Identity 'Mailbox Database 0623045712'
    Remove-MailboxDatabase -Identity 'Mailbox Database 1394986399'


