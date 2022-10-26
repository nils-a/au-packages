$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = "SearchQueryTool"
  unzipLocation = $toolsDir
  url           = 'https://github.com/pnp/PnP-Tools/releases/download/v2.10.0-Search-QueryTool/SearchQueryToolv2.10.0.zip'

  checksum      = 'BA24A4B84EBDDA797F023E512F5657C76DF725084D5CA42D6AE0E21BF8D7C87F'
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
