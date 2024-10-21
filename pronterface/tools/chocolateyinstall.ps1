$ErrorActionPreference = 'Stop';

$packageName= 'pronterface'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/kliment/Printrun/releases/download/printrun-2.2.0/printrun-2.2.0_windows_x64_py3.10.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'pronterface*'
  url           = $url

  checksum      = '828559B08F957986EADE7C0B6A547CBE68B72924A4D2D3961820F8F1D578E423'
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
