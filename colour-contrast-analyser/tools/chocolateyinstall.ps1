$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.5.2/CCA-Portable-x64-3.5.2.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = 'F73221E4F1A52B2EB3BD5A2C52C05F1ECC3D4C6E53C28FA33F4923DDEA5711F7'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
