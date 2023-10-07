$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.4.2/CCA-Portable-x64-3.4.2.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = 'B33EEDDD5CA5E46853935A03002AFD437C12F8B8A0CE1E2D2CDAE9C83CF3F982'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
