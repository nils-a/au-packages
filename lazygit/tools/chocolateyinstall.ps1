$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.45.0/lazygit_0.45.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.45.0/lazygit_0.45.0_Windows_x86_64.zip'
    checksum      = 'DA3B4FD711A599EEBDED646DA572777D694C533E9504319E2CAE77400F3766DA'
    checksum64    = '9994B828751B3546EA3EA886D2C616C8BAC322F7476ABECCED43EF1EE3D40FE9'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
