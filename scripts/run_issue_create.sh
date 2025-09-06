#!/bin/bash
#===================================================================================================
# CyborgAI
# CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
# github: https://github.com/cyborg-ai-git
#===================================================================================================
DIRECTORY_BASE=$(dirname "$(realpath "$0")")
PACKAGE_NAME="$(basename "$(pwd)")"
#---------------------------------------------------------------------------------------------------
clear
#---------------------------------------------------------------------------------------------------
echo "Usage: $0 'issue_title' ['issue_description']"
echo "Creates a GitHub issue and corresponding git flow feature branch"
echo ""
#---------------------------------------------------------------------------------------------------
CURRENT_TIME=$(date +"%Y.%-m.%-d%H%M")
CURRENT_DIRECTORY=$(pwd)
#---------------------------------------------------------------------------------------------------
cd "$DIRECTORY_BASE" || exit
cd ..
#---------------------------------------------------------------------------------------------------
# Check if we have required parameters
if [ -z "$1" ]; then
    echo "❌ Error: Issue title is required"
    echo "Usage: $0 'issue_title' ['issue_description']"
    exit 1
fi

ISSUE_TITLE="$1"
ISSUE_DESCRIPTION="$2"

echo "🟢 $CURRENT_TIME - CREATE ISSUE AND BRANCH FOR: $ISSUE_TITLE"
#---------------------------------------------------------------------------------------------------
# Check if git repository exists
if [ ! -d .git ]; then
    echo "❌ No git repository found. Please initialize git repository first."
    exit 1
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
#---------------------------------------------------------------------------------------------------
# Make sure we're authenticated with GitHub
echo "🔐 Checking GitHub authentication..."
if ! gh auth status >/dev/null 2>&1; then
    echo "❌ Not authenticated with GitHub. Please run: gh auth login"
    exit 1
fi

# Check if we're in a GitHub repository
echo "🔍 Checking GitHub repository..."
REPO_INFO=$(gh repo view --json name,owner 2>&1)
if [ $? -ne 0 ]; then
    echo "❌ Not in a valid GitHub repository or repository not found on GitHub"
    echo "Debug info: $REPO_INFO"
    echo ""
    echo "💡 Make sure:"
    echo "   1. You're in the correct directory"
    echo "   2. The repository exists on GitHub"
    echo "   3. You have access to the repository"
    exit 1
fi

echo "✅ Repository found: $(echo "$REPO_INFO" | grep -o '"name":"[^"]*"' | cut -d'"' -f4)"
#---------------------------------------------------------------------------------------------------
# Create GitHub issue
echo "📝 Creating GitHub issue..."

if [ -z "$ISSUE_DESCRIPTION" ]; then
    ISSUE_OUTPUT=$(gh issue create --title "$ISSUE_TITLE" --body "Issue created on $CURRENT_TIME")
else
    ISSUE_OUTPUT=$(gh issue create --title "$ISSUE_TITLE" --body "$ISSUE_DESCRIPTION")
fi

# Extract issue number from output
ISSUE_NUMBER=$(echo "$ISSUE_OUTPUT" | grep -o '/issues/[0-9]\+' | sed 's/#//')

if [ -z "$ISSUE_NUMBER" ]; then
    echo "❌ Failed to create GitHub issue"
    exit 1
fi

echo "✅ Created GitHub issue #$ISSUE_NUMBER: $ISSUE_TITLE"
echo "🔗 Issue URL: $ISSUE_OUTPUT"
#---------------------------------------------------------------------------------------------------
# Create sanitized branch name
# Remove special characters and replace spaces with underscores
SANITIZED_TITLE=$(echo "$ISSUE_TITLE" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9 ]//g' | sed 's/ /_/g' | sed 's/__*/_/g' | sed 's/^_\|_$//g')

# Create branch name with issue prefix
BRANCH_NAME="issue_${ISSUE_NUMBER}_${SANITIZED_TITLE}"

# Truncate branch name if too long (Git has limits around 250 chars, but let's be safe)
if [ ${#BRANCH_NAME} -gt 60 ]; then
    SANITIZED_TITLE=$(echo "$SANITIZED_TITLE" | cut -c1-$((60 - ${#ISSUE_NUMBER} - 7)))  # 7 for "issue__"
    BRANCH_NAME="issue_${ISSUE_NUMBER}_${SANITIZED_TITLE}"
fi

echo "🌿 Branch name: $BRANCH_NAME"
#---------------------------------------------------------------------------------------------------
# Switch to develop branch and update
echo "🔄 Switching to develop branch..."
git checkout develop
git pull origin develop

# Create git flow feature branch
echo "🚀 Creating git flow feature branch..."
git flow feature start "$BRANCH_NAME"

# Push the new branch to remote
echo "📤 Pushing branch to remote..."
git push -u origin "feature/$BRANCH_NAME"

echo ""
echo "🟢 SUCCESS! Issue and branch created:"
echo "   📋 Issue: #$ISSUE_NUMBER - $ISSUE_TITLE"
echo "   🌿 Branch: feature/$BRANCH_NAME"
echo "   🔗 Issue URL: $ISSUE_OUTPUT"
echo ""
echo "💡 Next steps:"
echo "   1. Work on your changes in the feature/$BRANCH_NAME branch"
echo "   2. When done, finish the feature: git flow feature finish $BRANCH_NAME"
echo "   3. Close the issue: gh issue close $ISSUE_NUMBER"
echo ""
echo "🔧 Useful commands:"
echo "   - Check current branch: git branch --show-current"
echo "   - View issue: gh issue view $ISSUE_NUMBER"
echo "   - List all issues: scripts/run_issue_list.sh"
#---------------------------------------------------------------------------------------------------
cd "$CURRENT_DIRECTORY" || exit
#===================================================================================================