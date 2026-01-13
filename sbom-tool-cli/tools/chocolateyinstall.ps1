$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$target = Join-Path -Path $toolsDir -ChildPath 'sbom-tool-win-x64.exe'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $target
    url           = 'https://github.com/microsoft/sbom-tool/releases/download/v4.1.5/sbom-tool-win-x64.exe'
    checksum      = '625767B371B7FDD58F40F618B8A86DA0247A33C89E419039C86B4EDBA1DAD4B5'
    checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
