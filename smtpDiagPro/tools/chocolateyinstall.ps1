$ErrorActionPreference = 'Stop'; # stop on all errors
$url        = '' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  url           = $url
  url64bit      = $url64
  file          = $fileLocation

  softwareName  = 'smtpDiagPro*'

  checksum      = ''
  checksumType  = 'sha256'
}

Install-ChocolateyInstallPackage @packageArgs
