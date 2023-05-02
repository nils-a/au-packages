$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.38.0/lazygit_0.38.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.38.0/lazygit_0.38.0_Windows_x86_64.zip'
    checksum      = '5562267FAFB07D53CD3CF70EC21F78EB1BCC820A03558C55C70512DDA21A6813'
    checksum64    = 'A8834461664B5D0BB444537280B28C4EA5240E00A3A049B53D34FB86AA5C3151'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
