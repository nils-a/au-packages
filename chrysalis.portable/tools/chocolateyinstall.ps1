$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/keyboardio/Chrysalis/releases/download/v0.13.2/Chrysalis-win32-x64-0.13.2.zip' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  softwareName  = 'chrysalis*'
  url           = $url

  checksum      = '2E90F63BA68E4A0D8AD6A31588C209003DF51483C88EADBF192FDF34799E1F77'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$files = Get-ChildItem -Path $toolsDir -Recurse -Filter *.exe
$files | ForEach-Object {
  if($_.BaseName -ne "Chrysalis")
  {
    New-Item -Path "$($_.FullName).ignore" -type "file" -force | Out-Null # Generate an ignore file(s)
  }
}
