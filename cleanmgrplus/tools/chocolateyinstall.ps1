$ErrorActionPreference = 'Stop';

$packageName= 'cleanmgrplus'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/builtbybel/CleanmgrPlus/releases/download/1.36.1141/cleanmgr+.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'cleanmgrplus*'
  url           = $url

  checksum      = '2A8C51DD258EA89AADF4EF8D296317D7C21ACCAE3FE04DC6BE32E35B95D81B6B'
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
