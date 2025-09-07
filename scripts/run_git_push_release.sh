#!/bin/bash
#===================================================================================================
# CyborgAI
# CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
# github: https://github.com/cyborg-ai-git
#===================================================================================================
PACKAGE_NAME="$(basename "$(pwd)")"
DIRECTORY_BASE=$(dirname "$(realpath "$0")")
clear

echo "Usage: $0 'commit_message' [release]"
echo "  - Without 'release': commits to current branch"
echo "  - With 'release': creates git flow release using Cargo.toml version"

CURRENT_TIME=$(date +"%Y.%-m.%-d%H%M")
#---------------------------------------------------------------------------------------------------
echo "🟢 $CURRENT_TIME - RUN git flow $ $DIRECTORY_BASE"
#---------------------------------------------------------------------------------------------------
CURRENT_DIRECTORY=$(pwd)
#---------------------------------------------------------------------------------------------------
cd "$DIRECTORY_BASE" || exit
cd ..
#---------------------------------------------------------------------------------------------------
# Check if git repository exists
if [ -d .git ]; then
    echo "📁 Git repository found"
else
    echo "❌ No git repository found. Creating one..."
    sh ./run_create_github_repository.sh
fi

# Check if git flow is initialized
if ! git config --get gitflow.branch.master >/dev/null 2>&1; then
    echo "❌ Git flow not initialized. Initializing now..."

    # Check if develop branch exists
    if git show-ref --verify --quiet refs/heads/develop; then
        echo "🔵 Develop branch found"
    else
        echo "🔵 Creating develop branch..."
        git checkout -b develop 2>/dev/null || git checkout develop
        git push -u origin develop 2>/dev/null || true
    fi

    # Initialize git flow with defaults (no hotfix branch)
    echo -e "master\ndevelop\nfeature/\nrelease/\n\nsupport/\nv" | git flow init

    echo "🟢 Git flow initialized successfully!"
fi

# Set commit message
if [ -z "$1" ]; then
    comment="commit $CURRENT_TIME"
else
    comment="$1"
fi

echo "💬 Commit message: $comment"
#---------------------------------------------------------------------------------------------------
# Configure git and fetch updates
git config http.postBuffer 524288000
git fetch --all

# Add and commit changes
#git add .
#git commit -am "$comment"
#---------------------------------------------------------------------------------------------------
# Check if this is a release
if [ "$2" = "release" ]; then
    echo "🚀 Creating git flow release..."

    # Read version from Cargo.toml
    if [ -f "Cargo.toml" ]; then
        VERSION=$(grep -E '^version = ' Cargo.toml | head -1 | sed 's/version = "\(.*\)"/\1/' | tr -d '"')
        if [ -z "$VERSION" ]; then
            # Try workspace.package version
            VERSION=$(grep -A 10 '\[workspace\.package\]' Cargo.toml | grep -E '^version = ' | head -1 | sed 's/version = "\(.*\)"/\1/' | tr -d '"')
        fi

        if [ -z "$VERSION" ]; then
            echo "❌ Could not read version from Cargo.toml"
            exit 1
        fi

        echo "📦 Found version in Cargo.toml: $VERSION"
        RELEASE_VERSION="v$VERSION"
    else
        echo "❌ Cargo.toml not found"
        exit 1
    fi

    # Check current branch
    CURRENT_BRANCH=$(git branch --show-current)
    echo "🔵 Current branch: $CURRENT_BRANCH"

    # If not on develop, switch to develop
    if [ "$CURRENT_BRANCH" != "develop" ]; then
        echo "🔄 Switching to develop branch..."
        git checkout develop
        git pull --rebase origin develop
    else
        git pull --rebase origin develop
    fi

    # Add and commit any pending changes to develop
    git add .
    git commit -m "Prepare release $RELEASE_VERSION" || echo "No changes to commit"
    git push origin develop

    # Create a tag on develop branch
    echo "🏷️ Creating tag: $RELEASE_VERSION"
    git tag -a "$RELEASE_VERSION" -m "Release $RELEASE_VERSION"
    git push origin "$RELEASE_VERSION"

    # Check if GitHub CLI is available
    if ! command -v gh &> /dev/null; then
        echo "❌ GitHub CLI (gh) is not installed. Please install it first:"
        echo "   brew install gh"
        echo "   or visit: https://cli.github.com/"
        exit 1
    fi

    # Check if user is authenticated
    if ! gh auth status &> /dev/null; then
        echo "❌ Not authenticated with GitHub CLI. Please run:"
        echo "   gh auth login"
        exit 1
    fi

    # Create pull request from develop to master
    echo "🔄 Creating pull request from develop to master..."
    PR_TITLE="Release $RELEASE_VERSION"
    PR_BODY="This PR contains the release $RELEASE_VERSION.

## Changes
- Version: $VERSION
- Tag: $RELEASE_VERSION

## Release Process
1. Review and approve this PR
2. Merge to master
3. GitHub Actions will automatically build and create the release with binaries

## Built Artifacts
The following binaries will be automatically built and attached to the release:
- Linux (x86_64, ARM, MIPS variants)
- Windows (x86_64)
- macOS (x86_64, ARM64)

Release tag: \`$RELEASE_VERSION\`"

    # Create the pull request
    if gh pr create \
        --title "$PR_TITLE" \
        --body "$PR_BODY" \
        --base master \
        --head develop \
        --label "release" \
        --assignee "@me"; then
        
        echo "🟢 Pull request created successfully!"
        echo "📋 Next steps:"
        echo "   1. Review the pull request"
        echo "   2. Approve and merge to master"
        echo "   3. GitHub Actions will build and create the release automatically"
        echo ""
        
        # Try to get the PR URL
        PR_URL=$(gh pr view develop --json url --jq '.url' 2>/dev/null || echo "")
        if [ -n "$PR_URL" ]; then
            echo "🔗 View the pull request: $PR_URL"
        else
            echo "🔗 Check GitHub for the pull request"
        fi
    else
        echo "❌ Failed to create pull request. Please check:"
        echo "   - GitHub CLI authentication"
        echo "   - Repository permissions"
        echo "   - Network connectivity"
        exit 1
    fi

else
    # Regular commit workflow
    CURRENT_BRANCH=$(git branch --show-current)
    echo "🔵 Working on branch: $CURRENT_BRANCH"

    # Pull and push current branch
    git pull --rebase origin "$CURRENT_BRANCH"
    git push --force-with-lease origin "$CURRENT_BRANCH"

    echo "🟢 Changes pushed to $CURRENT_BRANCH"
fi
#---------------------------------------------------------------------------------------------------
cd "$CURRENT_DIRECTORY" || exit
#===================================================================================================