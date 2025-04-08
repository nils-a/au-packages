$ErrorActionPreference = 'Stop';

$packageName= 'smtp4dev'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/rnwood/smtp4dev/releases/download/3.8.0/Rnwood.Smtp4dev-win-x64-3.8.0.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'smtp4dev*'
  url           = $url

  checksum      = '0BB16AFED91C1BF40FD5708E672DC9ADBFBE2F263EA20F81BD288A7689AA80B7'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath 'Rnwood.Smtp4dev.exe'

Write-Verbose "Adding shim"
Install-BinFile `
  -Name $packageName `
  -Path $target
