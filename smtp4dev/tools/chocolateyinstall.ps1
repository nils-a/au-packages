$ErrorActionPreference = 'Stop';

$packageName= 'smtp4dev'
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/rnwood/smtp4dev/releases/download/3.1.3.2/Rnwood.Smtp4dev-win-x64-3.1.3.2.zip'

$packageArgs = @{
  packageName   = $packageName
  unzipLocation = $toolsDir
  softwareName  = 'smtp4dev*'
  url           = $url

  checksum      = 'E7D7BA6D8A67597D5127AB1FE2D357E61AD3106FA77921192070E8014631C41E'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs 

Write-Verbose "Adding Desktop-Link"
$target = Join-Path -Path $toolsDir -ChildPath 'Rnwood.Smtp4dev.exe'

Write-Verbose "Adding shim"
Install-BinFile `
  -Name $packageName `
  -Path $target
