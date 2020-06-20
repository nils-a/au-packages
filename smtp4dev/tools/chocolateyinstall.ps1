$ErrorActionPreference = 'Stop';

$packageName= 'smtp4dev'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/rnwood/smtp4dev/releases/download/v2.0.10/smtp4dev-2.0.10-binaries.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'smtp4dev*'
  url           = $url

  checksum      = 'ECEE7262066BE31643B26388536A42EFBF8E50C026A04EE4B61CBB15B64FEB09'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath 'smtp4dev.exe'
$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$shortcut = Join-Path -Path $desktop -ChildPath ($packageName + '.lnk')
Install-ChocolateyShortcut `
   -ShortcutFilePath $shortcut `
   -TargetPath $target
