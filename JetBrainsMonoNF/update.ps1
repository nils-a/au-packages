import-module au
. $PSScriptRoot\..\_scripts\all.ps1

$releases    = 'https://www.nerdfonts.com/font-downloads'

function global:au_SearchReplace {
   @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(^\s*url\s*=\s*)('.*')"= "`$1'$($Latest.URL32)'"
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

function global:au_AfterUpdate  {  }

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $releases
    # $download_page.links uses regex internally and is REAL SLOW when parsing large pages..
    $links = $download_page.RawContent.split(@("<a "), [stringsplitoptions]::None) | select -Skip 1
    Write-Host " - found $($links.Count) anchor-tags"
    $links = $links | % { $_.split(@(">"),2, [stringsplitoptions]::None)[0] } | % { $_.split(@("href="),2, [stringsplitoptions]::None)[1].Substring(1) } | % { $_.split(@(""""), 2, [stringsplitoptions]::None)[0] } | ? {![string]::IsNullOrWhiteSpace($_)}
    Write-Host " - found $($links.Count) links"

    $re  = "JetBrainsMono\.zip" 
    $url =  $links | ? { $_ -match $re } | select -First 1 
    Write-Host "Found url: $url"

    $version = $url -split '/' | select -Last 2 | select -First 1
    $version = $version.Substring(1)
    Write-Host "Found version: $version"

    return @{
        URL32        = $url
        Version      = $version
        ReleaseNotes = "https://github.com/ryanoasis/nerd-fonts/releases/tag/v${version}"
    }
}

update-package -ChecksumFor none -NoReadme