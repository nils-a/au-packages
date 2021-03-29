$ErrorActionPreference = 'Stop';

$packageName= 'cleanmgrplus'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/builtbybel/CleanmgrPlus/releases/download/1.37.1170/cleanmgr+.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'cleanmgrplus*'
  url           = $url

  checksum      = 'CFBE4484839E642C4F847D7830BF26138A3D04E7E4CFEFBD7321771AFB331A97'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath 'Cleanmgr+.exe'
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut = Join-Path -Path $desktop -ChildPath 'Cleanmgr+.lnk'
Install-ChocolateyShortcut `
   -ShortcutFilePath $shortcut `
   -TargetPath $target
