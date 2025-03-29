$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/vial-kb/vial-gui/releases/download/v0.7.2/Vial-v0.7.2-setup.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  toolsDir       = $toolsDir
  url            = $url

  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Vial'
  checksum       = 'DF306993933E08F09809AA44AA8ED91C3F6D61789D04DF0A697717E326187313'
  checksumType   = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyPackage @packageArgs
