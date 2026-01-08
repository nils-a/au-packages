import-module Chocolatey-AU
. $PSScriptRoot\..\_scripts\all.ps1

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^\s*url\s*=\s*)('.*')"= "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum32)'"
        }

        "$($Latest.PackageName).nuspec" = @{
            "(?smi)(\<releaseNotes\>).*?(\</releaseNotes\>)" = "`${1}$($Latest.ReleaseUrl)`$2"
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
    # skip auth on Microsoft - my token does not confirm to their rules.
    $release = Get-LatestGithubReleases -repoUser microsoft -repoName sbom-tool -skipAuth $true | select -ExpandProperty latest

    return @{
        Version      = $release.Version
        URL32        = $release.Assets | ? { $_ -match '\.exe$' }
        ReleaseNotes = $release.Body
        ReleaseUrl   = $release.ReleaseUrl
        PackageName  = 'sbom-tool-cli'
      }
}

update-package -ChecksumFor none -NoReadme