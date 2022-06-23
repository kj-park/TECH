
function Make-Index {
    param (
        [String]$Path = 'C:\REPOSITORY\GITHUB\Tech\',
        [String]$Output = 'index.md'
    )
    begin {
        $contentExts = @('.md')
        $baseUrl = 'https://kj-park.github.io/Tech/<RelativeUrl>'
        $RootPath = $Path
        $contentItems = $null
        $MarkdownString = "`n# Contents Index`n"
        $ContentFolders = @('ActiveDirectory','Exchange','Microsoft365','PowerShell','Learning','includes')
        $OutputPath = "$RootPath$Output"
    }
    process {
        if ( Test-Path -LiteralPath $RootPath ) {
            Set-Content -LiteralPath $OutputPath -Value $MarkdownString -Force
            
            foreach ( $itemFolder in $ContentFolders ) {
                Add-Content -LiteralPath $OutputPath -Value "## [$itemFolder]($itemFolder)`n"

                $Folders = Get-ChildItem -Path "$RootPath$itemFolder" -Directory -Recurse | Where-Object -FilterScript { $PSItem.Name -notcontains @('.media') }



                Add-Content -LiteralPath $OutputPath -Value "---`n"                
            }
            
            
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
