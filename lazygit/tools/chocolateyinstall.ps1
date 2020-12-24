$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.24/lazygit_0.24_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.24/lazygit_0.24_Windows_x86_64.zip'
    checksum      = '84B8DC8C8E9BBEDB67D7DA18987BD7E818222E7A54BCED04B50D9BFB2C5BC893'
    checksum64    = '825150A58961775AF71A0DC62B1369DFD9E6F573BF35E296725A81076CAA2ED7'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
