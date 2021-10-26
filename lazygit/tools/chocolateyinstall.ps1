$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.30.1/lazygit_0.30.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.30.1/lazygit_0.30.1_Windows_x86_64.zip'
    checksum      = 'FF950A0B0B24D4931E4DB62FC34D7659468F94494BCEF76F8D41E285B002EBD3'
    checksum64    = 'B37D39582E06837888C6065CDE2E324B062AF6BFF8914C6BF404D80F649C416C'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
