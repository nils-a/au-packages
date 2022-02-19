$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/jesseduffield/lazygit/releases/download/v0.33/lazygit_0.33_Windows_32-bit.zip'
    url64bit      = 'https://github.com/jesseduffield/lazygit/releases/download/v0.33/lazygit_0.33_Windows_x86_64.zip'
    checksum      = '477C6848C1A6F152473940B64AA30ED4B0002846BAA1BBD1C3D2E945697CAC0C'
    checksum64    = '80E9D7849CA86077B56238E680484F6EC1D4D6EFB39B036C8A601538E396D399'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
