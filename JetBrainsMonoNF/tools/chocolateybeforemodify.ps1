$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$installLog = Join-Path -Path $toolsDir -ChildPath "installed.txt"

# if the package was force-installed multiple times
# the list of installed fonts will be empty and uninstall will 
# not remove all that was installed.
# Hence, I hard-coded the current font-names here for backup.
$staticNames = @(
 "JetBrains Mono Bold Italic Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono Bold Italic Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono Bold Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono Bold Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono ExtBd Ita Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono ExtBd Ita Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono Extra Bold Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono Extra Bold Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono ExtraBold ExBd I Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono ExtraBold ExBd I Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono ExtraBold ExtBd Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono ExtraBold ExtBd Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono Italic Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono Italic Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono Medium Italic Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono Medium Italic Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono Medium Med Ita Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono Medium Med Ita Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono Medium Medium Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono Medium Medium Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono Medium Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono Medium Nerd Font Complete Windows Compatible.ttf",
 "JetBrains Mono Regular Nerd Font Complete Mono Windows Compatible.ttf",
 "JetBrains Mono Regular Nerd Font Complete Windows Compatible.ttf"
)

$toUninstall = @()
if(Test-Path $installLog) {
  $toUninstall = Get-Content $installLog -Encoding unicode
}


if($toUninstall.length -lt 1) {
  $toUninstall = $staticNames
}

$removed = Uninstall-ChocolateyFont $toUninstall -Multiple
Write-Debug "Removed $removed previously installed fonts."
