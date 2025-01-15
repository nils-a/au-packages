$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/extrawurst/gitui/releases/download/v0.27.0/gitui-win.tar.gz' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  softwareName  = 'gitui*'

  checksum      = 'DD2DF2D8887B42BBA4C5410DCDB8E4C9AB1DE8C3E996D37AD3082D105E702B15'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs 
$tarFile = Join-Path -Path $toolsDir -ChildPath "gitui-win.tar"
Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir
Remove-Item $tarFile
