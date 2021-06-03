
function Make-Contents {
    param (
        [String]$Path,
        [String]$Output = 'images.md'
    )
    begin {
        $contentExts = @('.png','.jpg','.svg')
        $baseUrl = 'https://github.com/kj-park/tech/blob/main/<RelativeUrl>?raw=true'
        $RootPath = 'C:\REPOSITORY\GITHUB\Tech\'
        $contentItems = $null
        $MarkdownString = "`n# Image Contents`n`n"

    }
    process {
        if ( Test-Path -LiteralPath $Path ) {
            $contentItems = Get-ChildItem -Path $Path -Recurse:$false | Where-Object -FilterScript { $PSItem.Extension -in $contentExts }
            if ( $contentItems.Count -ne 0 ) {
                $mdFile = New-Item -Path $Path -Name $Output -ItemType File -Value $MarkdownString -Force
                foreach ( $item in $contentItems ) {
                    $Url = $baseUrl.Replace('<RelativeUrl>',($item.FullName.Replace($RootPath,'').Replace('\','/')))
                    Add-Content -LiteralPath ($mdFile.FullName) -Value "- $($item.BaseName)`n`n`t![$($item.BaseName)]($Url)`n`n[Top](#)`n`n---`n"
                }
            }
        }
    }
    end {}
}

Make-Contents -Path 'C:\REPOSITORY\GITHUB\Tech\Microsoft365\Security\.media'
