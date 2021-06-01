$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.1.2/CCA-Portable-3.1.2.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = '3DF7EC7FC3A90DC16A026365CD7615811188866892FC5AEA1198A30BE94F2084'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
