
function Make-Index {
    param (
        [String]$Path = 'C:\REPOSITORY\GITHUB\Tech\',
        [String]$IndexFile = 'C:\REPOSITORY\GITHUB\Tech\index.md'
    )
    begin {
        $contentExts = @('.md')
        $RootPath = $Path
        $MarkdownString = "`n# Contents Index`n"
        $ContentFolders = @('ActiveDirectory','Exchange','Microsoft365','PowerShell','Learning','includes')
        function MakeIndex {
            param ( $TargetFolder, $RootPath, $Output, $Indent = 0 )
            process {
                #$TargetFolder = Get-Item -Path "$($RootPath)Microsoft365"
                #$RootPath = $TargetFolder.FullName.Replace($RootPath,"")
                $Indent = ([regex]::Matches($TargetFolder.FullName.Replace($RootPath,""), "\\")).Count
                $Contents = Get-ChildItem -Path $TargetFolder.FullName -Recurse:$false | Where-Object -FilterScript { $PSItem.Extension -in $contentExts } | Sort-Object -Property FullName
                foreach ( $Content in $Contents ) {
                    $textLabel = $Content.BaseName.Replace("-"," ")
                    $textUrl = $Content.FullName.Replace($RootPath,'').Replace('\','/').Replace(".md","")
                    $listPrefix = ""; for ($i = $Indent; $i -gt 0; $i--) { $listPrefix += "`t" }; $listPrefix += "-"
                    Add-Content -LiteralPath $Output -Value "$listPrefix [$textLabel]($textUrl)`n"
                }
                $Folders = Get-ChildItem -Path $TargetFolder.FullName -Directory -Recurse | Where-Object -FilterScript { $PSItem.Name -notcontains @('.media') } | Sort-Object -Property FullName
                foreach ( $Folder in $Folders ) {
                    $textLabel = $Content.BaseName.Replace("-"," ")
                    $textUrl = $Content.FullName.Replace($RootPath,'').Replace('\','/').Replace(".md","")
                    $listPrefix = ""; for ($i = $Indent; $i -gt 0; $i--) { $listPrefix += "`t" }; $listPrefix += "-"
                    Add-Content -LiteralPath $Output -Value "$listPrefix [$textLabel]($textUrl)`n"
                }

            }
        }
    }
    process {
        if ( Test-Path -LiteralPath $RootPath ) {
            Set-Content -LiteralPath $Output -Value $MarkdownString -Force            
            foreach ( $TopFolder in $ContentFolders ) {
                Add-Content -LiteralPath $Output -Value "## [$TopFolder]($TopFolder)`n"
                if ( Test-Path -LiteralPath "$RootPath$TopFolder") {
                    $Folder = Get-Item -Path "$RootPath$TopFolder" -ErrorAction SilentlyContinue
                    MakeIndexFolder -TargetFolder $Folder -RootPath $RootPath -Indent 0 -Output $Output
                }
                $IsExistFolders = $true; $Indent = 0
                $Folder | Get-ChildItem | Where-Object -FilterScript { $PSItem.}
                $Folders = Get-ChildItem -Path "$RootPath$TopFolder" -Directory -Recurse: $false | Where-Object -FilterScript { $PSItem.Name -notcontains @('.media') }
                foreach ( $subFolder in $Folders ) {
                    $Indent += 1
                    MakeIndexFolder -TargetFolder $Folder -RootPath $RootPath -Indent $Indent -Output $Output
                }
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
