#!/bin/bash
#===================================================================================================
# CyborgAI - Test Release Workflow
# CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
#===================================================================================================

echo "🧪 Testing Release Workflow..."

# Check if GitHub CLI is available
if ! command -v gh &> /dev/null; then
    echo "❌ GitHub CLI (gh) is not installed. Please install it first:"
    echo "   brew install gh"
    exit 1
fi

# Check if user is authenticated
if ! gh auth status &> /dev/null; then
    echo "❌ Not authenticated with GitHub CLI. Please run:"
    echo "   gh auth login"
    exit 1
fi

# Get current version from Cargo.toml
if [ -f "Cargo.toml" ]; then
    VERSION=$(grep -A 10 '\[workspace\.package\]' Cargo.toml | grep -E '^version = ' | head -1 | sed 's/version = "\(.*\)"/\1/' | tr -d '"')
    if [ -z "$VERSION" ]; then
        echo "❌ Could not read version from Cargo.toml"
        exit 1
    fi
    TEST_TAG="v$VERSION-test"
else
    echo "❌ Cargo.toml not found"
    exit 1
fi

echo "📦 Testing with version: $VERSION"
echo "🏷️ Test tag: $TEST_TAG"

# Test workflow dispatch
echo "🚀 Triggering workflow dispatch..."
if gh workflow run build_release.yml -f tag="$TEST_TAG"; then
    echo "✅ Workflow dispatch triggered successfully"
    echo "🔗 Check workflow status: gh run list --workflow=build_release.yml"
    echo "🔗 Or visit: https://github.com/$(gh repo view --json owner,name --jq '.owner.login + "/" + .name')/actions"
else
    echo "❌ Failed to trigger workflow dispatch"
    exit 1
fi

echo ""
echo "📋 Next steps:"
echo "   1. Monitor the workflow execution"
echo "   2. Check if the release is created"
echo "   3. Verify binaries are built and attached"
echo ""
echo "🧹 Cleanup: Delete the test release and tag when done:"
echo "   gh release delete $TEST_TAG --yes"
echo "   git tag -d $TEST_TAG"
echo "   git push origin --delete $TEST_TAG"