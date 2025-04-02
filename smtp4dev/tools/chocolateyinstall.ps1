$ErrorActionPreference = 'Stop';

$packageName= 'smtp4dev'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/rnwood/smtp4dev/releases/download/3.7.1/Rnwood.Smtp4dev-win-x64-3.7.1.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'smtp4dev*'
  url           = $url

  checksum      = '4DB79A3978AAF904D87F4651D6EFD4954E8FD78270FDCFA9C2461F058BE5D21E'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath 'Rnwood.Smtp4dev.exe'

Write-Verbose "Adding shim"
Install-BinFile `
  -Name $packageName `
  -Path $target
