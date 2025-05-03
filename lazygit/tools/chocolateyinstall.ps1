$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.50.0/lazygit_0.50.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.50.0/lazygit_0.50.0_Windows_x86_64.zip'
    checksum      = 'FB86FF97FB31ECFA10047203CAE6BBC2DAF206E3DD71C5A07B6F05EC23479652'
    checksum64    = 'FB0856002B900764B780C195EFA5358C08E58345610C5C640D145F73CE2049B8'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
