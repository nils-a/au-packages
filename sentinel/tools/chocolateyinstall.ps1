$ErrorActionPreference = 'Stop';

$packageName= 'sentinel'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/yarseyah/sentinel/releases/download/0.13.4.0/Sentinel-Setup-0.13.4.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  softwareName  = 'sentinel*'
  url           = $url
  silentArgs    = '--silent'

  checksum      = '0FB3B882CFE9D13FBBEB0486BC5417F4AF92B37610D8A502BFCFE94C1C4620F3'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs 
