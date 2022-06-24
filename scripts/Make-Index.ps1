

function Get-Indent {
    param (
        [String]$Root = 'C:\REPOSITORY\GITHUB\Tech',
        [String]$TargetFolder # $TargetFolder = 'C:\REPOSITORY\GITHUB\Tech\Microsoft365\Security'
    )
    begin { $Indent = $null }
    process {
        if ( $TargetFolder.Replace('\','') -match $Root.Replace('\','') -and $TargetFolder.Length -gt $Root.Length ) {
            $Indent = ([Regex]::Matches($TargetFolder.Replace($Root,""), '\\')).Count - 1
        }
        else {
            Write-Error -Message "ERROR: TargetFolder is not sub folder of Root"
        }
    }
    end { return $Indent }
}


function Make-IndexFolder {
    param ( 
        $Folder, 
        $Root = 'C:\REPOSITORY\GITHUB\Tech', 
        $OutFile = 'C:\REPOSITORY\GITHUB\Tech\toc.md'
    )
    begin {
        <#
        $Folder = Get-Item -Path C:\REPOSITORY\GITHUB\Tech\Microsoft365
        #>
        $Indent = Get-Indent -Root $Root -TargetFolder $Folder.FullName
        if ( $null -ne $Indent ) {
            $listItemPrefix = ""; for ($i = $Indent; $i -gt 0; $i--) { $listItemPrefix += "`t" }; $listItemPrefix += "-"
        }
    }
    process {
        if ( $Indent -eq 0 ) {
            Add-Content -LiteralPath $OutFile -Value "## $($Folder.Name)`n"
        }
        else {
            $listPrefix = ""; for ($i = $Indent - 1; $i -gt 0; $i--) { $listPrefix += "`t" }; $listPrefix += "-"
            Add-Content -LiteralPath $OutFile -Value "$listPrefix $($Folder.Name)`n"
        }
        $mdContents = $Folder.EnumerateFiles() | Where-Object -Property Extension -EQ -Value '.md' | Sort-Object -Property Name

        foreach ( $mdContent in $mdContents ) {
            $ListItemLabel = $mdContent.BaseName.Replace("-"," ")
            $ListItemUrl = $mdContent.FullName.Replace($Root,'').Replace('\','/').Replace(".md","")
            Add-Content -LiteralPath $OutFile -Value "$listItemPrefix [$ListItemLabel]($ListItemUrl)"
        }
        Add-Content -LiteralPath $OutFile -Value ""
    }
}

# Make-IndexFolder -Folder (Get-Item -Path C:\REPOSITORY\GITHUB\Tech\Microsoft365\Teams)



function Make-Index {
    param (
        [String]$Path = 'C:\REPOSITORY\GITHUB\Tech',
        [String]$IndexFile = 'C:\REPOSITORY\GITHUB\Tech\toc.md'
    )
    begin {
        $Root = $Path
        $ContentFolders = @('ActiveDirectory','Exchange','Microsoft365','PowerShell','Learning','includes')
        $MarkdownString = "`n# Contents Index`n"
        Clear-Content -LiteralPath $IndexFile -Force
        Add-Content -LiteralPath $IndexFile -Value $MarkdownString -Force
    }
    process {          
        foreach ( $Folder in $ContentFolders ) {
            $TopFolder = Get-Item -Path "$Root\$Folder"
            Make-IndexFolder -Folder $TopFolder -Root $Root
            $Folders = Get-ChildItem -Path $TopFolder.FullName -Directory -Recurse | Where-Object -Property Name -NE -Value ".media" | Sort-Object -Property FullName
            foreach ( $Folder in $Folders ) { Make-IndexFolder -Folder $Folder -Root $Root }
        }
    }
    end {}
}

Make-Index
