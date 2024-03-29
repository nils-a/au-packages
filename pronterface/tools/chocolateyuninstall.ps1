﻿$ErrorActionPreference = 'Stop';

Write-Verbose "Removing Desktop-Link"
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut = Join-Path -Path $desktop -ChildPath 'pronterface.lnk'
if(Test-Path $shortcut) {
  Remove-Item $shortcut
}