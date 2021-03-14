$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.26.1/lazygit_0.26.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.26.1/lazygit_0.26.1_Windows_x86_64.zip'
    checksum      = 'ACF8D5A0E922BBB15982B30BF48E9A1289309A24FE9F7FEF3226996E9E880F1F'
    checksum64    = 'A96D38C005F45A956FF17A8EC0B7F426152CD47FE6C4361C1317CE9D519CC5A2'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
