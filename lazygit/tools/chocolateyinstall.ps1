$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.55.1/lazygit_0.55.1_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.55.1/lazygit_0.55.1_windows_x86_64.zip'
    checksum      = '4FD67F9C7E42E3ACE1B1D70D49161A3818BBAC3B4BC4B156289C59034947D166'
    checksum64    = '061385101E80ED99CBDA1B9243B9F1A691B63DF656E6D025B395642B76262E02'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
