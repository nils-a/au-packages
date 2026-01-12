$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$target = Join-Path -Path $toolsDir -ChildPath 'sbom-tool-win-x64.exe'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $target
    url           = 'https://github.com/microsoft/sbom-tool/releases/download/v4.0.2/sbom-tool-win-x64.exe'
    checksum      = '3FE29379138A43BF99A076AD1E60EFE6C0DFA1EEB0933141EF751EE77ADBDBD7'
    checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
