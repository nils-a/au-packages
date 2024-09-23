$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.5.4/CCA-Portable-x64-3.5.4.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = '10AAB8CDE56792DA8C08A8A5E80F14C8B7D8D7E02D9A364E17FB1EDE7DC49151'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
