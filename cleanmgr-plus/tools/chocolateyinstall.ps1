$ErrorActionPreference = 'Stop';

$packageName= 'cleanmgrplus'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/builtbybel/CleanmgrPlus/releases/download/1.38.1200/cleanmgrplus.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'cleanmgrplus*'
  url           = $url

  checksum      = 'B9B7394F341B80155CF560899869A2CEBB24529AD5E88CC86107E8FCF327459B'
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
