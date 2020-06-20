$ErrorActionPreference = 'Stop';

$packageName= 'chainsaw'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'http://www-eu.apache.org/dist/logging/chainsaw/2.0.0/apache-chainsaw-2.0.0-standalone.zip'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'chainsaw*'
  url           = $url
  unzipLocation = $toolsDir

  checksum      = 'b90b0e180f76772cf84e2844e54ddfaa6a5fb2e5a68c0f96eef2503785f299e6'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

$batPath = Join-Path $toolsDir "apache-chainsaw-2.0.0\bin\chainsaw.bat"
Install-BinFile `
  -Name $packageName `
  -Path $batPath