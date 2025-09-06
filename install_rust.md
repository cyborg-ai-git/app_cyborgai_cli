# Install Rust

## Overview
Rust is required to build and run the CyborgAI CLI application. This guide provides multiple installation methods for different operating systems.

## Linux

### Method 1: Rustup (Recommended)
```bash
# Install Rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.bashrc
```

### Method 2: Package Managers

**Ubuntu/Debian:**
```bash
sudo apt update && sudo apt install rustc cargo
```

**Fedora/RHEL/CentOS:**
```bash
sudo dnf install rust cargo
```

**Arch Linux:**
```bash
sudo pacman -S rust
```

**openSUSE:**
```bash
sudo zypper install rust cargo
```

## macOS

### Method 1: Rustup (Recommended)
```bash
# Install Rust using rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source ~/.zshrc
```

### Method 2: Homebrew
```bash
brew install rust
```

### Method 3: MacPorts
```bash
sudo port install rust
```

## Windows

### Method 1: Rustup (Recommended)
1. Download `rustup-init.exe` from [https://rustup.rs/](https://rustup.rs/)
2. Run the installer and follow the prompts

### Method 2: Package Managers

**Using winget:**
```bash
winget install Rust.Rustup
```

**Using Chocolatey:**
```bash
choco install rust
```

**Using Scoop:**
```bash
scoop install rust
```

## Verify Installation

After installation, verify that Rust is properly installed:

```bash
rustc --version
cargo --version
```

You should see version information for both `rustc` (the Rust compiler) and `cargo` (the Rust package manager).

## Troubleshooting

### Path Issues
If the `rustc` or `cargo` commands are not found, you may need to add Rust to your PATH:

**Linux/macOS:**
```bash
echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Windows:**
The installer usually handles this automatically, but you may need to restart your terminal or add `%USERPROFILE%\.cargo\bin` to your PATH environment variable.

### Update Rust
To update Rust to the latest version:
```bash
rustup update
```

## Next Steps
Once Rust is installed, you can proceed with cloning and building the CyborgAI CLI application.