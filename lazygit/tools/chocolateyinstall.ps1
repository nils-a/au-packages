$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.54.1/lazygit_0.54.1_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.54.1/lazygit_0.54.1_windows_x86_64.zip'
    checksum      = '46FC4BE4C101B38C052A99567133E4D3EB3A3EEF731AFFAF7CD8A70B7FD5560B'
    checksum64    = '647F73AC2B2397E52C05E7791230833DA1D2D354ABF878980A038E6E5524F824'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
