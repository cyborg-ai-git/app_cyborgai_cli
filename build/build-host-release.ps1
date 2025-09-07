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

# Build command - use zigbuild for cross-compilation
$BuildCmd = "cargo zigbuild --release --target x86_64-pc-windows-msvc"

if ($Features -ne "" -and $Features -ne "full") {
    $BuildCmd += " --features $Features"
}

Write-Host "Executing: $BuildCmd"

# Determine if we're in the build directory or root directory
if (Test-Path "app_cyborgai_cli") {
    # We're in the root directory
    Set-Location "app_cyborgai_cli"
    $BuildDir = "../build"
} elseif (Test-Path "../app_cyborgai_cli") {
    # We're in the build directory
    Set-Location "../app_cyborgai_cli"
    $BuildDir = "../build"
} else {
    Write-Error "Cannot find app_cyborgai_cli directory"
    exit 1
}

Invoke-Expression $BuildCmd

# Find the built binary
$BinaryPath = "target/x86_64-pc-windows-msvc/release/cyborgai_cli.exe"

if (-not (Test-Path $BinaryPath)) {
    Write-Error "Binary not found at $BinaryPath"
    exit 1
}

# Copy to release directory
$ReleaseName = "cyborgai_cli-x86_64-pc-windows-msvc.exe"
New-Item -ItemType Directory -Force -Path "$BuildDir/release" | Out-Null
Copy-Item $BinaryPath "$BuildDir/release/$ReleaseName"

Write-Host "Build completed: release/$ReleaseName"