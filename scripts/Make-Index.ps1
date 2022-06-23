
function Make-Index {
    param (
        [String]$Path,
        [String]$Output = '.index.md'
    )
    begin {
        $contentExts = @('.md')
        $baseUrl = 'https://kj-park.github.io/Tech/<RelativeUrl>'
        $RootPath = 'C:\REPOSITORY\GITHUB\Tech\'
        $contentItems = $null
        $MarkdownString = "`n# Contents Index`n`n"
        $Path = $RootPath

    }
    process {
        if ( Test-Path -LiteralPath $Path ) {
            $contentItems = Get-ChildItem -Path $Path -Recurse:$true | Where-Object -FilterScript { $PSItem.Extension -in $contentExts }
            if ( $contentItems.Count -ne 0 ) {
                $mdFile = New-Item -Path $Path -Name $Output -ItemType File -Value $MarkdownString -Force
                foreach ( $item in $contentItems ) {
                    $Url = $baseUrl.Replace('<RelativeUrl>',($item.FullName.Replace($RootPath,'').Replace('\','/')))
                    Add-Content -LiteralPath ($mdFile.FullName) -Value "- [$($item.BaseName)]($Url)"
                }
            }
        }
    }
    end {}
}

Make-Index
