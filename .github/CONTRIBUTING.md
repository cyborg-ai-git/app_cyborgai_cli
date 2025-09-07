# Contributing to CyborgAI CLI

Thank you for your interest in contributing to CyborgAI CLI! This document provides detailed guidelines for contributing to our project.

## 🚀 Quick Start

1. **Fork the Repository**: Create your own fork of the project
2. **Clone Your Fork**: `git clone https://github.com/YOUR_USERNAME/evo_framework-rust.git`
3. **Set Up Development Environment**: Follow the installation instructions in [README.md](../README.md)
4. **Create an Issue**: Use our automated script or GitHub interface

## 📋 Development Setup

### Prerequisites

- **Rust**: Latest stable version (see [Install Rust Guide](../install_rust.md))
- **GitHub CLI**: For repository operations (see [Install GitHub CLI Guide](../install_gh.md))
- **Git Flow**: For organized development workflow (see [Install Git Flow Guide](../install_git_flow.md))

### Environment Setup

```bash
# Clone the repository
git clone https://github.com/cyborg-ai-git/evo_framework-rust.git
cd evo_framework-rust/rust/evo_cyborgai_cli

# Install dependencies and build
cargo build

# Run tests to ensure everything works
cargo test

# Run the application
cargo run
```

## 🛠️ Development Workflow

### Using Automation Scripts

We provide automation scripts to streamline the contribution process:

```bash
# Create a new issue and feature branch
./scripts/run_issue_create.sh "Feature: Add new functionality" "Detailed description"

# Start working on an existing issue
./scripts/run_issue_start.sh 123

# Run tests
./scripts/run_tests.sh

# Format and lint code
./scripts/run_format_code.sh

# Commit and push changes
./scripts/run_git_push.sh "Your commit message"

# Finish feature and create pull request
./scripts/run_issue_finish.sh 123
```

### Manual Workflow

If you prefer manual Git operations:

```bash
# Create feature branch
git checkout develop
git pull origin develop
git checkout -b feature/your-feature-name

# Make your changes
# ... code, test, commit ...

# Push your branch
git push origin feature/your-feature-name

# Create pull request via GitHub interface
```

## 📝 Coding Standards

### EVO Framework Conventions

Follow the EVO Framework naming conventions:

- **C*** prefixes for Control layer components
- **E*** prefixes for Entity layer components  
- **G*** prefixes for GUI layer components
- **U*** prefixes for Utility components

### Code Quality

- **Formatting**: Use `cargo fmt` to format code
- **Linting**: Use `cargo clippy` to catch common issues
- **Testing**: Write unit tests for new functionality
- **Documentation**: Document all public APIs with rustdoc comments

### Architecture Principles

- Maintain strict separation between control and GUI layers
- Follow dependency injection patterns
- Use proper error handling with `Result<T, E>`
- Ensure cross-platform compatibility

## 🧪 Testing Guidelines

### Running Tests

```bash
# Run all tests
cargo test

# Run tests with output
cargo test -- --nocapture

# Run specific test
cargo test test_name

# Run benchmarks
cargo bench
```

### Writing Tests

- Write unit tests for all new functions
- Include integration tests for complex features
- Test error conditions and edge cases
- Maintain test coverage above 80%

Example test structure:

```rust
#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test_function_name() {
        // Arrange
        let input = "test input";
        
        // Act
        let result = your_function(input);
        
        // Assert
        assert_eq!(result, expected_output);
    }
}
```

## 📚 Documentation

### Code Documentation

- Use rustdoc comments (`///`) for public APIs
- Include examples in documentation
- Document function parameters and return values
- Explain complex algorithms or business logic

### Project Documentation

- Update README.md for significant changes
- Add installation guides for new dependencies
- Update project structure documentation
- Include usage examples

## 🐛 Bug Reports

When reporting bugs, please include:

- **Environment**: OS, Rust version, dependencies
- **Steps to Reproduce**: Clear, numbered steps
- **Expected Behavior**: What should happen
- **Actual Behavior**: What actually happens
- **Error Messages**: Full error output
- **Screenshots**: If applicable

Use our bug report template when creating issues.

## ✨ Feature Requests

For new features:

- **Use Case**: Describe the problem you're solving
- **Proposed Solution**: Your suggested approach
- **Alternatives**: Other solutions you considered
- **Implementation**: Technical details if you have them

Use our feature request template when creating issues.

## 🔄 Pull Request Process

### Before Submitting

- [ ] Code follows EVO Framework conventions
- [ ] All tests pass (`cargo test`)
- [ ] Code is formatted (`cargo fmt`)
- [ ] No clippy warnings (`cargo clippy`)
- [ ] Documentation is updated
- [ ] CHANGELOG.md is updated (if applicable)

### Pull Request Checklist

- [ ] **Title**: Clear, descriptive title
- [ ] **Description**: Detailed description of changes
- [ ] **Issue Link**: Link to related issue
- [ ] **Testing**: Describe how you tested the changes
- [ ] **Breaking Changes**: Note any breaking changes
- [ ] **Screenshots**: Include if UI changes

### Review Process

1. **Automated Checks**: CI/CD pipeline runs tests and checks
2. **Code Review**: Maintainers review code quality and design
3. **Testing**: Reviewers test functionality
4. **Approval**: At least one maintainer approval required
5. **Merge**: Squash and merge to develop branch

## 🏷️ Git Commit Guidelines

### Commit Message Format

```
type(scope): subject

body

footer
```

### Types

- **feat**: New feature
- **fix**: Bug fix
- **docs**: Documentation changes
- **style**: Code style changes (formatting, etc.)
- **refactor**: Code refactoring
- **test**: Adding or updating tests
- **chore**: Maintenance tasks

### Examples

```
feat(chat): add message history persistence

Implement local storage for chat messages to maintain
conversation history across application restarts.

Closes #123
```

## 🌟 Recognition

Contributors will be recognized in:

- **README.md**: Contributors section
- **CHANGELOG.md**: Release notes
- **GitHub**: Contributor graphs and statistics

## 📞 Getting Help

- **GitHub Issues**: For bugs and feature requests
- **GitHub Discussions**: For questions and general discussion
- **Documentation**: Check existing docs first
- **Code Review**: Ask questions in pull request comments

## 📄 License

By contributing to CyborgAI CLI, you agree that your contributions will be licensed under the CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.

---

Thank you for contributing to CyborgAI CLI! Your contributions help make this project better for everyone.