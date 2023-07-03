$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://gitlab.com/bztsrc/usbimager/raw/binaries/usbimager_1.0.9-i686-win-gdi.zip' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  toolsDir      = $toolsDir
  url           = $url
  unzipLocation = $toolsDir

  softwareName  = 'usbimager*'
  checksum      = '9A90E605F51EC091F89D5E4B281092690B1737320D5200122E9B2CF58790C1EA'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyZipPackage @packageArgs
$subDir = Join-Path -Path $toolsDir -ChildPath USBImager
Move-Item -Path (Join-Path -Path $subDir -ChildPath USBImager.exe) -Destination $toolsDir
Remove-Item $subDir -Force
