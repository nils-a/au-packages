$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installLog = Join-Path -Path $toolsDir -ChildPath "installed.txt"

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation = $toolsDir
    url           = 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/JetBrainsMono.zip'
    checksum      = '977F16DCB70C45B8DDB5C00CA1276352FF6BFD0E5054C8628EA36F62712ECDF9'
    checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$fileFilter = "JetBrainsMono*.ttf"

$fontsFolder = (New-Object -ComObject Shell.Application).namespace(0x14).self.path
$nerdFontsBeforeInstall = Get-ChildItem -Path $fontsFolder -Filter $fileFilter | select -ExpandProperty Name

$fonts = Get-ChildItem $toolsDir -Filter $fileFilter
$paths = $fonts | select -ExpandProperty FullName
$names = $fonts | select -ExpandProperty Name
Write-Debug "Installing the following fonts`r`n - $($names -join "`r`n - ")"

$added = Install-ChocolateyFont -Paths $paths -Multiple
Write-Debug "Installed $added fonts."

$nerdFontsAfterInstall = Get-ChildItem -Path $fontsFolder -Filter $fileFilter | select -ExpandProperty Name
$newlyInstalledFonts = $nerdFontsAfterInstall | Where-Object { $nerdFontsBeforeInstall -notcontains $_ }
$newlyInstalledFonts | Out-File $installLog -Encoding unicode -Append
