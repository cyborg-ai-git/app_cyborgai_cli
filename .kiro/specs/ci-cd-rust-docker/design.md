# Design Document

## Overview

This design migrates the GitHub Actions CI/CD pipeline from using bare Ubuntu runners with manual Rust installation to using official Rust Docker images. This approach eliminates system package dependency issues, provides consistent build environments, and improves reliability. The solution uses Docker containers with pre-installed Rust toolchains and cross-compilation tools.

## Architecture

### Current Architecture Issues
- Ubuntu runner + manual clang installation → dependency conflicts
- System package management → unreliable package resolution
- Manual Rust toolchain installation → inconsistent environments

### New Architecture
- Official Rust Docker images as base → pre-configured environment
- Container-based builds → isolated, reproducible environments  
- Multi-stage Docker approach → optimized for caching and efficiency

### Docker Image Strategy
- **Base Image**: `rust:1.80-bookworm` or similar stable Debian-based Rust image
- **Toolchain**: Install nightly-2025-06-20 on top of base image
- **Cross-compilation**: Add zigbuild and target support
- **Git**: Ensure git is available for private repository access

## Components and Interfaces

### 1. Docker Container Configuration

**Container Requirements:**
- Rust nightly-2025-06-20 toolchain
- Cross-compilation targets (x86_64-unknown-linux-gnu, x86_64-unknown-linux-musl)
- Git for repository access
- Zigbuild for cross-compilation
- Build tools (clang, gcc, etc.) pre-installed

**Volume Mounts:**
- Source code: `/workspace`
- Cargo cache: `/usr/local/cargo/registry`
- Build output: `/workspace/build`

### 2. GitHub Actions Workflow Structure

**Job Modifications:**
```yaml
build-release-linux:
  runs-on: ubuntu-latest
  container:
    image: rust:1.80-bookworm
    options: --user root
```

**Environment Setup:**
- Install nightly toolchain in container
- Configure git authentication
- Install zigbuild and cross-compilation tools
- Set up target architectures

### 3. Authentication Handling

**Git Configuration in Container:**
- Pass GitHub tokens via environment variables
- Configure git credential helper
- Test private repository access

**Security Considerations:**
- Use secrets for authentication tokens
- Limit container permissions where possible
- Ensure tokens are not logged

## Data Models

### Build Configuration
```yaml
matrix:
  platform:
    - target: x86_64-unknown-linux-gnu
      container: rust:1.80-bookworm
    - target: x86_64-unknown-linux-musl  
      container: rust:1.80-bookworm
```

### Environment Variables
```yaml
env:
  CARGO_TERM_COLOR: always
  RUST_BACKTRACE: full
  CARGO_HOME: /usr/local/cargo
  RUSTUP_HOME: /usr/local/rustup
```

## Error Handling

### Container Startup Issues
- **Problem**: Docker image pull failures
- **Solution**: Use specific image tags, implement retry logic
- **Fallback**: Multiple image options (rust:1.80-bookworm, rust:1.79-bookworm)

### Toolchain Installation Issues  
- **Problem**: Nightly toolchain installation failures
- **Solution**: Pre-validate toolchain availability, use closest available nightly
- **Fallback**: Use stable toolchain with feature compatibility checks

### Cross-compilation Issues
- **Problem**: Target installation failures
- **Solution**: Pre-install common targets in container setup
- **Fallback**: Use native compilation for problematic targets

### Authentication Issues
- **Problem**: Private repository access failures
- **Solution**: Validate git configuration before build, provide clear error messages
- **Fallback**: Skip private dependencies if possible, fail fast with clear instructions

## Testing Strategy

### Unit Testing
- Test Docker container setup scripts
- Validate toolchain installation procedures
- Test git authentication configuration

### Integration Testing  
- Test complete build pipeline with Docker containers
- Validate cross-compilation for all target platforms
- Test private repository access in containerized environment

### End-to-End Testing
- Run full release build process using Docker containers
- Validate binary outputs for all platforms
- Test release artifact upload process

### Performance Testing
- Compare build times: bare runner vs Docker container
- Measure Docker layer caching effectiveness
- Optimize container startup time

## Implementation Phases

### Phase 1: Basic Docker Integration
- Replace Ubuntu runner with Rust Docker container
- Install nightly toolchain in container
- Maintain existing build scripts

### Phase 2: Optimization
- Implement Docker layer caching
- Optimize container startup time
- Add parallel build support

### Phase 3: Enhanced Features
- Add support for custom Docker images
- Implement build artifact caching
- Add build environment validation

## Migration Strategy

### Backward Compatibility
- Keep existing build scripts functional
- Maintain same output artifact structure
- Preserve existing environment variables

### Rollback Plan
- Keep original workflow as backup
- Use feature flags to switch between approaches
- Monitor build success rates during transition

### Validation Criteria
- All existing build targets must work
- Build time should not increase significantly
- Private repository access must be maintained
- Release artifacts must be identical