$ErrorActionPreference = 'Stop';

$packageName= 'smtp4dev'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/rnwood/smtp4dev/releases/download/3.7.0.1/Rnwood.Smtp4dev-win-x64-3.7.0.1.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'smtp4dev*'
  url           = $url

  checksum      = '48A0BB5B32DACD2A98FF975E251D18CA096C8EF948209005266E554B7D31ED6A'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath 'Rnwood.Smtp4dev.exe'

Write-Verbose "Adding shim"
Install-BinFile `
  -Name $packageName `
  -Path $target
