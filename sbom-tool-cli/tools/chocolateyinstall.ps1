$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$target = Join-Path -Path $toolsDir -ChildPath 'sbom-tool-win-x64.exe'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $target
    url           = 'https://github.com/microsoft/sbom-tool/releases/download/v2.2.3/sbom-tool-win-x64.exe'
    checksum      = '7EB333402C7F4F80CEEE28D9D3DD70571BB52F03AD14859AAD83A4476CF93C62'
    checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
