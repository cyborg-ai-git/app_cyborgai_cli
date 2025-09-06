

## [CyborgAI](https://github.com/cyborg-ai-git) (https://github.com/cyborg-ai-git)

<img src="https://avatars.githubusercontent.com/u/129898917?v=4" alt="cyborgai" width="256" height="256">

# EVO CyborgAI CLI

> ⚠️ **BETA DISCLAIMER**: CyborgAI CLI is currently in beta version. Use at your own risk. Features may be unstable and subject to change without notice. This software is provided "as is" without warranty of any kind.

#### CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International          

## What This App Does

EVO CyborgAI CLI is a modern terminal-based AI chat interface built with Rust and the EVO Framework. It provides:

- **Interactive AI Chat Interface** with persistent conversation history
- **Multi-Panel Layout** featuring Chat, File Explorer, Git operations, Settings, and Help panels
- **Full Mouse Support** with click navigation, scrolling, and modern UI interactions
- **Cross-Platform Compatibility** for macOS, Linux, and Windows
- **Session Management** with automatic saving and restoration
- **Built-in Help System** with comprehensive keyboard shortcuts
- **Git and Github Integration** for repository management
- **File Explorer** for project navigation

## 📊 Development Progress

| Feature                                        | Status   |
|------------------------------------------------|----------|
| **Chat**: AI conversation interface            | 60%      |
| **Agent Edit Tab**                             | 58%      |
| **Memory RAG Agent**                           | 42%      |
| **Peer API**                                   | 82%      |
| **File**: File explorer for project navigation | 74%      |
| **Git**: Git repository operations             | 73%      |
| **Settings**: Application configuration        | 58%      |
| **Help**: Keyboard shortcuts and usage guide   | 63%      |

## 🎥 Demo Video

[![CyborgAI CLI Demo](https://img.youtube.com/vi/OnZAlOs09p4/maxresdefault.jpg)](https://www.youtube.com/watch?v=OnZAlOs09p4)

*Click the image above to watch the demo video on YouTube*

## Installation

### Prerequisites

#### Install Rust
Rust is required to build and run the application. See detailed installation instructions:
📖 **[Install Rust Guide](install_rust.md)**

### 2. Clone and Build

```bash
git clone https://github.com/cyborg-ai-git/evo_framework-rust.git
cd evo_framework-rust
cd rust/evo_cyborgai_cli
chmod +x build.sh
./build.sh
```

## How to Run

### Development Mode
```bash
# Quick development run
cd rust/evo_cyborgai_cli
cargo run

# Or using the development script
cd rust/evo_cyborgai_cli/test_doc
chmod +x run.sh
./run.sh
```

### Production Mode
```bash
# Build and run release version
cd rust/evo_cyborgai_cli
./build.sh
./target/release/evo_cyborgai_cli

# Or directly with cargo
cargo run --release
```

## Project Structure

```
app_cyborgai_cli/
├── app_cyborgai_cli/              # Main CLI application
│   ├── src/
│   │   └── main.rs               # Application entry point
│   ├── benches/                  # Performance benchmarks
│   │   └── bench_app_cyborgai_cli.rs
│   ├── tests/                    # Integration tests
│   │   └── test_app_cyborgai_cli.rs
│   └── Cargo.toml               # Package configuration
├── scripts/                      # Development and automation scripts
│   ├── run_benches.sh           # Run performance benchmarks
│   ├── run_cargo_clean.sh       # Clean build artifacts
│   ├── run_cargo_update.sh      # Update dependencies
│   ├── run_create_github_repository.sh  # Create GitHub repo with Git Flow
│   ├── run_documentation.sh     # Generate documentation
│   ├── run_format_code.sh       # Format and lint code
│   ├── run_git_push.sh          # Git Flow operations and releases
│   ├── run_issue_create.sh      # Create GitHub issues with branches
│   ├── run_issue_finish.sh      # Finish issues with PRs
│   ├── run_issue_list.sh        # List GitHub issues
│   ├── run_issue_start.sh       # Start working on issues
│   ├── run_publish.sh           # Publish to crates.io
│   └── run_tests.sh             # Run test suite
├── documentation/               # Generated documentation
│   ├── data/                   # Documentation assets
│   │   └── logo_evo.svg       # Project logo
│   └── doc/                   # Generated Rust docs
├── Cargo.toml                  # Workspace configuration
├── LICENSE.txt                 # License file
├── .gitignore                 # Git ignore rules
└── README.md                  # This file
```

## Scripts Folder Explanation

The `scripts/` folder contains automation scripts for development workflow:

### Build & Development Scripts
- **`run_cargo_clean.sh`**: Cleans all build artifacts and target directories using `cargo clean`
- **`run_cargo_update.sh`**: Updates all Cargo dependencies to their latest compatible versions
- **`run_format_code.sh`**: Formats code with `cargo fmt` and runs linting with `cargo clippy`
- **`run_benches.sh`**: Runs performance benchmarks using `cargo bench` with error-level logging
- **`run_tests.sh`**: Executes the full test suite using `cargo test --release` with info-level logging

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
- **`run_issue_create.sh`**: 
  - Creates GitHub issues and corresponding Git Flow feature branches
  - Usage: `./run_issue_create.sh "issue title" "description"`
  - Automatically generates sanitized branch names like `feature/issue_123_fix_bug`

- **`run_issue_start.sh`**: 
  - Starts work on existing GitHub issues by creating feature branches
  - Usage: `./run_issue_start.sh issue_number`
  - Checks out existing remote branches if they exist

- **`run_issue_finish.sh`**: 
  - Completes issue workflow by creating pull requests and closing issues
  - Merges feature branches back to develop using Git Flow
  - Automatically closes GitHub issues when PRs are created

- **`run_issue_list.sh`**: Lists all GitHub issues using `gh issue list`

### Documentation & Publishing
- **`run_documentation.sh`**: 
  - Generates PlantUML diagrams from `.puml` files in `documentation/data/`
  - Creates Rust documentation using `cargo doc --no-deps --open`
  - Copies generated docs to `documentation/doc/` for version control

- **`run_publish.sh`**: Publishes the crate to crates.io using `cargo publish`

## Usage

1. **Start the Application**: Run using `cargo run` or `./run.sh`
2. **Logo Splash**: Wait 3 seconds or press Enter/Esc to skip
3. **Navigation**: 
   - Use mouse clicks to switch between panels
   - Use keyboard shortcuts (press `?` for help)
   - Type messages in chat and press Enter to send
4. **Panels**:
   - **Chat**: AI conversation interface
   - **File**: File explorer for project navigation
   - **Git**: Git repository operations
   - **Settings**: Application configuration
   - **Help**: Keyboard shortcuts and usage guide

## Development Workflow

This repository uses **Git Flow** branching strategy for organized development:

### Branch Structure
- **`master`**: Production-ready, stable releases only
- **`develop`**: Integration branch where features are merged for testing
- **`feature/*`**: Feature development branches (e.g., `feature/issue_123_new_feature`)
- **`release/*`**: Release preparation branches (e.g., `release/v1.2.0`)

### Workflow Commands
```bash
# Start new feature
./scripts/run_issue_create.sh "Feature description"

# Work on existing issue
./scripts/run_issue_start.sh 123

# Regular commits
./scripts/run_git_push.sh "commit message"

# Create release
./scripts/run_git_push.sh "release message" release

# Finish feature work
./scripts/run_issue_finish.sh 123
```

## Additional Requirements

### For GitHub Operations
**GitHub CLI (gh)** is required for repository and issue management scripts:
📖 **[Install GitHub CLI Guide](install_gh.md)**

### For Git Flow Workflow
**Git Flow** is used for organized development workflow:
📖 **[Install Git Flow Guide](install_git_flow.md)**

### For Documentation Generation
**PlantUML** and **Pandoc** are required for `run_documentation.sh`:

📖 **[Install PlantUML Guide](install_plantuml.md)** - For diagram generation  
📖 **[Install Pandoc Guide](install_pandoc.md)** - For document export to PDF, DOC, ODT formats

**Note**: We are actively working on eliminating these external dependencies in the upcoming **CyborgAI Dev** application.

## Future Development

We are actively working on **CyborgAI Dev** - a comprehensive Rust application that will provide a complete development environment and eliminate the need for external dependencies like PlantUML and Pandoc. This next-generation tool will handle the entire development process from project creation to deployment.

🚀 **Stay tuned for updates**: [CyborgAI Dev Repository](https://github.com/cyborg-ai-git/app_cyborgai_dev)

The new application will include:
- Integrated documentation generation
- Built-in diagram creation
- Native document export capabilities
- Enhanced project management
- Streamlined development workflows

## How to Contribute

1. **Fork the Repository**: Create your own fork of the project
2. **Create Feature Branch**: `git checkout -b feature/your-feature-name`
3. **Follow EVO Framework**: Adhere to naming conventions and architecture patterns
4. **Write Tests**: Include appropriate test coverage
5. **Submit Pull Request**: Target the `develop` branch
6. **Code Review**: Participate in the review process

### Contribution Guidelines
- Follow the EVO Framework naming conventions (C*, E*, G*, U* prefixes)
- Maintain strict separation between control and GUI layers
- Document all public APIs
- Include unit tests for new functionality
- Ensure cross-platform compatibility

## Documentation
EVO Framework Documentation: [Coming Soon]

## License
CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International

## Links
- [YouTube Demo](https://www.youtube.com/watch?v=OnZAlOs09p4)
- [CyborgAI Website](https://cyborgai.fly.dev)
- [GitHub Organization](https://github.com/cyborg-ai-git)