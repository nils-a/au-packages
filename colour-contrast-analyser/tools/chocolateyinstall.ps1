$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/ThePacielloGroup/CCAe/releases/download/v3.2.1/CCA-Portable-x64-3.2.1.exe' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  FileFullPath  = (Join-Path $toolsDir "cca.exe")
  url           = $url

  softwareName  = 'colour-contrast-analyser*'

  checksum      = '32969E6ADB6F5A976B70940C54D067AE37E30F72CC63627D390AC755A658AFA4'
  checksumType  = 'sha256' 
}

Get-ChocolateyWebFile @packageArgs 
