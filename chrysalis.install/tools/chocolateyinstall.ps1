$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/keyboardio/Chrysalis/releases/download/v0.13.3/Chrysalis-0.13.3.Setup.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  softwareName  = 'chrysalis*'
  url           = $url
  silentArgs    = '--silent'

  checksum      = '7F4F9343D76D38C4FD4359CAAAD42583B6670A06804D95CF8E286B3B6016F638'
  checksumType  = 'sha256'
}

Install-ChocolateyPackage @packageArgs
