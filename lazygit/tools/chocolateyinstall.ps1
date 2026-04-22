$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.61.1/lazygit_0.61.1_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.61.1/lazygit_0.61.1_windows_x86_64.zip'
    checksum      = 'BB2EA2DE64135E0364FBF446B6FBE0E01AF51CC77240C7E95728BC2396843446'
    checksum64    = '6024F3094904CAAF9B9672B801CBA31A65AD36729A0D2C5A03C432F739C0678B'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
