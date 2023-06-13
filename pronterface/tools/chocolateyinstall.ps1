$ErrorActionPreference = 'Stop';

$packageName= 'pronterface'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/kliment/Printrun/releases/download/printrun-2.0.1/printrun-2.0.1_windows_x64_py3.10.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'pronterface*'
  url           = $url

  checksum      = '3A35834A2F84A985CB36164BA18CA5E886E971C127A961D56721AE7D44582D92'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath 'pronterface.exe'
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut = Join-Path -Path $desktop -ChildPath 'pronterface.lnk'
Install-ChocolateyShortcut `
   -ShortcutFilePath $shortcut `
   -TargetPath $target
