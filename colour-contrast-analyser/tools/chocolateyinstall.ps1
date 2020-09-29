$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.1.1/CCA-Portable32-3.1.1.exe' 
$url64      = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.1.1/CCA-Portable64-3.1.1.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url
  url64bit      = $url64

  softwareName  = 'colour-contrast-analyser*'

  checksum      = '7BC7EC919314EC3DE36885EE4CF033E1FF112EAA5AC40C253A6C0C522EE17A65'
  checksumType  = 'sha256' 
  checksum64    = '50EBE9CE830AC7D0679AA3570F3E564F4BA1C543713EF839BCDF08DBAB9D932C'
  checksumType64= 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
