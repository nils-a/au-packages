import-module au
. $PSScriptRoot\..\chrysalis\update.ps1

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

function global:au_GetLatest {

    $releases = Get-LatestGithubReleases -repoUser "keyboardio" -repoName "Chrysalis"
    $stable = $releases.latestStable | select -First 1

    $url = $stable.Assets | Where { $_ -like "*Chrysalis-*.Setup.exe" } | select -First 1

    return @{
        URL32        = $url
        Version      = $stable.Version
        ReleaseNotes = $stable.ReleaseUrl
    }
}

update-package -ChecksumFor none -NoReadme