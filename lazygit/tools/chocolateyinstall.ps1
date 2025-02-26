$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.47.2/lazygit_0.47.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.47.2/lazygit_0.47.2_Windows_x86_64.zip'
    checksum      = '5384BD5195D287CC52A7FB60AB9DEBE9E8BAB88005E8D6E83EEF299F63EC73B8'
    checksum64    = 'DEE678BB6EC5F0FB710365D993D567374AD8B4A23BB9015F09B089EBB8F20A48'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
