import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases    = 'https://logging.apache.org/chainsaw/2.x/download.html'

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

    $re  = "apache-chainsaw-.*-standalone.zip"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    Write-Host "Mirror-page url is $url"

    # url points only to the latest mirror-url...
    $download_page = Invoke-WebRequest -Uri $url
    $re  = "^https://.*$re" # no http/ftp[s]
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    Write-Host "download url is $url"
    # now we're done.

    $version = $url -split '-|.zip' | select -Last 1 -Skip 2
    Write-Host "latest version is $version"

    return @{
        URL32        = $url
        Version      = $version
        ReleaseNotes = "https://logging.apache.org/chainsaw/2.x/changes-report.html#a${version}"
    }
}

update-package -ChecksumFor none -NoReadme