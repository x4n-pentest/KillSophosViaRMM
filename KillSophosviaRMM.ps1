# Wechsle in den Temp-Ordner
Set-Location $env:TEMP

# Ziel-Dateiname
$zapFile = Join-Path $env:TEMP "SophosZap.exe"

# URL von Sophos
$url = "https://github.com/x4n-pentest/KillSophosViaRMM/raw/refs/heads/main/SophosZap.exe"

# Download der Datei
Write-Host "Lade SophosZap herunter..."
Invoke-WebRequest -Uri $url -OutFile $zapFile

# Warten bis Download abgeschlossen ist (sicherstellen, dass Datei existiert und nicht leer ist)
while (-not (Test-Path $zapFile) -or ((Get-Item $zapFile).Length -eq 0)) {
    Start-Sleep -Seconds 2
}

Write-Host "Download abgeschlossen. Starte SophosZap..."

# SophosZap mit Parameter --confirm ausführen
Start-Process -FilePath $zapFile -ArgumentList "--confirm" -Wait -NoNewWindow

Write-Host "SophosZap wurde ausgeführt."
