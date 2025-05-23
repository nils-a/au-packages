$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.51.0/lazygit_0.51.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.51.0/lazygit_0.51.0_Windows_x86_64.zip'
    checksum      = '1134D0E2F3714FC2E4AC9F3C496AA0802513012322889DB6ABCAD5B9E1DC9471'
    checksum64    = '0C1D57D42F07F11AB5284975A574A03E3B849389E4D43C5B495BAF4A8ACC4FD2'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
