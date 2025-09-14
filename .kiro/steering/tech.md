# Technology Stack

## Build System & Toolchain
- **Language**: Rust (Nightly channel: nightly-2025-06-20)
- **Edition**: 2024
- **Build System**: Cargo workspace with resolver = "2"
- **Target Platforms**: Linux, macOS (x86_64 & ARM64), Windows
- **Async Runtime**: Tokio with full features

## Dependencies
- **EVO Framework**: Core framework dependency (Git-based)
- **evo_core_app_cli**: CLI application core (Git-based)
- **Tokio**: Async runtime with full feature set

## Code Quality & Formatting
- **Rustfmt**: Configured with 100 character line width, 4-space indentation
- **Clippy**: MSRV 1.70.0, cognitive complexity threshold 30
- **Code Style**: Unix newlines, block indentation, reorder imports enabled

## Common Commands

### Development
```bash
# Development mode (fast compilation)
cargo run
# or
./scripts/run_dev.sh

# Release mode (optimized)
cargo run --release
# or  
./scripts/run.sh
```

### Testing & Quality
```bash
# Run tests
cargo test --release
# or
./scripts/run_tests.sh

# Format code
cargo fmt

# Lint code  
cargo clippy
```

### Documentation
```bash
# Generate docs with PlantUML diagrams
./scripts/run_documentation.sh

# Generate Rust docs only
cargo doc --no-deps --features doc-uml --open
```

### Build Management
```bash
# Clean build artifacts
cargo clean
# or
./scripts/run_cargo_clean.sh

# Update dependencies
cargo update
# or
./scripts/run_cargo_update.sh
```

## Release Configuration
- Optimization level 3 with LTO "fat"
- Single codegen unit for maximum optimization
- Panic abort, debug symbols stripped
- Binary name: `cyborgai_cli`

## External Tools (Legacy)
- **GitHub CLI (gh)**: Repository and issue management
- **Git Flow**: Branching workflow management  
- **PlantUML**: Diagram generation (being phased out)
- **Pandoc**: Document export (being phased out)

Note: External dependencies are being eliminated in the upcoming CyborgAI Dev application.