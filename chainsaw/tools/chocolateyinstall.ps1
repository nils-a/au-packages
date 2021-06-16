$ErrorActionPreference = 'Stop';

$packageName= 'chainsaw'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://downloads.apache.org/logging/chainsaw/2.1.0/apache-chainsaw-2.1.0-standalone.zip'
$version    = '2.1.0'

$packageArgs = @{
  packageName   = $packageName
  softwareName  = 'chainsaw*'
  url           = $url
  unzipLocation = $toolsDir

  checksum      = '50F2B5CC594CD46621925CFA68D3FCA99D4BD7E6A5BC29F01CBFE451037C01EE'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

$batPath = Join-Path $toolsDir "apache-chainsaw-$version\bin\chainsaw.bat"
Install-BinFile `
  -Name $packageName `
  -Path $batPath
