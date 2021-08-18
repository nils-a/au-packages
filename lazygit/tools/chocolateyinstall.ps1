$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.29/lazygit_0.29_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.29/lazygit_0.29_Windows_x86_64.zip'
    checksum      = '647E11C18DEEE5F2311BEFECC07576DDBE61442C307312D28813A8FBD3B57782'
    checksum64    = 'B105C519DD23369ABCC4C9AEE342F2C6086B60B97E8D1A19F7EE28AACDB2C420'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
