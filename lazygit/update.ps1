import-module Chocolatey-AU
. $PSScriptRoot\..\_scripts\all.ps1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^\s*url\s*=\s*)('.*')"= "`$1'$($Latest.URL32)'"
            "(^\s*url64bit\s*=\s*)('.*')"= "`$1'$($Latest.URL64)'"
            "(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
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

    $releases = Get-LatestGithubReleases -repoUser "jesseduffield" -repoName "lazygit"
    $stable = $releases.latestStable | select -First 1

    Write-Output $stable
    $url = $stable.Assets | Where { $_ -like "*lazygit_*_Windows_32-bit.zip" } | select -First 1

    return @{
        URL32        = $url
        URL64        = $url.Replace('32-bit', 'x86_64')
        Version      = $stable.Version
        ReleaseNotes = $stable.ReleaseUrl
    }
}

update-package -ChecksumFor none -NoReadme