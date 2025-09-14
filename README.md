<img src="https://avatars.githubusercontent.com/u/129898917?v=4" alt="cyborgai" width="256" height="256">

---

## [CyborgAI](https://github.com/cyborg-ai-git) (https://github.com/cyborg-ai-git)

---

# CyborgAI_cli

---

> ⚠️ **BETA DISCLAIMER**: CyborgAI CLI is currently in beta version. Use at your own risk. Features may be unstable and subject to change without notice. This software is provided "as is" without warranty of any kind.

---

## License

### License Explanation
The CyborgAI project begins with the most restrictive Creative Commons license (CC BY-NC-ND 4.0) to safeguard the community's work from unauthorized code use and exploitation. This license prohibits commercial use and derivative works without explicit permission, ensuring that early contributions remain protected and value accrues to legitimate participants.

As development milestones are achieved and community contributions expand, the license restrictions will gradually reduce according to our progressive decentralization roadmap, ultimately making the code more accessible to everyone.

### License Evolution Strategy

The licensing strategy serves multiple purposes:

* Protects initial intellectual property investment during high-risk development phases
* Creates controlled commercialization paths that direct revenue back to contributors
* Establishes clear boundaries for permissible usage during ecosystem growth
* Provides a transparent pathway toward eventual open access when appropriate safeguards are in place
* Discourages early forks that could fragment the community before critical mass is achieved

### License Terms
> #### CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
> Attribution Required: All usage must credit CyborgAI and original contributors
> Non-Commercial: Commercial usage requires explicit written permission
> No Derivatives: Modified versions cannot be distributed without authorization
> Community Protection: Ensures value flows back to legitimate ecosystem participants

---

### [Dependencies](https://github.com/cyborg-ai-git/doc_whitepaper.git):
> 
> [evo_framework](https://github.com/cyborg-ai-git/evo_framework.git) -> min level: **1 (Red pill)**
> 
> [evo_core_app_cli](https://github.com/cyborg-ai-git/evo_core_app_cli.git) -> min level: **7 (Trinity)**

> #### If your peer ID is not allowed to access dependencies , use the latest precompiled binary instead: 
> #### [Releases]( https://github.com/cyborg-ai-git/app_cyborgai_cli/releases/)

> [![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1eHIwNPikysW4j0eMJ8mhDdng4mkBVd08?usp=sharing)
> #### [Colab CyborgAI_cli](https://colab.research.google.com/drive/1eHIwNPikysW4j0eMJ8mhDdng4mkBVd08?usp=sharing)  

---

## What This App Does

EVO CyborgAI_cli is a modern terminal-based AI chat interface built with Rust and the EVO Framework. It provides:

- **Interactive AI Chat Interface** with persistent conversation history
- **Multi-Panel Layout** featuring Chat, File Explorer, Git operations, Settings, and Help panels
- **Full Mouse Support** with click navigation, scrolling, and modern UI interactions📖 
- **Cross-Platform Compatibility** for macOS, Linux, and Windows
- **Session Management** with automatic saving and restoration
- **Built-in Help System** with comprehensive keyboard shortcuts
- **Git and Github Integration** for repository management
- **File Explorer** for project navigation

---

## 🎥 Demo Video
[![CyborgAI_cli Demo](https://img.youtube.com/vi/s1UVb4v16U0/maxresdefault.jpg)](https://youtu.be/s1UVb4v16U0)


*Click the image above to watch the demo video on YouTube*

---

## Usage
1. **Navigation**:
    - Use mouse clicks to switch between panels
    - Use keyboard shortcuts (press `?` for help)
    - Type messages in chat and press Enter to send
2. **Panels**:
    - **Chat**: AI conversation interface
    - **File**: File explorer for project navigation
    - **Git**: Git repository operations
    - **Settings**: Application configuration
    - **Help**: Keyboard shortcuts and usage guide

---

## 📊 Development Progress

| Feature                                            | Progress |
|----------------------------------------------------|----------|
| **Chat Tab**: AI conversation interface            | 60%      |
| **Agent Edit Tab**                                 | 58%      |
| **Memory Tab**                                     | 42%      |
| **Peer Tab**                                       | 82%      |
| **File Tab**: File explorer for project navigation | 74%      |
| **Git Tab**: Git repository operations             | 73%      |
| **Settings Tab**: Application configuration        | 58%      |
| **Help**: Keyboard shortcuts and usage guide       | 63%      |

---

## Installation

### Prerequisites

#### Install Rust
Rust is required to build and run the application. See detailed installation instructions:
📖 **[Install Rust Guide](install_rust.md)**

#### Install rust + audit for linux and macOS for windows use [Wsl](https://ubuntu.com/desktop/wsl)
```bash
# Or using the development script
chmod +x scripts/install.sh
./scripts/install.sh
```

---

##  Requirements
| Tool              | Description              | Repository                                                    |
|-------------------|--------------------------|---------------------------------------------------------------|
| **CyborgAI Peer** | App peer for Ai and api  | 📡 **https://github.com/cyborg-ai-git/app_cyborgai_peer.git** |

---


| Tool                | Description                                               | Documentation                                        |
|---------------------|-----------------------------------------------------------|------------------------------------------------------|
| **GitHub CLI (gh)** | Required for repository and issue management scripts      | 📖 **[Install GitHub CLI Guide](https://github.com/cyborg-ai-git/doc_evo_framework_ai)**    |
| **Git Flow**        | Used for organized development workflow                   | 📖 **[Install Git Flow Guide](https://github.com/cyborg-ai-git/doc_evo_framework_ai)** |
| **PlantUML**        | Required for diagram generation in `run_documentation.sh` | 📖 **[Install PlantUML Guide]https://github.com/cyborg-ai-git/doc_evo_framework_ai)** |
| **Pandoc**          | Required for document export to PDF, DOC, ODT formats     | 📖 **[Install Pandoc Guide](https://github.com/cyborg-ai-git/doc_evo_framework_ai)**     |

**Note**: We are actively working on eliminating these external dependencies in the upcoming **CyborgAI Dev** application.

---

## Additional Requirements

| Tool | Description | Documentation |
|------|-------------|---------------|
| **GitHub CLI (gh)** | Required for repository and issue management scripts | 📖 **[Install GitHub CLI Guide](https://github.com/cyborg-ai-git/doc_evo_framework_ai)** |
| **Git Flow** | Used for organized development workflow with feature/release branches | 📖 **[Install Git Flow Guide](https://github.com/cyborg-ai-git/doc_evo_framework_ai)** |
| **PlantUML** | Required for diagram generation in `run_documentation.sh` | 📖 **[Install PlantUML Guide](https://github.com/cyborg-ai-git/doc_evo_framework_ai)** |
| **Pandoc** | Required for document export to PDF, DOC, ODT formats | 📖 **[Install Pandoc Guide](https://github.com/cyborg-ai-git/doc_evo_framework_ai)** |

**Note**: We are actively working on eliminating these external dependencies in the upcoming **CyborgAI Dev** application.

---

## How to Run

### Development Mode
```bash
# Quick development run
cargo run

# Or using the development script
chmod +x scripts/run_dev.sh
./scripts/run_dev.sh
```

### Production Mode
```bash
# Run in release mode for optimal performance
cargo run --release

# Or using the release script
chmod +x scripts/run.sh
./scripts/run.sh
```

---

## Project Structure

```
app_cyborgai_cli/
├── app_cyborgai_cli/             # Main CLI application
│   ├── src/
│   │   └── main.rs               # Application entry point
│   ├── benches/                  # Performance benchmarks
│   │   └── bench_app_cyborgai_cli.rs
│   ├── tests/                    # Integration tests
│   │   └── test_app_cyborgai_cli.rs
│   └── Cargo.toml               # Package configuration
├── scripts/                     # Development and automation scripts
│   ├── install.sh               # Install rust + audit 
│   ├── issue_create.sh          # Create GitHub issues with branches
│   ├── issue_finish.sh          # Finish issues with PRs
│   ├── issue_list.sh            # List GitHub issues
│   ├── issue_start.sh           # Start working on issues
│   ├── run.sh                   # Run application in release mode
│   ├── run_dev.sh               # Run application in development mode
│   ├── run_benches.sh           # Run performance benchmarks
│   ├── run_cargo_clean.sh       # Clean build artifacts
│   ├── run_cargo_update.sh      # Update dependencies
│   ├── run_create_github_repository.sh  # Create GitHub repo with Git Flow
│   ├── run_documentation.sh     # Generate documentation
│   ├── run_format_code.sh       # Format and lint code
│   ├── run_git_push.sh          # Git Flow operations and releases
│   ├── run_publish.sh           # Publish to crates.io
│   └── run_tests.sh             # Run test suite
├── documentation/               # Generated documentation
│   ├── data/                    # Documentation assets
│   │   └── logo_evo.svg         # Project logo
│   └── doc/                     # Generated Rust docs
├── Cargo.toml                   # Workspace configuration
├── LICENSE.txt                  # License file
├── .gitignore                   # Git ignore rules
└── README.md                    # This file
```

---

## Scripts Folder Explanation

The `scripts/` folder contains automation scripts for development workflow:

### Build & Development Scripts
- **`install.sh`**: Runs the application in release mode for optimal performance
- **`run.sh`**: Runs the application in release mode for optimal performance
- **`run_dev.sh`**: Runs the application in development mode using for faster compilation
- **`run_cargo_clean.sh`**: Cleans all build artifacts and target directories
- **`run_cargo_update.sh`**: Updates all Cargo dependencies to their latest compatible versions
- **`run_format_code.sh`**: Formats code  and runs linting
- **`run_benches.sh`**: Runs performance benchmarks 
- **`run_tests.sh`**: Executes the full test suite with info-level debugging

### Git Flow & Repository Management
- **`run_create_github_repository.sh`**: 
  - Creates a private GitHub repository using GitHub CLI (`gh`)
  - Initializes Git Flow with `master` (production) and `develop` (integration) branches
  - Sets up feature/, release/, and hotfix/ branch prefixes
  - Pushes initial commit and establishes remote tracking

- **`run_git_push.sh`**: 
  - Handles Git Flow operations for commits and releases
  - Usage: `./run_git_push.sh "commit message"` for regular commits
  - Usage: `./run_git_push.sh "commit message" release` for Git Flow releases
  - Automatically reads version from Cargo.toml for release tagging
  - Creates GitHub releases with proper tagging

### Issue Management (GitHub Integration)
- **`issue_create.sh`**: 
  - Creates GitHub issues and corresponding Git Flow feature branches
  - Usage: `./issue_create.sh "issue title" "description"`
  - Automatically generates sanitized branch names like `feature/issue_123_fix_bug`

- **`issue_start.sh`**: 
  - Starts work on existing GitHub issues by creating feature branches
  - Usage: `./issue_start.sh issue_number`
  - Checks out existing remote branches if they exist

- **`issue_finish.sh`**: 
  - Completes issue workflow by creating pull requests and closing issues
  - Merges feature branches back to develop using Git Flow
  - Automatically closes GitHub issues when PRs are created

- **`issue_list.sh`**: Lists all GitHub issues using `gh issue list`

### Documentation & Publishing
- **`run_documentation.sh`**: 
  - Generates PlantUML diagrams from `.puml` files in `documentation/data/`
  - Creates Rust documentation using `cargo doc --no-deps --open`
  - Copies generated docs to `documentation/doc/` for version control

- **`run_publish.sh`**: Publishes the crate to crates.io using `cargo publish`

---


## Development Workflow

This repository uses **Git Flow** branching strategy for organized development:

### Branch Structure
- **`master`**: Production-ready, stable releases only
- **`develop`**: Integration branch where features are merged for testing
- **`feature/*`**: Feature development branches (e.g., `feature/issue_123_new_feature`)
- **`release/*`**: Release preparation branches (e.g., `release/v1.2.0`)

**Note on Hotfix Branches**: We do not use `hotfix/*` branches in our CyborgAI standard workflow. All code must be fully tested and verified before deployment. We believe that good code takes time, and proper testing through the standard feature → develop → release → master flow ensures quality and stability.

---

### Release Process
Our release process uses a pull request workflow for better control and review:

1. **Create Release PR**: Run `./scripts_release/run_git_push_release.sh "Release description" release`
   - Creates a tag on the develop branch
   - Opens a pull request from develop to master
   - Includes detailed release information

2. **Review & Approve**: Team reviews the pull request for:
   - Code quality and completeness
   - Version number accuracy
   - Release notes and documentation

3. **Automated Build**: When the PR is merged to master:
   - GitHub Actions automatically detects the release tag
   - Builds cross-platform binaries (Linux, macOS, Windows ([Wsl](https://ubuntu.com/desktop/wsl)))
   - Creates a GitHub release with all binaries attached

4. **Supported Platforms**: Automatic builds for:
   - **Linux**: x86_64, ARM variants, MIPS variants (musl and gnu)
   - **Windows**: x86_64
   - **macOS**: x86_64 and ARM64 (Apple Silicon)

---
> CyborgAI_cli uses [GitHub issues](https://github.com/cyborg-ai-git/app_cyborgai_cli/issues) as the system of record for new features and bug fixes and this plays a critical role in the release process.
---
## How to Contribute

### 🚀 Quick Start for Contributors

1. **Fork the Repository**: Create your own fork of the project
2. **Create an Issue**: Use our automated script to create issues and Git Flow feature branches:
3. **Start Feature Branch**: Use Git Flow to start working on the issue:
4. **Follow EVO Framework**: Adhere to naming conventions and architecture patterns
5. **Write Tests**: Include appropriate test coverage
6. **Submit Pull Request**: Use Git Flow to finish and target the `develop` branch:
7. **Code Review**: Participate in the review process


### 🛠️ Automated Contribution Workflow

Use our automated scripts for streamlined contributions:

```bash

# Create a new issue and feature branch
# type: [bug|feature|doc|performance]
./scripts/issue_create.sh type "Title" "Detailed description"

#examples:
# Create a bug issue
#./scripts/issue_create.sh bug "Fix ai agent tab" "Users can not ..."

# Create a feature request  
#./scripts/issue_create.sh feature "Add dark mode" "Implement dark theme support for better user experience ..."

# Create a documentation issue
#./scripts/issue_create.sh doc "Update API docs" "The agent tab section needs doc ..."

# Create a performance issue
#./scripts/issue_create.sh performance "Slow ..." "Application takes...."

# Start working on an existing issue
./scripts/issue_start.sh 123

# Finish your work and create a pull request
./scripts/issue_finish.sh 123
```
---

### 📋 GitHub Templates & Community Standards

This repository includes comprehensive GitHub templates and community standards located in the `.github/` directory:

- **`.github/CODE_OF_CONDUCT.md`**: Community guidelines and expected behavior
- **`.github/ISSUE_TEMPLATE/`**: Standardized issue templates for bugs, features, and documentation
- **`.github/PULL_REQUEST_TEMPLATE.md`**: Pull request template with checklist
- **`.github/CONTRIBUTING.md`**: Detailed contribution guidelines
- **`.github/SECURITY.md`**: Security policy and vulnerability reporting

---

### 📝 Contribution Guidelines

- Follow the **[EVO Framework standard conventions](https://github.com/cyborg-ai-git/doc_evo_framework_ai)**
- Maintain strict separation between Control and Gui layers
- Document all
- Include unit tests for new functionality
- Ensure cross-platform compatibility
- Use the provided GitHub templates when creating issues and pull requests
- Follow the Code of Conduct outlined in `.github/CODE_OF_CONDUCT.md`

---

## Documentation
**[EVO Framework Documentation](https://github.com/cyborg-ai-git/doc_evo_framework_ai)**

**[CyborgAI_cli Documentation](documentation/doc/cyborgai_cli/index.html)**

**[CyborgAI_Dao](https://github.com/cyborg-ai-git/doc_whitepaper.git)**

---

## License
**[CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International](LICENSE.txt)**

---

## Links
- [CyborgAI Website](https://cyborgai.fly.dev)
- [YouTube](https://www.youtube.com/watch?v=OnZAlOs09p4)
- [GitHub](https://github.com/cyborg-ai-git)
---
## Future Development

We are actively working on **CyborgAI Dev** - a comprehensive Rust application that will provide a complete development environment and eliminate the need for external dependencies like PlantUML and Pandoc. This next-generation tool will handle the entire development process from project creation to deployment.

🚀 **Stay tuned for updates**: [CyborgAI Dev Repository](https://github.com/cyborg-ai-git/app_cyborgai_dev)

The new application will include:

### 🤖 AI-Powered Automation
- **Automatic Documentation Generation**: Full detailed documentation created automatically with AI support and UML diagrams
- **Automatic Test Generation**: Comprehensive test suites generated automatically based on code analysis
- **Automatic Benchmark Generation**: Performance benchmarks created automatically for optimization insights
- **AI-Supported API Generation**: API generated automatically with AI assistance
- **AI-Supported Entity Generation**: Entities created automatically

### 🛠️ Enhanced Development Tools
- **Integrated Documentation Generation**: Built-in tools for creating and maintaining project documentation
- **Built-in Diagram Creation**: Native UML and architectural diagram generation without external dependencies
- **Native Document Export**: Export capabilities to PDF, DOC, ODT formats without requiring Pandoc
- **Enhanced Project Management**: Advanced project scaffolding, dependency management, and workflow automation
- **Streamlined Development Workflows**: Optimized Git Flow integration with intelligent branch management and automated CI/CD pipelines

---