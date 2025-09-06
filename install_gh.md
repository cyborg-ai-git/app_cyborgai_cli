# Install GitHub CLI (gh)

## Overview
GitHub CLI (gh) is required for repository and issue management scripts in the CyborgAI CLI project. It enables automation of GitHub operations directly from the command line.

## What is GitHub CLI?
GitHub CLI brings GitHub to your terminal. It allows you to:
- Create and manage repositories
- Create and manage issues and pull requests
- View and manage GitHub Actions
- Authenticate with GitHub
- And much more

## Installation

### Linux

**Ubuntu/Debian:**
```bash
# Method 1: Using GitHub's official repository
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Method 2: Using snap
sudo snap install gh
```

**Fedora/RHEL/CentOS:**
```bash
# Method 1: Using dnf
sudo dnf install gh

# Method 2: Using GitHub's repository
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install gh
```

**Arch Linux:**
```bash
sudo pacman -S github-cli
```

**openSUSE:**
```bash
sudo zypper addrepo https://cli.github.com/packages/rpm/gh-cli.repo
sudo zypper ref
sudo zypper install gh
```

### macOS

**Using Homebrew:**
```bash
brew install gh
```

**Using MacPorts:**
```bash
sudo port install gh
```

### Windows

**Using winget:**
```bash
winget install GitHub.cli
```

**Using Chocolatey:**
```bash
choco install gh
```

**Using Scoop:**
```bash
scoop install gh
```

## Manual Installation (Alternative)

If package managers don't work:

1. **Download from GitHub:**
   - Visit [GitHub CLI Releases](https://github.com/cli/cli/releases)
   - Download the appropriate package for your OS

2. **Linux (using downloaded .deb/.rpm/.tar.gz):**
   ```bash
   # For .deb files (Ubuntu/Debian)
   sudo dpkg -i gh_*_linux_amd64.deb
   
   # For .rpm files (Fedora/RHEL)
   sudo rpm -i gh_*_linux_amd64.rpm
   
   # For .tar.gz files
   tar -xzf gh_*_linux_amd64.tar.gz
   sudo cp gh_*_linux_amd64/bin/gh /usr/local/bin/
   ```

3. **macOS (using .pkg installer):**
   - Double-click the downloaded .pkg file
   - Follow the installation wizard

4. **Windows (using .msi installer):**
   - Double-click the downloaded .msi file
   - Follow the installation wizard

## Verify Installation

Test GitHub CLI installation:
```bash
gh --version
```

You should see GitHub CLI version information.

## Authentication

After installation, you need to authenticate with GitHub:

### Interactive Authentication
```bash
gh auth login
```

This will prompt you to:
1. Choose GitHub.com or GitHub Enterprise Server
2. Choose your preferred protocol (HTTPS or SSH)
3. Authenticate via web browser or personal access token

### Token Authentication
```bash
# Using a personal access token
gh auth login --with-token < token.txt

# Or set environment variable
export GITHUB_TOKEN=your_token_here
```

### Verify Authentication
```bash
gh auth status
```

## Basic Usage

### Repository Operations
```bash
# Create a new repository
gh repo create my-repo --private

# Clone a repository
gh repo clone owner/repo

# View repository information
gh repo view

# Fork a repository
gh repo fork owner/repo
```

### Issue Management
```bash
# List issues
gh issue list

# Create an issue
gh issue create --title "Bug report" --body "Description"

# View an issue
gh issue view 123

# Close an issue
gh issue close 123
```

### Pull Request Operations
```bash
# Create a pull request
gh pr create --title "Feature" --body "Description"

# List pull requests
gh pr list

# View a pull request
gh pr view 123

# Merge a pull request
gh pr merge 123
```

## Usage in CyborgAI CLI Scripts

The project uses GitHub CLI in several scripts:

### `scripts/run_create_github_repository.sh`
- Creates private GitHub repositories
- Sets up Git Flow branches
- Pushes initial commits

### `scripts/run_issue_create.sh`
- Creates GitHub issues
- Links issues to feature branches
- Manages issue workflow

### `scripts/run_issue_finish.sh`
- Creates pull requests
- Closes issues automatically
- Manages Git Flow completion

### `scripts/run_git_push.sh`
- Creates GitHub releases
- Manages release tags
- Handles release workflows

## Configuration

GitHub CLI can be configured using:

### Config Commands
```bash
# Set default editor
gh config set editor vim

# Set default protocol
gh config set git_protocol ssh

# View all configuration
gh config list
```

### Config File
Configuration is stored in `~/.config/gh/config.yml`:
```yaml
git_protocol: https
editor: vim
prompt: enabled
pager: less
```

## Troubleshooting

### GitHub CLI Not Found
If you get "gh command not found":
1. Ensure GitHub CLI is installed using the methods above
2. Restart your terminal
3. Check if `gh` is in your PATH

### Authentication Issues
If authentication fails:
1. Run `gh auth login` again
2. Check your internet connection
3. Verify your GitHub credentials
4. Try using a personal access token

### Permission Issues
If you get permission errors:
1. Ensure you have access to the repository
2. Check if you're authenticated with the correct account
3. Verify repository permissions on GitHub

### Network Issues
If you're behind a corporate firewall:
```bash
# Configure proxy if needed
gh config set http_proxy http://proxy.company.com:8080
gh config set https_proxy https://proxy.company.com:8080
```

## Advanced Features

### Aliases
Create custom aliases:
```bash
# Create an alias for common operations
gh alias set pv 'pr view'
gh alias set ic 'issue create'
```

### Extensions
Install GitHub CLI extensions:
```bash
# List available extensions
gh extension list

# Install an extension
gh extension install owner/gh-extension-name
```

### API Access
Use GitHub CLI to access the GitHub API:
```bash
# Make API requests
gh api repos/owner/repo/issues

# With jq for JSON processing
gh api repos/owner/repo/issues | jq '.[0].title'
```

## Resources
- [GitHub CLI Official Website](https://cli.github.com/)
- [GitHub CLI Manual](https://cli.github.com/manual/)
- [GitHub CLI Repository](https://github.com/cli/cli)
- [GitHub CLI Extensions](https://github.com/topics/gh-extension)