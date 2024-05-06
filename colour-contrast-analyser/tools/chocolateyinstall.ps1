$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.5.3/CCA-Portable-x64-3.5.3.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = '35DB45BDD55D092919066E58EE6AD1E5DB1A38F04E12D6709ADC360590BEAB33'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
