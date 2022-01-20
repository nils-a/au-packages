$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "SearchQueryTool"
  unzipLocation = $toolsDir
  url           = 'https://github.com/pnp/PnP-Tools/releases/download/v2.9.0-Search-QueryTool/SearchQueryToolv2.9.0.zip'

  checksum      = '503C5B3471F87AC06AC1058F0391EBE925947E062F5CF8C165D40B3DD447D3CD'
  checksumType  = "sha256"
}

Install-ChocolateyZipPackage @packageArgs 

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath "SearchQueryTool.exe"
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut = Join-Path -Path $desktop -ChildPath "SearchQueryTool.lnk"
Install-ChocolateyShortcut `
   -ShortcutFilePath $shortcut `
   -TargetPath $target
