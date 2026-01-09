$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$target = Join-Path -Path $toolsDir -ChildPath 'sbom-tool-win-x64.exe'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $target
    url           = 'https://github.com/microsoft/sbom-tool/releases/download/v3.0.0/sbom-tool-win-x64.exe'
    checksum      = 'A765619675E48E3D4A029C5B30907BAEB7EF1C90A3D4FAA1290A3D0D763B6251'
    checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
