$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.31.3/lazygit_0.31.3_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.31.3/lazygit_0.31.3_Windows_x86_64.zip'
    checksum      = '48E980CD26323C5961F5E80FDA653091FF94C5756DF2EEC2251606404F1F052A'
    checksum64    = '76DC50C6D027790C35B06DC602D8B56C3F0550AC1C4F825793F6F165ACE14B15'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
