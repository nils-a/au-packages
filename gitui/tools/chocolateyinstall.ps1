$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/gitui-org/gitui/releases/download/v0.28.1/gitui-win.tar.gz' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  softwareName  = 'gitui*'

  checksum      = 'FAB116CCDF9AE4E17378DB912D76CC26E60AEFD2226F44E665120DEA166867E4'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs 
$tarFile = Join-Path -Path $toolsDir -ChildPath "gitui-win.tar"
Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir
Remove-Item $tarFile
