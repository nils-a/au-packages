$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.31/lazygit_0.31_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.31/lazygit_0.31_Windows_x86_64.zip'
    checksum      = '8989F3568FFE06D74EB73D6ADBE2BEEEA15961895781734D8371DA0777638F3C'
    checksum64    = 'F4ADC9FA86124F0E093954EF310D057F1D4D32C14FC84387196743436432CA5C'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
