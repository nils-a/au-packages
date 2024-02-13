$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$target = Join-Path -Path $toolsDir -ChildPath 'sbom-tool-win-x64.exe'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $target
    url           = 'https://github.com/microsoft/sbom-tool/releases/download/v0.2.2/sbom-tool-win-x64.exe'
    checksum      = '38D6AB084DF74DC39ED3E52A6C1B4F56C4FA00570CEC03A599F8AD1027FCC850'
    checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
