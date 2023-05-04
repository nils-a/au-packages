$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.3.0/CCA-Portable-x64-3.3.0.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = '38A7B0ECFB37AD9DC85170BBF90BD3DF4E266EBB37ECA2ADE3146B8D603C865F'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
