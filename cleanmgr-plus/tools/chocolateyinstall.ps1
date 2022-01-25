$ErrorActionPreference = 'Stop';

$packageName= 'cleanmgrplus'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/builtbybel/CleanmgrPlus/releases/download/1.50.1300/cleanmgrplus.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'cleanmgrplus*'
  url           = $url

  checksum      = '5F70463CDE65755406667E82B53CE5B77C94CB471663584592123D206E3986D7'
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
