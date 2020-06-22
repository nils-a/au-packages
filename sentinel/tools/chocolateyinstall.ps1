$ErrorActionPreference = 'Stop';

$packageName= 'sentinel'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/yarseyah/sentinel/releases/download/0.14.1/Sentinel-Setup-0.14.1.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  softwareName  = 'sentinel*'
  url           = $url
  silentArgs    = '--silent'

  checksum      = 'D58D8E3E52CF34B5882FBFD80FADCE375A1CA75CDBA878A63F71F33DE7D933B8'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs 
