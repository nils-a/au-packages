$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/vial-kb/vial-gui/releases/download/v0.7.3/Vial-v0.7.3-setup.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  toolsDir       = $toolsDir
  url            = $url

  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Vial'
  checksum       = '5708B5AC792DF057B4D72A857A9F82CB027A9F720F4586333463E7F94D7BF326'
  checksumType   = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyPackage @packageArgs
