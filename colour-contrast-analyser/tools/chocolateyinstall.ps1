$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.1.4/CCA-Portable-3.1.4.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = '6B79D97409D85A0742257AF720CBDC69D5FC0BEB8A0294CCBC9832FC01336B63'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
