$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.30/lazygit_0.30_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.30/lazygit_0.30_Windows_x86_64.zip'
    checksum      = '363483FB32B291036C0B1B552871D17DB5ED4D2B7DD6A159431A92936F1235B3'
    checksum64    = '802CA23EDA65282A44D4CECC33CA4D1F1C638D19A7F9FB1ECB798C1FC5FD8813'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
