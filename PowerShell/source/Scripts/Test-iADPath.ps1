<#
.EXAMPLE
Test-eADPath -DistinguishedName 'OU=Users,OU=KPOP,OU=AX,DC=lab,DC=feelanet,DC=com'
True
#>
function Test-iADPath {
    [CmdletBinding()]
    [OutputType([Boolean])]
    Param (
        [String]$DistinguishedName
    )

    Begin {
        $result = $false
    }

    Process {
        if ( Test-iNamespace -Parameter $DistinguishedName -Type DistringuishedName ) {
            try {
                if ( [System.DirectoryServices.DirectoryEntry]::Exists("LDAP://$DistinguishedName") ) {
                    $result = $true
                }
                else {
                    Write-Verbose -Message "$DistinguishedName >> The specified AD Object does not exist."
                    return $result
                }
            }
            catch {
                Write-Verbose -Message "$DistinguishedName >> The specified domain either does not exist or could not be contacted."
                return $result
            }
        }
        return $result
    }
}