import-module Chocolatey-AU
. $PSScriptRoot\..\_scripts\all.ps1

$releases    = 'https://logging.apache.org/chainsaw/2.x/download.html'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^\s*\`$url\s*=\s*)('.*')"= "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^\s*\`$version\s*=\s*)('.*')"= "`$1'$($Latest.Version)'"
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
    Write-Host "Chainsaw: Before WebRequest"
    $download_page = Invoke-WebRequest -Uri $releases -Verbose -ConnectionTimeoutSeconds 20 -MaximumRetryCount 3 -RetryIntervalSec 5
    Write-Host "Chainsaw: After WebRequest"

    $re  = "apache-chainsaw-.*.zip"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    Write-Host "Mirror-page url is $url"

    $version = $url -split "/" | select -Last 2 | select -First 1

    Write-Host "Current version is $version"

    $url = "https://downloads.apache.org/logging/chainsaw/$version/apache-chainsaw-$version-standalone.zip"

    Write-Host "download url is $url"

    Write-Host "Chainsaw: update done."

    return @{
        URL32        = $url
        Version      = $version
        ReleaseNotes = "https://logging.apache.org/chainsaw/2.x/changes-report.html#a${version}"
    }
}

update-package -ChecksumFor none -NoReadme