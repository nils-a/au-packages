$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.54.2/lazygit_0.54.2_windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.54.2/lazygit_0.54.2_windows_x86_64.zip'
    checksum      = '776E70B012F62EC7B2815D52EDCB2E4FC64598DA4A243B3664F55DEF5C1799FE'
    checksum64    = '9C34AD93091060D8BCC3B1B4CED7216D3563AE09B4A5A04F786020D3B628CA23'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
