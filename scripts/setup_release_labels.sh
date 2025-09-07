#!/bin/bash
#===================================================================================================
# CyborgAI - Setup Release Labels
# CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
#===================================================================================================

echo "🏷️ Setting up GitHub labels for releases..."

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

# Create release label
echo "Creating 'release' label..."
if gh label create "release" --description "Release related pull requests and issues" --color "0052cc" 2>/dev/null; then
    echo "✅ Release label created successfully"
else
    echo "⚠️ Release label already exists or couldn't be created"
fi

# Create other useful labels
echo "Creating additional useful labels..."

gh label create "enhancement" --description "New feature or request" --color "a2eeef" 2>/dev/null || echo "Enhancement label exists"
gh label create "bug" --description "Something isn't working" --color "d73a49" 2>/dev/null || echo "Bug label exists"
gh label create "documentation" --description "Improvements or additions to documentation" --color "0075ca" 2>/dev/null || echo "Documentation label exists"

echo "🟢 Label setup completed!"