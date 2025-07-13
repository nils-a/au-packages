$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/vial-kb/vial-gui/releases/download/v0.7.4/Vial-v0.7.4-setup.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  toolsDir       = $toolsDir
  url            = $url

  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Vial'
  checksum       = 'F84BC59BFD992B3F593B06387D5F73C0FA30EA0BC2F39ED8CF36CC4CB53787BD'
  checksumType   = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyPackage @packageArgs
