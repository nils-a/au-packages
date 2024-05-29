$ErrorActionPreference = 'Stop';

$packageName= 'pronterface'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/kliment/Printrun/releases/download/printrun-2.1.0/printrun-2.1.0_windows_x64_py3.10.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'pronterface*'
  url           = $url

  checksum      = '34BFE4A0B5784EE4365CC28C7AF73D2D062F145A964CBFF36575F965E93D5B3A'
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
