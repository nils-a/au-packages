$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://gitlab.com/bztsrc/usbimager/raw/binaries/usbimager_1.0.10-i686-win-gdi.zip' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  toolsDir      = $toolsDir
  url           = $url
  unzipLocation = $toolsDir

  softwareName  = 'usbimager*'
  checksum      = '7C57380C050F186E420AA60A15A0F16B047539160D98BC2B7CAE97882FF992CA'
  checksumType  = 'sha256' #default is md5, can also be sha1, sha256 or sha512
}

Install-ChocolateyZipPackage @packageArgs
$subDir = Join-Path -Path $toolsDir -ChildPath USBImager
Move-Item -Path (Join-Path -Path $subDir -ChildPath USBImager.exe) -Destination $toolsDir
Remove-Item $subDir -Force
