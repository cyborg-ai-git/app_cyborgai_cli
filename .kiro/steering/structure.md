# Project Structure & Organization

## Workspace Layout
This is a Cargo workspace with a single main application package:

```
app_cyborgai_cli/
├── app_cyborgai_cli/           # Main CLI application package
├── scripts/                    # Development automation scripts
├── scripts_release/            # Release management scripts
├── documentation/              # Generated documentation
├── target/                     # Build artifacts (ignored)
└── Cargo.toml                  # Workspace configuration
```

## Main Application Structure
```
app_cyborgai_cli/
├── src/
│   └── main.rs                 # Application entry point
├── benches/                    # Performance benchmarks
│   └── bench_app_cyborgai_cli.rs
├── tests/                      # Integration tests
│   └── test_app_cyborgai_cli.rs
├── target/                     # Build artifacts
└── Cargo.toml                  # Package configuration
```

## Scripts Organization

### Development Scripts (`scripts/`)
- **Core Operations**: `run.sh`, `run_dev.sh`, `install.sh`
- **Build Management**: `run_cargo_clean.sh`, `run_cargo_update.sh`
- **Testing**: `run_tests.sh`, `run_benches.sh`
- **Documentation**: `run_documentation.sh`
- **Git Flow Integration**: `run_git_push.sh`
- **Issue Management**: `run_issue_*.sh` (create, start, finish, list)

### Release Scripts (`scripts_release/`)
- **Local Builds**: `run_build_release_local.sh`
- **GitHub Integration**: `run_create_github_repository.sh`, `run_github_build_release.sh`
- **Testing**: `test_release_workflow.sh`

## Documentation Structure
```
documentation/
├── data/                       # Assets and diagrams
│   └── logo_evo.svg           # Project logo
└── doc/                       # Generated Rust documentation
    └── cyborgai_cli/          # Package-specific docs
```

## Configuration Files
- **Rust Toolchain**: `rust-toolchain.toml` (nightly-2025-06-20)
- **Formatting**: `rustfmt.toml`, `.rustfmt.toml`
- **Linting**: `clippy.toml`
- **Git**: `.gitignore`, `.gitattributes`
- **GitHub**: `.github/` (workflows, templates, community standards)

## Naming Conventions
- **Binary Name**: `cyborgai_cli`
- **Package Name**: `app_cyborgai_cli`
- **Version Format**: `YYYY.M.DDHHMM` (e.g., "2025.9.71750")
- **Branch Prefixes**: `feature/`, `release/` (no `hotfix/` branches used)
- **Issue Branches**: `feature/issue_123_description_format`

## Architecture Patterns
- **EVO Framework**: Strict separation between Control and GUI layers
- **Async/Await**: Tokio-based async runtime with multi-threaded flavor
- **Error Handling**: Uses `IError` trait from EVO Framework
- **Initialization Pattern**: `do_init()` followed by `do_start()` lifecycle

## File Permissions
All shell scripts should be executable (`chmod +x scripts/*.sh`)

## Build Artifacts
- **Target Directory**: Contains all build outputs, excluded from version control
- **Documentation**: Generated docs are copied to `documentation/doc/` for versioning
- **Release Binaries**: Cross-platform builds for Linux, macOS, Windows