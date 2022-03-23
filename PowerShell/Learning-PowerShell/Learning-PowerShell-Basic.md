
# Learning PowerShell Basic

---

Contents:

- What is a PowerShell command (cmdlet)

Source:

- [Learning-PowerShell-Basic.md-script.ps1](Learning-PowerShell-Basic.md-script.ps1)

---

## What is a PowerShell command (Cmdlet)?

PowerShell에는 수백에의 미리 설치되어 있는 commands들이 있으며 이를 Cmdlets ("command-lets"이라고 발음)이라고 합니다.

- CmdLets은 PowerShell의 기본 Commands입니다.

- CmdLets은 PowerShell modules에 포함되어 있습니다.

    ```powershell
    #region Cmdlets: Get-Module
    
    # Computer에서 사용가능한 미리 설치되어 있는 또는 사용자가 설치한 PowerShell Module을 확인
    
    Get-Module -ListAvailable | Where-Object -Property Name -Like -Value 'Active*'
    
    Get-Module -ListAvailable | Where-Object -Property Name -Like -Value 'Active*'
    
    #endregion
    ```

- CmdLets은 compiled된 .NET language 또는 PowerShell Scripting language로 만들어질 (can be written) 수 있습니다.

- CmdLets의 이름은 Verb-Noun 의 pair로 이루어져 있습니다.

    ```powershell
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
    ```


    > [!INFO]  
    > [Get-Command](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command)  
    > [Approved Verbs for PowerShell Commands](https://docs.microsoft.com/en-us/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands)


- CmdLets은 commands 및 concepts에 대한 정보를 포함할 수 있습니다.

    ```powershell
    #region Cmdlets: Get-Help
    
    Get-Command -Noun Help
    
    <#OUTPUT
    CommandType     Name           Version    Source
    -----------     ----           -------    ------
    Cmdlet          Get-Help       3.0.0.0    Microsoft.PowerShell.Core
    Cmdlet          Save-Help      3.0.0.0    Microsoft.PowerShell.Core
    Cmdlet          Update-Help    3.0.0.0    Microsoft.PowerShell.Core
    #>
    
    Get-Help -Name Get-Process
    
    Get-Help -Name Get-Process -Detailed
    
    Get-Help -Name Get-Process -Full
    
    Get-Help -Name Get-Process -Examples
    
    Get-Help -Name Get-Process -Parameter IncludeUserName
    
    Get-Help -Name Get-Process -Online
    
    #endregion
    ```
    
    > [!INFO]  
    > [Get-Help](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-help)

- PowerShell은 command의 output을 다른 command로 연결하게 쉽게 pipeline을 지원합니다.

    ```powershell
    #region Cmdlets: Get-Member
    
    Get-Process | Get-Member
    
    Get-Process | Get-Member -MemberType Property
    
    Get-Process | Where-Object {$_.ProcessName -Like "p*"}
    
    #endregion
    ```

    > [!INFO]  
    > [Get-Member](https://docs.microsoft.com/ko-kr/powershell/module/microsoft.powershell.utility/get-member)  
    > [Where-Object](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/where-object)  
    > [about_Automatic_Variables](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables)  
    >

### [about_Automatic_Variables](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_automatic_variables)

### [about_Preference_Variables](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_preference_variables)

---

## Want to know about arrays




---
---

> [!div class="nextstepaction"]  
> [Desired State Configuration (DSC)](Desired-State-Configuration.md)
