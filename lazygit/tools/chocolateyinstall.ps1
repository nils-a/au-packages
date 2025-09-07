$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.55.0/lazygit_0.55.0_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.55.0/lazygit_0.55.0_windows_x86_64.zip'
    checksum      = '30B4703094A8F47AF8089B79D8F4418A1CC18F89AC0CCDDD245B1702BAF13AD6'
    checksum64    = 'E0ADB62EB2FF619DBC2F1596FE469E1E31325541317637215882A0BF6332B87F'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
