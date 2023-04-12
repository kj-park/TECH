
# Learning PowerShell Basic

---

Contents:

- [What is a PowerShell command (cmdlet)](#what-is-a-powershell-command-cmdlet)
- [Want to know about arrays](#want-to-know-about-arrays)

- Want to know about HashTables
- Want to know about PSCustomObject
- Want to know about if/then/else
- Want to know about switch
- Want to know about Exceptions


Source:

- [Learning-PowerShell-Basic.md-script.ps1](https://github.com/kj-park/Tech/blob/main/PowerShell/source/Learning-PowerShell-Basic.md-script.ps1)

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

[Arrays](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_arrays)는 대부분 programming 언어에서 기본 기능입니다.

Values 또는 Objects의 collection입니다.

Arrays은 여러 항목의 모음으로 하는 데이터 구조입니다. Arrays을 반복하거나 인덱스를 사용하여 개별 항목에 액세스할 수 있습니다.

### Basic Usage

#### Create an Array

```powershell

$data = @()
$data.count

<#OUTPUT
0
#>

$data = @('Zero','One','Two','Three')
$data.count

<#OUTPUT
4
#>

$data

<#OUTPUT
Zero
One
Two
Three
#>

$data = 'Zero','One','Two','Three'
```

#### Accessing items

```powershell

# offset value starting at 0

$data = 'Zero','One','Two','Three'
$data[0]

<#OUTPUT
Zero
#>

$data[1]

<#OUTPUT
One
#>

$data[0..3]

$data[3..1]

$data[-1]

$data[3,3,2,2,1,1]

$data | Get-Member

[Array] | Get-Member

$data.Count

$data[3] = 'four'
```

#### Interaction

```powershell
# Pipeline

$data = 'Zero','One','Two','Three'
$data | ForEach-Object {"Item: [$PSItem]"}

<#OUTPUT
Item: [Zero]
Item: [One]
Item: [Two]
Item: [Three]
#>

# ForEach loop

foreach ( $node in $data )
{
    "Item: [$node]"
}

# ForEach method

$data.foreach({"Item [$PSItem]"})

# For loop

for ( $index = 0; $index -lt $data.count; $index++)
{
    "Item: [{0}]" -f $data[$index]
}

# Switch loop

$data = 'Zero','One','Two','Three'
switch( $data )
{
    'One'
    {
        'Tock'
    }
    'Three'
    {
        'Tock'
    }
    Default
    {
        'Tick'
    }
}

```

### Arrays of Objects

```powershell
$processList = Get-Process

$data = @(
    [PSCustomObject]@{FirstName='Kevin';LastName='Marquette'}
    [PSCustomObject]@{FirstName='John'; LastName='Doe'}
)

$data[0]

$data[0].FirstName

$data | ForEach-Object {$_.LastName}

$data | Select-Object -ExpandProperty LastName

$data.LastName

# Where-Object filtering

$data | Where-Object {$_.FirstName -eq 'Kevin'}

# Where method

$data.Where({$_.FirstName -eq 'Kevin'})

# Updating objects in loops

foreach($person in $data)
{
    $person.FirstName = 'Kevin'
}

foreach($person in $data)
{
    $person = [PSCustomObject]@{
        FirstName='Kevin'
        LastName='Marquette'
    }
}
```

### Operators

```powershell
# -join

PS> $data = @(1,2,3,4)
PS> $data -join '-'
1-2-3-4
PS> $data -join ','
1,2,3,4

# -join $array

PS> $data = @(1,2,3,4)
PS> $data -join $null
1234

PS> $data = @(1,2,3,4)
PS> -join $data
1234

# -replace and -split

PS> $data = @('ATX-SQL-01','ATX-SQL-02','ATX-SQL-03')
PS> $data -replace 'ATX','LAX'
LAX-SQL-01
LAX-SQL-02
LAX-SQL-03

# -contains

PS> $data = @('red','green','blue')
PS> $data -contains 'green'
True

# -in

PS> $data = @('red','green','blue')
PS> 'green' -in $data
True

PS> $data = @('red','green','blue')
PS> $pattern = "^({0})$" -f ($data -join '|')
PS> $pattern
^(red|green|blue)$

PS> 'green' -match $pattern
True

# -eq and -ne Array가 왼쪽에 있으면 모든 item을 비교하고 일치하는 항목을 return

PS> $data = @('red','green','blue')
PS> $data -eq 'green'
green

PS> $data = @('red','green','blue')
PS> $data -ne 'green'
red
blue

$data = @('red','green','blue')
if ( $data -eq 'green' )
{
    'Green was found'
}
if ( $data -ne 'green' )
{
    'And green was not found'
}

# -match & Select-String

PS> $servers = @(
    'LAX-SQL-01'
    'LAX-API-01'
    'ATX-SQL-01'
    'ATX-API-01'
)
PS> $servers -match 'SQL'
LAX-SQL-01
ATX-SQL-01

$servers | Select-String SQL

```


### Adding to arrays


ref: [array-addition](https://docs.microsoft.com/en-us/powershell/scripting/learn/deep-dives/everything-about-arrays?view=powershell-7.2#array-addition)

### Array Types



---

## Want to know about HashTables


---

## Want to know about PSCustomObject


---

## Want to know about if/then/else


---

## Want to know about switch


---

## Want to know about Exceptions


---

> [!div class="nextstepaction"]  
> [Desired State Configuration (DSC)](Desired-State-Configuration)
