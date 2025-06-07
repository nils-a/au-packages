$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.52.0/lazygit_0.52.0_Windows_x86_64.zip'
    checksum      = '5A29A09C28E5FCA304B5B8484E771B1E316BF242B7D20CC71DAF1344F1780EF8'
    checksum64    = '44735E93CAAE639E31A6B63B3400A05D2BFCFD167015D96F5BBE897D4F886F9F'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
