$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/vial-kb/vial-gui/releases/download/v0.7.1/Vial-v0.7.1-setup.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  toolsDir       = $toolsDir
  url            = $url

  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Vial'
  checksum       = 'C62D2EEEF9AF839B618DDB42474D9BFE84800D4A2B089927E50EC3AC0CC5F742'
  checksumType   = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyPackage @packageArgs
