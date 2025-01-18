$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.45.2/lazygit_0.45.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.45.2/lazygit_0.45.2_Windows_x86_64.zip'
    checksum      = '71AC19C2C80F624A35C50A62628EB49E55131803F885C331DD72FB6074A70738'
    checksum64    = 'B7FE224F4C4A8D3729082C8D9DB550793F5F6EFACA67CDE426563ECAC37FBC89'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
