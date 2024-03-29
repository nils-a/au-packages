﻿$ErrorActionPreference = 'Stop' # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$url        = 'https://github.com/keyboardio/Chrysalis/releases/download/v0.13.3/Chrysalis-win32-x64-0.13.3.zip' # download url, HTTPS preferred

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  softwareName  = 'chrysalis*'
  url           = $url

  checksum      = '83D73F39031AE415E1A79733DD175A6DB1C698C11FD7FE27496071A798538D47'
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
