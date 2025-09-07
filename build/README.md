# Build Scripts

This directory contains build scripts for creating cross-platform releases of the CyborgAI CLI.

## Scripts

- `build-release` - Cross-compilation build script for Linux targets
- `build-host-release` - Native build script for Unix systems (Linux/macOS)
- `build-host-release.ps1` - Native build script for Windows

## Usage

These scripts are primarily used by GitHub Actions for automated builds, but can be run locally:

```bash
# Cross-compile for a specific target
./build-release -t x86_64-unknown-linux-musl

# Build for current host
./build-host-release -t x86_64-apple-darwin
```

## Output

Built binaries are placed in the `release/` directory with the naming convention:
`cyborgai_cli-{target}[.exe]`

## GitHub Actions Integration

The `.github/workflows/build_release.yml` workflow uses these scripts to:
1. Build binaries for multiple platforms
2. Attach them to GitHub releases automatically
3. Support both tagged releases and manual workflow dispatch