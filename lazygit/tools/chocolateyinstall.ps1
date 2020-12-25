$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.24.2/lazygit_0.24.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.24.2/lazygit_0.24.2_Windows_x86_64.zip'
    checksum      = 'EA41D4AE2E1A35391B45CD3AE34FFCF77FCE1BCD2DB77C8024397CBF6E9293EB'
    checksum64    = 'E90F448EFE4FDBC404842778213738D08FC6DB590BA6A57B0803BF4520AF2415'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
