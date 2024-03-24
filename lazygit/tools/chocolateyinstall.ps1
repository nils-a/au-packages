$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.41.0/lazygit_0.41.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.41.0/lazygit_0.41.0_Windows_x86_64.zip'
    checksum      = '1DEB13CF3FABBC32F85F9745110EC8D167C2862FF0AF89B9D7AEC9A12C1641DE'
    checksum64    = '5A7875F78DA652AB717E647737BAB37D47728A000ED5C5020E60E58AB4E36528'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
