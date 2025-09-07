#===================================================================================================
# CyborgAI Windows Build Release Script
# CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
#===================================================================================================

param(
    [string]$Features = "full"
)

$ErrorActionPreference = "Stop"

Write-Host "Building for Windows with features: $Features"

# Create release directory
New-Item -ItemType Directory -Force -Path "release" | Out-Null

# Build command
$BuildCmd = "cargo build --release"

if ($Features -ne "" -and $Features -ne "full") {
    $BuildCmd += " --features $Features"
}

Write-Host "Executing: $BuildCmd"
Set-Location "../app_cyborgai_cli"
Invoke-Expression $BuildCmd

# Find the built binary
$BinaryPath = "target/release/cyborgai_cli.exe"

if (-not (Test-Path $BinaryPath)) {
    Write-Error "Binary not found at $BinaryPath"
    exit 1
}

# Copy to release directory
$ReleaseName = "cyborgai_cli-x86_64-pc-windows-msvc.exe"
Copy-Item $BinaryPath "../build/release/$ReleaseName"

Write-Host "Build completed: release/$ReleaseName"