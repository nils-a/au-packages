$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.58.1/lazygit_0.58.1_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.58.1/lazygit_0.58.1_windows_x86_64.zip'
    checksum      = 'DAD6C71C8C77F337DE13147927B896D805EED2B63ABEE2B77A9347A439B39015'
    checksum64    = '81F6F925E7EB97B32F89DD9C3597FED245F26FE81C7162A2470D501051F996DD'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
