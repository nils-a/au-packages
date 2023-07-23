$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.39.3/lazygit_0.39.3_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.39.3/lazygit_0.39.3_Windows_x86_64.zip'
    checksum      = 'B03929BBED5EAE26B6E78D82714CFD5F7E5708D847BF8EC2962AEDF6B0CE7BA1'
    checksum64    = '889814BDC35B46C1C39BCF6BEA7D9FB9D763FD18AC38EC71DF2CFDEBAFEA8BA0'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
