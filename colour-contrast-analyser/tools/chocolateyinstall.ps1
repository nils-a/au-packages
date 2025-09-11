$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.5.5/CCA-Portable-x64-3.5.5.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = '0B09A7399F68B766E24072EFE251AFFC834C3B36BE795783DD8DCDD530E526C4'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
