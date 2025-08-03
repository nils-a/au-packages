$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/vial-kb/vial-gui/releases/download/v0.7.5/Vial-v0.7.5-setup.exe' # download url, HTTPS preferred

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  installerType  = 'exe'
  toolsDir       = $toolsDir
  url            = $url

  silentArgs     = '/S'
  validExitCodes = @(0)
  softwareName   = 'Vial'
  checksum       = 'F885F4EEE8D0553DEF5670465CF105D7399A1C5D71B115A7A5700D11C3225273'
  checksumType   = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyPackage @packageArgs
