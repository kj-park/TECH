

#region ## What is a PowerShell command (Cmdlet)?: Cmdlets: Get-Module

# Computer에서 사용가능한 미리 설치되어 있는 또는 사용자가 설치한 PowerShell Module을 확인

Get-Module -ListAvailable | Where-Object -Property Name -Like -Value 'Active*'

Get-Module -ListAvailable | Where-Object -Property Name -Like -Value 'Active*'

#endregion


#region ## What is a PowerShell command (Cmdlet)?: Cmdlets: Get-Command

# Verb-Noun pair로 이루어진 Cmdlet에 대하여 확인

Get-Command -Name Get-Process

Get-Command -Module Microsoft.PowerShell.Management

Get-Command -Verb Get -Module ActiveDirectory

Get-Command -Noun ADUser -Module ActiveDirectory

Get-Command -Module Defender

Get-Command -Name '*user*'

Get-Verb

#endregion


#region ## What is a PowerShell command (Cmdlet)?: Cmdlets: Get-Help

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


#region ## What is a PowerShell command (Cmdlet)?: Cmdlets: Get-Member

Get-Process | Get-Member

Get-Process | Get-Member -MemberType Property

Get-Process | Where-Object {$_.ProcessName -Like "p*"}

#endregion

#region About Arrays: #### Create an Array

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

#endregion


#region About Arrays: #### Accessing items

## offset value starting at 0

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

#endregion


#region About Arrays: #### Interaction

## Interaction: Pipeline

$data = 'Zero','One','Two','Three'
$data | ForEach-Object {"Item: [$PSItem]"}

<#OUTPUT
Item: [Zero]
Item: [One]
Item: [Two]
Item: [Three]
#>

## Interaction: ForEach loop

foreach ( $node in $data )
{
    "Item: [$node]"
}

## Interaction: ForEach method

$data.foreach({"Item [$PSItem]"})

## Interaction: For loop

for ( $index = 0; $index -lt $data.count; $index++)
{
    "Item: [{0}]" -f $data[$index]
}

## Interaction: Switch loop

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

#endregion


#region About Arrays: ### Arrays of Objects

$processList = Get-Process
$processList

$data = @(
    [PSCustomObject]@{FirstName='Kevin';LastName='Marquette'}
    [PSCustomObject]@{FirstName='John'; LastName='Doe'}
)

$data[0]

$data[0].FirstName

$data | ForEach-Object {$_.LastName}

$data | Select-Object -ExpandProperty LastName

$data.LastName

## Where-Object filtering

$data | Where-Object {$_.FirstName -eq 'Kevin'}

## Where method

$data.Where({$_.FirstName -eq 'Kevin'})

## Updating objects in loops

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

#endregion


#region About Arrays: ### Operators

#endregion


#region About Arrays: ### Adding to arrays

#endregion


#region About Arrays: ### Array Types

#endregion



#region  About HashTables:
#endregion

#region  About PSCustomObject:
#endregion

#region  About if/then/else:
#endregion

#region  About switch:
#endregion

#region  About Exceptions:
#endregion

