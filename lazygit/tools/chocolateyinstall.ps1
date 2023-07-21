$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.39.1/lazygit_0.39.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.39.1/lazygit_0.39.1_Windows_x86_64.zip'
    checksum      = 'C05EF0D91627FC6D61AF5EEE66E408C62C4FD8A7283C2D61D94A8C05D87DA11D'
    checksum64    = '840869E2ADE16B2B92FD7BF84A1B49F660F29EC7860319919CB3F9A829D046F5'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
