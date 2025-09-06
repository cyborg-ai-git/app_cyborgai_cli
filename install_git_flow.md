# Install Git Flow

## Overview
Git Flow is a branching model for Git that provides a robust framework for managing larger projects. It's used in this project for organized development workflow.

## What is Git Flow?
Git Flow defines a strict branching model designed around project releases. It provides:
- **master**: Production-ready code
- **develop**: Integration branch for features
- **feature/***: Feature development branches
- **release/***: Release preparation branches
- **hotfix/***: Critical bug fixes

## Installation

### Linux

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install git-flow
```

**Fedora/RHEL/CentOS:**
```bash
sudo dnf install gitflow
```

**Arch Linux:**
```bash
sudo pacman -S git-flow
```

**openSUSE:**
```bash
sudo zypper install git-flow
```

### macOS

**Using Homebrew:**
```bash
brew install git-flow
```

**Using MacPorts:**
```bash
sudo port install git-flow
```

### Windows

**Using Git for Windows:**
Git Flow is included with Git for Windows. If not available:

**Using Chocolatey:**
```bash
choco install gitflow
```

**Using Scoop:**
```bash
scoop install git-flow
```

## Manual Installation (Alternative)

If package managers don't work, you can install Git Flow manually:

```bash
# Clone the git-flow repository
git clone https://github.com/nvie/gitflow.git
cd gitflow

# Install (Linux/macOS)
sudo make install

# For Windows, follow the instructions in the repository
```

## Verify Installation

Check if Git Flow is properly installed:
```bash
git flow version
```

## Initialize Git Flow in Your Repository

The CyborgAI CLI scripts will automatically initialize Git Flow, but you can also do it manually:

```bash
# Initialize git flow (interactive)
git flow init

# Or use defaults (recommended for this project)
git flow init -d
```

This will set up:
- **master** branch for production releases
- **develop** branch for ongoing development
- **feature/** prefix for feature branches
- **release/** prefix for release branches
- **hotfix/** prefix for hotfix branches

## Basic Git Flow Commands

### Feature Development
```bash
# Start a new feature
git flow feature start feature-name

# Finish a feature (merges to develop)
git flow feature finish feature-name
```

### Release Management
```bash
# Start a release
git flow release start v1.0.0

# Finish a release (merges to master and develop, creates tag)
git flow release finish v1.0.0
```

### Hotfixes
```bash
# Start a hotfix
git flow hotfix start hotfix-name

# Finish a hotfix (merges to master and develop, creates tag)
git flow hotfix finish hotfix-name
```

## Integration with CyborgAI CLI Scripts

The project includes automated scripts that use Git Flow:
- `scripts/run_create_github_repository.sh` - Initializes Git Flow
- `scripts/run_git_push.sh` - Handles Git Flow releases
- `scripts/run_issue_create.sh` - Creates feature branches
- `scripts/run_issue_finish.sh` - Finishes features with PRs

## Troubleshooting

### Git Flow Not Found
If you get "git flow command not found":
1. Ensure Git Flow is installed using the methods above
2. Restart your terminal
3. Check if Git Flow is in your PATH

### Permission Issues
On Linux/macOS, you might need to use `sudo` for installation commands.

### Windows Issues
- Ensure you're using Git Bash or PowerShell
- Git Flow might be installed as `git-flow` instead of `git flow`

## Resources
- [Git Flow Cheatsheet](https://danielkummer.github.io/git-flow-cheatsheet/)
- [Original Git Flow Model](https://nvie.com/posts/a-successful-git-branching-model/)
- [Git Flow GitHub Repository](https://github.com/nvie/gitflow)