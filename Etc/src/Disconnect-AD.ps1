

#region Define functions

function Popup-Window {
    <#
    # Button Types
    0    0x0    OK
    1    0x1    OK + Cancel
    2    0x2    Abort + Retry + Ignore
    3    0x3    Yes + No + Cancel
    4    0x4    Yes + No
    5    0x5    Retry + Cancel
    6    0x6    Cancel + Try Again + Continue
    
    # Icon Types
    16    0x10    Stop
    32    0x20    Question
    48    0x30    Exclamation
    64    0x40    Information
    
    # Other Types
    256     0x100     Second button is the default
    512     0x200     Third button is the default
    4096    0x1000    TopMost Windows
    
    # Return Values
    -1    Elapsed or No click
    1     OK
    2     Cancel
    3     Abort
    4     Retry
    5     Ignore
    6     Yes
    7     No
    10    Try Again
    11    Continue
    
    #>
    
        param (
            $Description = 'Detailed Description',
            $SecondsToWait = 0,
            $Title = 'Windows Title',
            $Type = 0x21
        )
        begin {
            $Return = $null
            $WShell = New-Object -ComObject WScript.Shell
            $SecondsToWait = 0
        }
        process {
            $Return = $WShell.Popup($Description,$SecondsToWait,$Title,$Type)
        }
        end {
            return $Return
        }
    }
    
    function Set-AutoAdminLogon {
        param (
            $DefaultUserName = 'GSPLUSER',
            $DefaultPassword = '!GSPLLocal!',
            $DefaultDomainName = '',
            $RunOnce = $true
        )
        process {
            $RegistryPath = 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon'
    
            New-ItemProperty -Path $RegistryPath -Name DefaultUserName -Value $DefaultUserName -Force | Out-Null
            New-ItemProperty -Path $RegistryPath -Name DefaultPassword -Value $DefaultPassword -Force | Out-Null
            New-ItemProperty -Path $RegistryPath -Name DefaultDomainName -Value $DefaultDomainName -Force | Out-Null
            New-ItemProperty -Path $RegistryPath -Name AutoAdminLogon -Value '1' -Force | Out-Null
    
            if ( $RunOnce ) {
                New-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows\CurrentVersion\RunOnce' `
                                 -Name DeleteAutoAdminLogon `
                                 -Value 'C:\Windows\System32\REG.exe DELETE "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoAdminLogon /f' `
                                 -PropertyType ExpandString -Force | Out-Null
            }
        }
    }
    
    function Remove-EnrollmentsSubKeys {
        $SubKeys = (Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Enrollments).PSChildName
        foreach ( $Key in $SubKeys ) {
            if ( $Key -notin @('Context', 'Ownership', 'PollonLoginTasksCreated', 'Status', 'ValidNodePaths') ) {
                Remove-Item -Path "HKLM:\SOFTWARE\Microsoft\Enrollments\$Key" -Force -ErrorAction SilentlyContinue -Confirm:$false -Recurse
            }    
        }
    }
    
    #endregion
    
    
    #region Define needed values
    
    $LocalUser = 'Administrator'
    $NewPassword = '!Qaz@Wsx'
    $SecurePassword = ConvertTo-SecureString -String $NewPassword -AsPlainText -Force
    $DomainCredential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList "gsplspore",(ConvertTo-SecureString -String 'New4u2021!GS' -AsPlainText -Force)
    
    
    #endregion
    
    
    #region  Main Progress
    
    if ( (Get-Item -Path ENV:USERDOMAIN).Value -eq 'DOMSG' ) { $IsDomainUser = $true } else { $IsDomainUser = $false }
    
    if ( $IsDomainUser ) {
    
        # Check Local Administrators
        $SelectedUser = $null
        $SelectedUser = Get-LocalUser -Name 'gspl' -ErrorAction SilentlyContinue
    
        if ( $null -eq $SelectedUser ) {
            $Members = Get-LocalGroupMember -Name 'Administrators'
            foreach ( $Member in $Members ) {
                $User = $null
                $User = Get-LocalUser -SID $Member.SID -ErrorAction SilentlyContinue
                if ( ($null -ne $User) -and $User.Enabled -and (Test-Path -LiteralPath "C:\Users\$($User.Name)") ) {
                    $SelectedUser = $User
                    Set-LocalUser -Name $SelectedUser.Name -Password $SecurePassword -AccountNeverExpires:$true
                }
            }
        }
        if ( $null -ne $SelectedUser ) {
            $LocalUser = $SelectedUser.Name
        }
        else {
            $LocalUser = 'Administrator'
        }
        Set-LocalUser -Name $LocalUser -Password $SecurePassword -AccountNeverExpires:$true
        Enable-LocalUser -Name $LocalUser
    
        Remove-EnrollmentsSubKeys
    
        $Description = @'
You can sign-in this windows with "[UserName]" account after restarting windows.
Maybe, you provided this account's password.

Click "OK" to disconnect from AD and restart.
It will restart and sign-in automatically.
'@
    
        $Description = $Description.Replace("[UserName]", ".\$LocalUser")
    
        $return = Popup-Window -Title "Disconnect from AD and Restart Windows" -Description $Description -Type 0x31
        
        if ( $return -eq 1 ) {
            Set-AutoAdminLogon -DefaultUserName $LocalUser -DefaultPassword $NewPassword
            $Error.Clear()
            Remove-Computer -WorkgroupName "GSPLLOCALS" -Restart:$false -UnjoinDomainCredential $DomainCredential -Force -ErrorAction SilentlyContinue
            if ( $Error.Count -gt 0 ) {
                $WmiObject = Get-WmiObject Win32_ComputerSystem
                $result = 0
                $result = ($WmiObject.UnjoinDomainOrWorkgroup("New4u2021!GS","gsplspore",0)).ReturnValue
                if ( $result -eq 0 ) {
                    Restart-Computer
                }
                else {
                    $Description = "Disconnecting from AD was failed.`nPlease refer the 14 page in ""User Guide - Windows & Desktop App Setup.pptx"" and disconnect from AD manually"
                    $return = Popup-Window -Title "Disconnect from AD manually" -Description $Description -Type 0x10
                    Start-Process ms-settings:workplace
                }
            }
            else {
                Restart-Computer
            }
        }
    }
    else {
    
        $Description = @'
You signed-in this windows with local account.
You can join to Azure AD now.

Click "OK" to join to AD.
It will be opened "Access Work or School" in Settings's Accounts
'@
    
        $return = Popup-Window -Title "Join to Azure AD" -Description $Description -Type 0x41
    
        if ( $return -eq 1 ) {
            Start-Process ms-settings:workplace
        }
    }
    
    #endregion
    
    