$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.65.1/lazygit_0.65.1_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.65.1/lazygit_0.65.1_windows_x86_64.zip'
    checksum      = 'EC90B68D285438F871F754313EBA1E28841F46B5B1AEFF84F66F8A7917AEACDE'
    checksum64    = 'BED669BE29204932560836A58DC6519BA43C10EA7DC7DF63AF8A1D96424E191D'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
