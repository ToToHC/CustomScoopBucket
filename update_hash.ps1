param(
    [string]$manifest
)

# Lade das Manifest
$json = Get-Content $manifest | ConvertFrom-Json

# Download Datei
$tempFile = "$env:TEMP\scoop_temp_file"
Invoke-WebRequest -Uri $json.url -OutFile $tempFile

# Berechne SHA256
$hash = (Get-FileHash $tempFile -Algorithm SHA256).Hash.ToLower()

# Hash eintragen
$json.hash = $hash

# Zurückschreiben
$json | ConvertTo-Json -Depth 10 | Out-File $manifest -Encoding utf8

Write-Output "✅ Hash für $manifest aktualisiert: $hash"
Remove-Item $tempFile
