import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases    = 'https://github.com/rnwood/smtp4dev/releases/latest'

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

    $re  = "smtp4dev-2\..*-binaries\.zip" # use the standalone version 2
    $url =  $download_page.links | ? href -match $re | select -First 1 -expand href
    $url = 'https://github.com' + $url
    Write-Host "Found url: $url"

    $version = $url -split '-|.zip' | select -Last 1 -Skip 2
    Write-Host "Found version: $version"

    return @{
        URL32        = $url
        Version      = $version
        ReleaseNotes = "$releases/tag/${version}"
    }
}

update-package -ChecksumFor none -NoReadme