$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/vial-kb/vial-gui/releases/download/v0.7.2/Vial-v0.7.2-portable.zip' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  toolsDir      = $toolsDir
  url           = $url
  unzipLocation = $toolsDir

  softwareName  = 'usbimager*'
  checksum      = '8CE9F45BB3FEECEB60AC81140C6879E83B2F9F2A350D7C59981607C511A05310'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyZipPackage @packageArgs
