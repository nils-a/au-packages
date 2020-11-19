$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.23.7/lazygit_0.23.7_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.23.7/lazygit_0.23.7_Windows_x86_64.zip'
    checksum      = '1716739E52A2522512D25AEDE6A9D5DBC530170310E898F7DCB9DC0985740870'
    checksum64    = '3FC25B7095834C02475253893B84DD162705AEDD4C91DCC6FE57C492D0C10FFD'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
