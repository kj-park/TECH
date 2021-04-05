<#
.OUTPUTS
System.Boolean

.EXAMPLE
> Test-eValidate -Parameter "cn=Park. Kyoungjoon,ou=users,ou=Infra dept,dc=lab,dc=feelanet,dc=com" -Type DistringuishedName -Verbose
VERBOSE: Pattern >> (?<CNs>(CN=(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s),)*)(?<OUs>(OU=(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s),)*)(?<DCs>(DC=(?!-)[a-zA-Z0-9-]{1,63}(?<!-),)+DC=[a-zA-Z]{2,63}).
VERBOSE: Parameter  >> cn=Park. Kyoungjoon,ou=users,ou=Infra dept,dc=lab,dc=feelanet,dc=com.
VERBOSE: [cn=Park. Kyoungjoon,ou=users,ou=Infra dept,dc=lab,dc=feelanet,dc=com] has the validated pattern
True

.EXAMPLE
> Test-eValidate -Parameter "outlook.lab.feelanet.com" -Type Fqdn -Verbose
VERBOSE: Pattern >> (?<Fqdn>(?=^.{4,253}$)(^((?!-)[a-zA-Z0-9-]{1,63}[a-zA-Z0-9]\.)+[a-zA-Z]{2,63}$)).
VERBOSE: Parameter  >> outlook.lab.feelanet.com.
VERBOSE: [outlook.lab.feelanet.com] has the validated pattern
True

.EXAMPLE
> Test-eValidate -Parameter "lab.feelanet.com/Infra Dept/Users/Park. Kyoungjoon" -Type CanonicalName -Verbose
VERBOSE: Pattern >> (?<CanonicalName>(?<DnsDomain>((?!-)[a-zA-Z0-9-]{1,63}[a-zA-Z0-9]\.)+[a-zA-Z]{2,63})(?<RdnCn>(\/(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s))+)).
VERBOSE: Parameter  >> lab.feelanet.com/Infra Dept/Users/Park. Kyoungjoon.
VERBOSE: [lab.feelanet.com/Infra Dept/Users/Park. Kyoungjoon] has the validated pattern
True
#>
function Test-iNamespace {
    [CmdletBinding()]
    [OutputType([Boolean])]
    param (
        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ValueFromPipeline = $true)]
        [Object]$Parameter,

        [Parameter(DontShow)]
        $ValidatePatterns = $Patterns
    )

    DynamicParam {
        $paramAttributes = New-Object System.Management.Automation.ParameterAttribute
        $paramAttributes.ParameterSetName = "__AllParameterSets"
        $paramAttributes.Mandatory = $true
        $paramAttributes.ValueFromPipeline = $true
        $paramAttributes.ValueFromPipelineByPropertyName = $true
        $attributeCollection = New-Object System.Collections.ObjectModel.Collection[System.Attribute]
        $attributeCollection.Add($paramAttributes)
        $ValidatePatterns = . "$eScriptingRoot\Resources\patterns.ps1"
        [String[]]$ValidateSetPatterns = @()
        foreach ( $ValidatePattern in $ValidatePatterns.Keys ) { $ValidateSetPatterns += $ValidatePattern }
        $attributeCollection.Add((New-Object System.Management.Automation.ValidateSetAttribute($ValidateSetPatterns)))
        $eTypeDynamicParam = New-Object System.Management.Automation.RuntimeDefinedParameter("Type", [String], $attributeCollection)
        $paramDictionary = New-Object System.Management.Automation.RuntimeDefinedParameterDictionary
        $paramDictionary.Add("Type", $eTypeDynamicParam)
        return $paramDictionary
    }

    begin {
        $Patterns = @{
            CommonName         = "(?<CNs>(CN=(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s),)+)"
            OrganazationalUnit = "(?<OUs>(OU=(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s),)+)"
            Rdn                = "(?<Rdn>(?<CNs>(CN=(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s),)*)(?<OUs>(OU=(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s),)*))"
            DomainComponent    = "(?<DomainComponent>(DC=(?!-)[a-zA-Z0-9-]{1,63}(?<!-),)+DC=[a-zA-Z]{2,63})"
            DistringuishedName = "(?<CNs>(CN=(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s),)*)(?<OUs>(OU=(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s),)*)(?<DCs>(DC=(?!-)[a-zA-Z0-9-]{1,63}(?<!-),)+DC=[a-zA-Z]{2,63})"
            CanonicalName      = "(?<CanonicalName>(?<DnsDomain>((?!-)[a-zA-Z0-9-]{1,63}[a-zA-Z0-9]\.)+[a-zA-Z]{2,63})(?<RdnCn>(\/(?!\s)[\w!@#$%^&*()\-'\.\s]{1,64}(?<!\s))+))"
            Fqdn               = '(?<Fqdn>(?=^.{4,253}$)(^((?!-)[a-zA-Z0-9-]{1,63}[a-zA-Z0-9]\.)+[a-zA-Z]{2,63}$))'
            LdapFilter         = '^\((\&|\||\!)((?<filter>\(\w+[\~\<\>]*\=[\*\w]+\))+|(?<filters>\((\&|\||\!)(\(\w+[\~\<\>]*\=[\*\w]+\))+\))+)+\)$'
        }
        $Type = $paramDictionary.Type.Value
    }

    process {
        $IsValidated = $false
        if ( $Parameter.GetType().FullName -eq "System.String") {
            $ValidatePattern = $ValidatePatterns."$Type"
            Write-Verbose "Pattern >> $ValidatePattern."
            Write-Verbose "Parameter  >> $Parameter."
            if ( $Parameter -match $ValidatePattern ) {
                $IsValidated = $true
                Write-Verbose "[$Parameter] has the validated pattern"
            }
        }
        return $IsValidated
    }
}