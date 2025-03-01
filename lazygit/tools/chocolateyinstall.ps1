$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.48.0/lazygit_0.48.0_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.48.0/lazygit_0.48.0_Windows_x86_64.zip'
    checksum      = '9F0480378151CC91A62E412FB8852B8B5CF4E8F66C70FCBABB33275278223359'
    checksum64    = '26BA0970FC399075826F8612DFDA39FE9E25114337264A0DC810C09CD25A758C'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
