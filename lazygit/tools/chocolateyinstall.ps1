$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.47.1/lazygit_0.47.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.47.1/lazygit_0.47.1_Windows_x86_64.zip'
    checksum      = '3CADA6F0D28D733B6343391F81FD95038A4940C6C24BBD03FA15D6260789FBAF'
    checksum64    = '5E0F5D6DF89BEB0B84CDC0EAC1B3DC7B6061EBE47EC856BD0710610B82527D9D'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
