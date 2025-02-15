$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.46.0/lazygit_0.46.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.46.0/lazygit_0.46.0_Windows_x86_64.zip'
    checksum      = '907435CDDF650C05A0BE6A8FC56F47DC0BC01B4F73EE7C9B6687F40FD84FB1D5'
    checksum64    = 'EC4CFC820AA6BA1DC016001F6EB49100D1DC989F9BD7BEC1A3F330F649683B1D'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
