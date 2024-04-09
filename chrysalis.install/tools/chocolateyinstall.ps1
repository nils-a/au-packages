$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/keyboardio/Chrysalis/releases/download/v0.13.2/Chrysalis-0.13.2.Setup.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  softwareName  = 'chrysalis*'
  url           = $url
  silentArgs    = '--silent'

  checksum      = '7B815EF8879CCBEF831BC8115D58C004EF3695208634B4DF6D0A3E27C614A6BB'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
