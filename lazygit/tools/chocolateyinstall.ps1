$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.20.4/lazygit_0.20.4_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.20.4/lazygit_0.20.4_Windows_x86_64.zip'
    checksum      = 'defbb5a359e512a06ad0421ab421fcda7be19eef2ab66823d7a03bfce86d28b3'
    checksum64    = '9198c3a57a5aad293c4a22eef02232f13f75a55e68f28e80d46e68e651996cf0'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs