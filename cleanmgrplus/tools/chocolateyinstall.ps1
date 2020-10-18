$ErrorActionPreference = 'Stop';

$packageName= 'cleanmgrplus'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/builtbybel/CleanmgrPlus/releases/download/1.135.1100/cleanmgr+.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'cleanmgrplus*'
  url           = $url

  checksum      = '497FB097CC5B7741488052D5FCF07B6460568F09247A335641AD9486E3CD4FB3'
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
