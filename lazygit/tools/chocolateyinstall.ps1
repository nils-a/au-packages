$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.38.1/lazygit_0.38.1_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.38.1/lazygit_0.38.1_Windows_x86_64.zip'
    checksum      = '8399A287EF42BFF4544A510083F60A129667694197A7DA3E69C1114B4BB70941'
    checksum64    = 'E4243C3F701BDEA72620278D3A2CE6EDB786C75BAB489CFFACE7E37B2D3B0E59'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
