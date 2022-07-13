$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.2.0/CCA-Portable-3.2.0.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = '6F8C98D86B82CB8F423CEE733FCD2881C1DD3C6922CF458D8B0DE4BC00399020'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
