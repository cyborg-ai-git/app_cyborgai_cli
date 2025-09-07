# Release Process Troubleshooting Guide

## Common Issues and Solutions

### 1. GitHub Actions Permission Error (HTTP 403)

**Error**: `HTTP 403: Resource not accessible by integration`

**Cause**: The workflow doesn't have sufficient permissions to create releases.

**Solution**: 
- The workflow now includes proper permissions in `.github/workflows/build_release.yml`
- Ensure your repository settings allow GitHub Actions to create releases
- Check: Settings → Actions → General → Workflow permissions

### 2. Tag Already Exists Error

**Error**: `fatal: tag 'vX.X.X' already exists`

**Cause**: The tag was created in a previous run but the release process failed.

**Solution**: The script now handles existing tags gracefully and continues with the process.

### 3. Build Script Not Found

**Error**: `./build-release: No such file or directory`

**Cause**: Build scripts are missing or not executable.

**Solution**: 
```bash
chmod +x build/build-release build/build-host-release
```

### 4. Cross Compilation Fails

**Error**: Various cross-compilation errors for different targets.

**Cause**: Missing cross-compilation tools or dependencies.

**Solution**: 
- The workflow installs `cross` automatically
- For local testing, install: `cargo install cross --git https://github.com/cross-rs/cross`

### 5. Release Label Not Found

**Error**: `could not add label: 'release' not found`

**Cause**: The 'release' label doesn't exist in the repository.

**Solution**: 
```bash
./scripts/setup_release_labels.sh
```

## Testing the Release Process

### Test Workflow Manually
```bash
./scripts/test_release_workflow.sh
```

### Monitor Workflow Execution
```bash
# List recent workflow runs
gh run list --workflow=build_release.yml

# Watch a specific run
gh run watch <run-id>

# View workflow logs
gh run view <run-id> --log
```

### Verify Release Creation
```bash
# List releases
gh release list

# View specific release
gh release view v1.0.0

# Download release assets
gh release download v1.0.0
```

## Manual Cleanup

If a test release needs to be cleaned up:

```bash
# Delete release
gh release delete v1.0.0-test --yes

# Delete local tag
git tag -d v1.0.0-test

# Delete remote tag
git push origin --delete v1.0.0-test
```

## Workflow Debugging

### Check Workflow Status
1. Go to GitHub → Actions tab
2. Find the "Build Releases" workflow
3. Check the logs for each job

### Common Debug Steps
1. Verify tag exists: `git tag -l | grep v1.0.0`
2. Check permissions: Repository Settings → Actions → General
3. Verify build scripts: `ls -la build/`
4. Test build locally: `./build/build-host-release -t x86_64-apple-darwin`

## Repository Settings

Ensure these settings are correct:

### Actions Permissions
- Settings → Actions → General → Workflow permissions
- Select "Read and write permissions"
- Check "Allow GitHub Actions to create and approve pull requests"

### Branch Protection
- If master branch has protection rules, ensure they allow the release workflow
- Consider adding the workflow as a required status check

## Contact

If issues persist, check:
1. GitHub Actions documentation
2. Repository issues for similar problems
3. Workflow run logs for detailed error messages