import-module au
. $PSScriptRoot\..\_scripts\all.ps1

function global:au_SearchReplace {
    @{
        "$($Latest.PackageName).nuspec" = @{
          "(\<dependency .+?`"$($Latest.PackageName).install`" version=)`"([^`"]+)`"" = "`$1`"[$($Latest.Version)]`""
        }
      }
}

function global:au_AfterUpdate  { Set-DescriptionFromReadme -SkipFirst 4 -SkipLast 1 }

function global:au_GetLatest {

    $releases = Get-LatestGithubReleases -repoUser "keyboardio" -repoName "Chrysalis"
    $stable = $releases.latestStable | select -First 1

    $url = $stable.Assets | Where { $_ -like "*Chrysalis-win32-x64-*.zip" } | select -First 1

    return @{
        URL32        = $url
        Version      = $stable.Version
        ReleaseNotes = $stable.ReleaseUrl
    }
}

if ($MyInvocation.InvocationName -ne '.') {
    update-package -ChecksumFor none -NoReadme
}