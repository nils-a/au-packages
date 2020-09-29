$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/extrawurst/gitui/releases/download/v0.10.1/gitui-win.tar.gz' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  softwareName  = 'gitui*'

  checksum      = '4C5D6EB65BCD8B9F3EBB35BB9EDDBB87F5E092EEF1159E6603F9EFF85B4C6BB4'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs 
Get-ChocolateyUnzip -FileFullPath (Join-Path -Path $toolsDir -ChildPath "gitui-win.tar") -Destination $toolsDir