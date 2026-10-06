$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.66.0/lazygit_0.66.0_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.66.0/lazygit_0.66.0_windows_x86_64.zip'
    checksum      = 'ED067613BEF886F3C28DAA2170FA24E58DB4719DE04FD7B14AFA29D95F17B015'
    checksum64    = 'ED8FAB4AF7B8BAC474084E976214A96569DEA841C9F9B293502B83D8C3163E4B'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
