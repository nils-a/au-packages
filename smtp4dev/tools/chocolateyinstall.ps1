$ErrorActionPreference = 'Stop';

$packageName= 'smtp4dev'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/rnwood/smtp4dev/releases/download/3.8.4/Rnwood.Smtp4dev-win-x64-3.8.4.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'smtp4dev*'
  url           = $url

  checksum      = '05951606236AE07CCDFEDC8AC4E30BA4AAC9B481B5946B33B618B860188DB17E'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath 'Rnwood.Smtp4dev.exe'

Write-Verbose "Adding shim"
Install-BinFile `
  -Name $packageName `
  -Path $target
