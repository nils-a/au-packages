$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.5.1/CCA-Portable-x64-3.5.1.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = 'E7767A611B28BE00C52CEA73E7FF35BE4A64B9A2E6B4756D11C15D25C93FC578'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
