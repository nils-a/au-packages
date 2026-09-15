$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.65.0/lazygit_0.65.0_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.65.0/lazygit_0.65.0_windows_x86_64.zip'
    checksum      = 'BBC83AAA8ADA679873DA1629A591018EF49380A3B92F08957CF405A729EB8A0A'
    checksum64    = '20A597E8F29D4ED295E28FB4B869B31A41D20DC69DC15829C4744263141BE2EE'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
