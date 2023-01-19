$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installLog = Join-Path -Path $toolsDir -ChildPath "installed.txt"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.0/JetBrainsMono.zip'
    checksum      = '12C75A1EB7909460B53F203F160CBCF7315CC2805930511C4FE0901E5C48DC90'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$fontsFolder = (New-Object -ComObject Shell.Application).namespace(0x14).self.path
$nerdFontsBeforeInstall = Get-ChildItem -Path $fontsFolder -Filter "JetBrains Mono*Nerd Font*.ttf" | select -ExpandProperty Name

$fonts = Get-ChildItem $toolsDir -Filter "*Windows Compatible.ttf"
$paths = $fonts | select -ExpandProperty FullName
$names = $fonts | select -ExpandProperty Name
Write-Debug "Installing the following fonts`r`n - $($names -join "`r`n - ")"

$added = Install-ChocolateyFont $paths -Multiple
Write-Debug "Installed $added fonts."

$nerdFontsAfterInstall = Get-ChildItem -Path $fontsFolder -Filter "JetBrains Mono*Nerd Font*.ttf" | select -ExpandProperty Name
$newlyInstalledFonts = $nerdFontsAfterInstall | Where-Object { $nerdFontsBeforeInstall -notcontains $_ }
$newlyInstalledFonts | Out-File $installLog -Encoding unicode -Append
