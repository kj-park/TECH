

#region Cmdlets: Get-Module

# Computer에서 사용가능한 미리 설치되어 있는 또는 사용자가 설치한 PowerShell Module을 확인

Get-Module -ListAvailable | Where-Object -Property Name -Like -Value 'Active*'

Get-Module -ListAvailable | Where-Object -Property Name -Like -Value 'Active*'

#endregion


#region Cmdlets: Get-Command

# Verb-Noun pair로 이루어진 Cmdlet에 대하여 확인

Get-Command -Name Get-Process

Get-Command -Module Microsoft.PowerShell.Management

Get-Command -Verb Get -Module ActiveDirectory

Get-Command -Noun ADUser -Module ActiveDirectory

Get-Command -Module Defender

Get-Command -Name '*user*'

Get-Verb

#endregion


#region Cmdlets: Get-Help

Get-Command -Noun Help

<#OUTPUT
CommandType     Name                                               Version    Source                                                                                                                                                    
-----------     ----                                               -------    ------                                                                                                                                                    
Cmdlet          Get-Help                                           3.0.0.0    Microsoft.PowerShell.Core                                                                                                                                 
Cmdlet          Save-Help                                          3.0.0.0    Microsoft.PowerShell.Core                                                                                                                                 
Cmdlet          Update-Help                                        3.0.0.0    Microsoft.PowerShell.Core
#>

Get-Help -Name Get-Process

Get-Help -Name Get-Process -Detailed

Get-Help -Name Get-Process -Full

Get-Help -Name Get-Process -Examples

Get-Help -Name Get-Process -Parameter IncludeUserName

Get-Help -Name Get-Process -Online

#endregion


#region Cmdlets: Get-Member

Get-Process | Get-Member

Get-Process | Get-Member -MemberType Property

Get-Process | Where-Object {$_.ProcessName -Like "p*"}

#endregion

#region Help: about_Automatic_Variables



#endregion