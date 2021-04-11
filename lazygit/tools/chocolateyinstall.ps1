$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.27.4/lazygit_0.27.4_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.27.4/lazygit_0.27.4_Windows_x86_64.zip'
    checksum      = '6BBBED6067264512A571FE93023B69E86DF2D0797DBFB42F90AA392350209A52'
    checksum64    = '5766AE0101004F8F2AD8FF6DB6EF0F111A8C35843BDDDACE49A74FA624BCBA21'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
