$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/extrawurst/gitui/releases/download/v0.11.0-rc2/gitui-win.tar.gz' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  softwareName  = 'gitui*'

  checksum      = 'DF7DAAACA2E957D95FF0EFF8533BF37A48390E1B424707FCCACFF0ED0ABF1F2E'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs 
Get-ChocolateyUnzip -FileFullPath (Join-Path -Path $toolsDir -ChildPath "gitui-win.tar") -Destination $toolsDir
