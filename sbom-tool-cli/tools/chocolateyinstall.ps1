$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$target = Join-Path -Path $toolsDir -ChildPath 'sbom-tool-win-x64.exe'

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    fileFullPath  = $target
    url           = 'https://github.com/microsoft/sbom-tool/releases/download/v0.2.1/sbom-tool-win-x64.exe'
    checksum      = '65E775629DA8D5537448571ACE9E9883BDD3AD5EAEAFA330D284B80C16A275A4'
    checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs
