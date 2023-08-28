$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://github.com/extrawurst/gitui/releases/download/v0.24.0/gitui-win.tar.gz' 

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  url           = $url

  softwareName  = 'gitui*'

  checksum      = 'A9D1121140B41171EE1ADAEA2BFADC743188CFC4F62779EE52F51643179C9BAD'
  checksumType  = 'sha256' 
}

Install-ChocolateyZipPackage @packageArgs 
$tarFile = Join-Path -Path $toolsDir -ChildPath "gitui-win.tar"
Get-ChocolateyUnzip -FileFullPath $tarFile -Destination $toolsDir
Remove-Item $tarFile
