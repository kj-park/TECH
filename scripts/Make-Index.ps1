

function Get-Indent {
    param (
        [String]$RootPath = $RootPath,
        [String]$TargetPath = $TargetPath
        <# Assign for Debugging
            [Object]$Root = $Root
            [Object]$Target = $Target
        #>
    )
    begin {
        $Indent = $null
    }
    process {
        if ( $TargetPath.Replace('\','') -match $RootPath.Replace('\','') -and $TargetPath.Length -ge $RootPath.Length ) {
            $Indent = ([Regex]::Matches($TargetPath.Replace($RootPath,""), '\\')).Count - 1
        }
        else { Write-Error -Message "ERROR: TargetFolder is not sub folder of Root" }
    }
    end { if ( $null -ne $Indent ) { return $Indent } }
}


function Get-Prefix {
    param ( $Indent = $Indent )
    begin { $Prefix = $null }
    process {
        if ( $Indent -eq 0 ) { $Prefix = "##" }
        elseif ( $Indent -eq 1 ) { $Prefix = "-" }
        elseif ( $Indent -gt 1 ) {
            for ($i = $Indent - 1; $i -gt 0; $i--) { $Prefix += "`t" }; $Prefix += "-"
        }
    }
    end { if ( $null -ne $Prefix ) { return $Prefix } }
}


function Get-Content {
    param (
        [Object]$Root = $Root,
        [Object]$Target = $Target,
        [Switch]$Link
        <# Assign for Debugging
            [Object]$Root = $Root
            [Object]$Target = $Target
            $Link = $true
        #>
    )
    begin { $Content = "" }
    process {
        if ( $Link ) {
            $Content = "[$($Target.BaseName.Replace("-"," "))]($($Target.FullName.Replace($Root.FullName,'/Tech').Replace('\','/').Replace(".md",'')))"
        }
        else {
            $Content = "$($Target.BaseName.Replace("-"," "))"
        }
    }
    end { return $Content }
}


function Get-TocContent {
    param (
        [String]$RootPath = 'C:\REPOSITORY\GITHUB\Tech',
        [String]$TargetPath
        <# Assign for Debugging
            [String]$RootPath = 'C:\REPOSITORY\GITHUB\Tech'
            [String]$TargetPath = 'C:\REPOSITORY\GITHUB\Tech\PowerShell'
        #>
    )
    begin {
        $Root = Get-Item -LiteralPath $RootPath
        $Target = Get-Item -LiteralPath $TargetPath
        $IsContainer = $Target.PSIsContainer

        $HasChildItems = $false
        $IsContents = $false
        if ( $IsContainer -and $Target.BaseName -ne "media" ) {
            $ChildItems = @(); $ChildItems = Get-ChildItem -Path $Target.FullName -Recurse:$false | Where-Object -FilterScript { $PSItem.Extension -eq ".md" -or $PSItem.PSIsContainer -and $PSItem.BaseName -ne "media" } | Sort-Object -Property BaseName
            if ( $ChildItems.Count -gt 0 ) {
                $HasChildItems = $true
            }
            $Items = Get-ChildItem -Path $Target.Parent.FullName -File | Where-Object -Property Extension -EQ -Value ".md"
            if ( $Items.BaseName -contains $Target.BaseName ) {
                $IsContents = $true
            }
        }
        else {
            if ( $Target.Extension -eq ".md" ) { $IsContents = $true }
        }
    }
    process {
        $Indent = Get-Indent -RootPath $RootPath -TargetPath $TargetPath
        $Prefix = Get-Prefix -Indent $Indent

        if ( $IsContents ) {
            $TocContent = "$Prefix $(Get-Content -Root $Root -Target $Target -Link)"
            if ( $TocContents.TocContent -notcontains $TocContent ) {
                $Global:TocContents += [PSCustomObject]@{
                    Indent = $Indent
                    TocContent = $TocContent
                    Path = $Target.FullName
                }
            }
        }
        else {
            $TocContent = "$Prefix $(Get-Content -Root $Root -Target $Target)"
            $Global:TocContents += [PSCustomObject]@{
                Indent = $Indent
                TocContent = $TocContent
                Path = $Target.FullName
            }
        }

        if ( $HasChildItems ) {
            foreach ( $Child in $ChildItems ) {
                Get-TocContent -RootPath $RootPath -TargetPath $Child.FullName -Out TocContents
            }
        }
    }
}


function Make-Index {
    param (
        [String]$RootPath = 'C:\REPOSITORY\GITHUB\Tech',
        [String]$IndexFile = 'C:\REPOSITORY\GITHUB\Tech\toc.md',
        $ContentFolders = @('AD','Exchange','Microsoft365','PowerShell','Learning','includes')
    )
    begin {
        $MarkdownString = "`n# Contents Index`n"
        Clear-Content -LiteralPath $IndexFile -Force
        Add-Content -LiteralPath $IndexFile -Value $MarkdownString -Force
        New-Variable -Name TocContents -Value @() -Force -Scope Global
    }
    process {          
        foreach ( $Folder in $ContentFolders ) {
            Get-TocContent -RootPath $RootPath -TargetPath "$RootPath\$Folder"
        }
        foreach ( $Toc in $TocContents ) {
            if ( $Toc.Indent -le 1 ) { Add-Content -LiteralPath $IndexFile -Value "" }
            Add-Content -LiteralPath $IndexFile -Value $Toc.TocContent
            if ( $Toc.Indent -le 1 ) { Add-Content -LiteralPath $IndexFile -Value "" }
        }
    }
}

Make-Index

