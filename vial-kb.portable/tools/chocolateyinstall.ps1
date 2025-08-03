$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/vial-kb/vial-gui/releases/download/v0.7.5/Vial-v0.7.5-portable.zip' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  toolsDir      = $toolsDir
  url           = $url
  unzipLocation = $toolsDir

  softwareName  = 'usbimager*'
  checksum      = '503063AF4B3B2B1596A811FE1D81CD4D4FAB720CD328197E5AAD3AA31F1E68CD'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyZipPackage @packageArgs
