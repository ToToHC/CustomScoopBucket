param(
    [string]$manifest
)

if (!(Test-Path $manifest)) {
    Write-Error "Manifest file not found: $manifest"
    exit 1
}

# Lade das Manifest
$json = Get-Content $manifest -Raw | ConvertFrom-Json

# Prüfe ob URL existiert
if (-not $json.url) {
    Write-Error "No URL found in manifest."
    exit 1
}

# Temporäre Download-Datei
$tempFile = "$env:TEMP\scoop_temp_file"

Write-Output "Downloading: $($json.url)"
Invoke-WebRequest -Uri $json.url -OutFile $tempFile

# Berechne SHA256
$hash = (Get-FileHash $tempFile -Algorithm SHA256).Hash.ToLower()

# Hash ersetzen
$json.hash = $hash

# Manifest zurückschreiben (formatiert)
$json | ConvertTo-Json -Depth 10 | Out-File $manifest -Encoding utf8

Write-Output "✅ Hash updated for: $manifest"
Write-Output "SHA256: $hash"

# Aufräumen
Remove-Item $tempFile -Force
