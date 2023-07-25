$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.39.4/lazygit_0.39.4_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.39.4/lazygit_0.39.4_Windows_x86_64.zip'
    checksum      = 'E59B91B4BE3D3C0CB25F4A724C397A9F1787C9AA14CDA13A762E1BCD7DBC7FD3'
    checksum64    = 'B0627531546569D8824029EA6C50932EFA4C7BB7A1A7F715C5B3C35F6DBD47DC'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
