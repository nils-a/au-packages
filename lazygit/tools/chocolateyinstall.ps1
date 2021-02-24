$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.25.1/lazygit_0.25.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.25.1/lazygit_0.25.1_Windows_x86_64.zip'
    checksum      = '245396B81BD2274D76855772B11E868DD05EE5EADE4D66EF7BEDBE94B640A532'
    checksum64    = 'A286492AE894D4A2BE3427E2678D62D0BD8AD9B342FECA22E833878F8B4F4FEF'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
