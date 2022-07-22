$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.35/lazygit_0.35_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.35/lazygit_0.35_Windows_x86_64.zip'
    checksum      = '5BBA83673FC93443CB614973558D1B7820579BF880F2685C9422CC3211F23A55'
    checksum64    = 'A2E0164602B9FF5265BAAAAAEAA15AE5DDD49AFD20EEE9CF1572074F2C0340CC'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
