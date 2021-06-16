$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.1.3/CCA-Portable-3.1.3.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = 'F79E908D40F7D9113E809B45773D193E826638F5BA5941614854F4A228A31ED8'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
