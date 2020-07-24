import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases    = 'https://github.com/builtbybel/CleanmgrPlus/releases'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^\s*\`$url\s*=\s*)('.*')"= "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseNotes)`$2"
        }

        #".\legal\VERIFICATION.txt" = @{
        #  "(?i)(\s+x32:).*"            = "`${1} $($Latest.URL32)"
        #  "(?i)(checksum32:).*"        = "`${1} $($Latest.Checksum32)"
        #  "(?i)(Get-RemoteChecksum).*" = "`${1} $($Latest.URL32)"
        #}
    }
}

function global:au_BeforeUpdate { Get-RemoteFiles -Purge }

function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 4 -SkipLast 1 }

function global:au_GetLatest {

    $download_page = Invoke-WebRequest -Uri $releases
    # $download_page.links uses regex internally and is REAL SLOW when parsing large pages..
    $links = $download_page.RawContent.split(@("<a "), "None") | select -Skip 1
    Write-Host " - found $($links.Count) anchor-tags"
    $links = $links | % { $_.split(@(">"),2, "None")[0] } | % { $_.split(@("href="),2, "None")[1].Substring(1) } | % { $_.split(@(""""), 2, "None")[0] } | ? {![string]::IsNullOrWhiteSpace($_)}
    Write-Host " - found $($links.Count) links"

    $re  = "cleanmgr\+\.zip"
    $url =  $links | ? { $_ -match $re } | select -First 1 
    $url = 'https://github.com' + $url
    Write-Host "Found url: $url"

    $version =  $url -split '\/' | select -Last 2 | select -First 1
    Write-Host "Found version: $version"

    return @{
        URL32        = $url
        Version      = $version
        ReleaseNotes = "$releases/tag/${version}"
    }
}

update-package -ChecksumFor none -NoReadme