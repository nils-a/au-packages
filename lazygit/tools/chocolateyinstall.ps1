$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.39.2/lazygit_0.39.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.39.2/lazygit_0.39.2_Windows_x86_64.zip'
    checksum      = '2BA38C23C41944A8C6305A683F566C0B9E0D5B6C6686C2087D3C25A594FC51E6'
    checksum64    = 'E76B987EA4F01EE32735824D035F035D2DA5A65E49AA1B789998A19E68406ADB'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
