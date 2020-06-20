$ErrorActionPreference = 'Stop';

$packageName= 'smtp4dev'
Write-Verbose "Removing Desktop-Link"
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut = Join-Path -Path $desktop -ChildPath ($packageName + '.lnk')
if(Test-Path $shortcut) {
  Remove-Item $shortcut
}