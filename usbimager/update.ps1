import-module au
. $PSScriptRoot\..\_scripts\all.ps1

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

    $releases = Get-LatestGitLabRelease -projectId "16936716"
    $stable = $releases.latestStable | select -First 1

    # usbimager has the released files in the "binaries" branch...
    #$releasedFiles = Get-GitLabRepoFiles -projectId "16936716" -branch "binaries" | ForEach-Object { $_.name }
    #Write-host "Found $($releasedFiles.length) released files..."
    #$winGdiRelease = $releasedFiles | Where-Object { $_ -like "usbimager_$($stable.Version)-i686-win-gdi.zip" }
    #Write-host "Win versions release is at : $($winGdiRelease)"
    $winGdiRelease = "usbimager_$($stable.Version)-i686-win-gdi.zip"
    $url = "https://gitlab.com/bztsrc/usbimager/raw/binaries/$($winGdiRelease)"

    return @{
        URL32        = $url
        Version      = $stable.Version
        ReleaseNotes = $stable.ReleaseUrl
    }
}

update-package -ChecksumFor none -NoReadme