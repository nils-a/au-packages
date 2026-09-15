# ensure we have latest TLS enabled
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor [Net.SecurityProtocolType]::Tls12 -bor [Net.SecurityProtocolType]::Tls13

ls $PSScriptRoot\*.ps1 -Exclude all.ps1 | % { . $_ }
