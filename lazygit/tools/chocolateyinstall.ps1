$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.32.2/lazygit_0.32.2_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.32.2/lazygit_0.32.2_Windows_x86_64.zip'
    checksum      = 'FDE9CB76995C0F157576CD3AC1498CEBEDBB2CBC1FF8323761D35DB302972D83'
    checksum64    = '044244EAADAA85221BE75C850DBE2AD4B633BE5E0C1729871F8FFFC6E4F63104'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
