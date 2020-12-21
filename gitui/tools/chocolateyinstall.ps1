$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/extrawurst/gitui/releases/download/v0.11.0/gitui-win.tar.gz' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  softwareName  = 'gitui*'

  checksum      = '08CEAB5041AC4052807127AB3AD76437B84093D64D30FA98F9103CA42EBF868C'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs 
$tarFile = Join-Path -Path $toolsDir -ChildPath "gitui-win.tar"
Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir
Remove-Item $tarFile
