$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.28.2/lazygit_0.28.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.28.2/lazygit_0.28.2_Windows_x86_64.zip'
    checksum      = 'DB1E139BBD27788D85926869F3000A1EEE608961220C6DB79728A80B127F30B6'
    checksum64    = '60A8A6D432D0902792F4A7DBC43D9845CB262A55E6498DA4C1B1D8F7D297AF53'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
