$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/extrawurst/gitui/releases/download/v0.24.1/gitui-win.tar.gz' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  softwareName  = 'gitui*'

  checksum      = '37BFA1881E3F5FC3742F2F2C31C5F5815870C3D50D8C1B0E5410DF7BA95E8D15'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs 
$tarFile = Join-Path -Path $toolsDir -ChildPath "gitui-win.tar"
Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir
Remove-Item $tarFile
