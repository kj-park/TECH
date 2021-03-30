
param (
    [String]$BackupFolder = 'C:\Working\ConfigBackup'
)


#region Connect Exchange Remote Management Shell

#. 'C:\Program Files\Microsoft\Exchange Server\V15\bin\RemoteExchange.ps1'; Connect-ExchangeServer -auto -ClientApplication:ManagementShell

#endregion

#region Backup Configuration files

    if ( !(Test-Path -LiteralPath $BackupFolder) ) {
        New-Item -Path "$BackupFolder" -ItemType Directory -Force
    }
    else {
        $BackupFolder = "$BackupFolder-$(Get-Date -Format "yyyyMMdd")"    
        New-Item -Path "$BackupFolder" -ItemType Directory -Force

    }

    $BackupFile = Copy-Item -Path "$($env:ExchangeInstallPath)Bin\EdgeTransport.exe.config" -Destination $BackupFolder -PassThru

    $BackupTasks = @()

    # EdgeTransport Config
    $BackupTask = [Ordered]@{}
    $BackupTask.Source = "$($env:ExchangeInstallPath)Bin\EdgeTransport.exe.config"
    $BackupTask.Destination = $BackupFile.FullName
    $BackupTask.Date = Get-Date
    $BackupTasks += [PSCustomObject]$BackupTask

    # FrontEnd Web
    $webConfigs = Get-ChildItem -Path "$($env:ExchangeInstallPath)FrontEnd\HttpProxy" -Filter "web.config" -Recurse
    # BackEnd Web
    $webConfigs += Get-ChildItem -Path "$($env:ExchangeInstallPath)ClientAccess\Autodiscover" -Filter "web.config"
    $webConfigs += Get-ChildItem -Path "$($env:ExchangeInstallPath)ClientAccess\ecp" -Filter "web.config"
    $webConfigs += Get-ChildItem -Path "$($env:ExchangeInstallPath)ClientAccess\exchweb\EWS" -Filter "web.config"
    $webConfigs += Get-ChildItem -Path "$($env:ExchangeInstallPath)ClientAccess\owa" -Filter "web.config"
    $webConfigs += Get-ChildItem -Path "$($env:ExchangeInstallPath)ClientAccess\sync" -Filter "web.config"
    $webConfigs += Get-ChildItem -Path "$($env:ExchangeInstallPath)ClientAccess\OAB" -Filter "web.config"
    $webConfigs += Get-ChildItem -Path "$($env:ExchangeInstallPath)ClientAccess\PowerShell-Proxy" -Filter "web.config"
    $webConfigs += Get-ChildItem -Path "$($env:ExchangeInstallPath)ClientAccess\PushNotifications" -Filter "web.config"
    $webConfigs += Get-ChildItem -Path "$($env:ExchangeInstallPath)ClientAccess\RpcProxy" -Filter "web.config"

    foreach ( $webConfig in $webConfigs ) {
        $backupFolderPath = $webConfig.Directory.FullName.Replace($env:ExchangeInstallPath, "$BackupFolder\")
        New-Item -Path "$backupFolderPath" -ItemType Directory -Force
        $BackupFile = Copy-Item -Path $webConfig.FullName -Destination $backupFolderPath -PassThru
        $BackupTask = [Ordered]@{}
        $BackupTask.Source = $webConfig.FullName
        $BackupTask.Destination = $BackupFile.FullName
        $BackupTask.Date = Get-Date
        $BackupTasks += [PSCustomObject]$BackupTask
    }
    $BackupTasks | Export-Csv -Path "$BackupFolder\BackupConfigs-$(Get-Date -Format "yyyyMMdd").csv" -NoTypeInformation -Encoding UTF8

#endregion