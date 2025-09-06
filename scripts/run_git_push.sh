#!/bin/bash
#===================================================================================================
# CyborgAI
# CC BY-NC-ND 4.0 Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International
# github: https://github.com/cyborg-ai-git
#===================================================================================================
PACKAGE_NAME="$(basename "$(pwd)")"
DIRECTORY_BASE=$(dirname "$(realpath "$0")")
clear
echo "Usage with message: $0 'commit_message' release"
CURRENT_TIME=$(date +"%Y.%-m.%-d%H%M")
#---------------------------------------------------------------------------------------------------
echo "🟢 $CURRENT_TIME - RUN git $ $DIRECTORY_BASE"
#---------------------------------------------------------------------------------------------------
CURRENT_DIRECTORY=$(pwd)
#---------------------------------------------------------------------------------------------------
cd "$DIRECTORY_BASE" || exit
cd ..
#---------------------------------------------------------------------------------------------------
if [ -d .git ]; then
    echo "Git repository"
else
    sh ./run_create_github_repository.sh
fi

if [ -z "$1" ]; then
  comment="commit $CURRENT_TIME"
else
  comment="$1"
fi
#---------------------------------------------------------------------------------------------------
echo "$comment"
git config http.postBuffer 524288000
git fetch --all
git add . ;git commit -am "$comment";
#---------------------------------------------------------------------------------------------------
git pull --rebase
#git push origin main
#ONLY FOR BETA
git push --force-with-lease origin main
#---------------------------------------------------------------------------------------------------
if [ -z "$2" ]; then
  comment="$CURRENT_TIME"
else
  if [ -z "$3" ]; then
    #gh auth login
    git tag "$3";git push origin --tags
    gh release create "$3" --title ""$3" Release" --notes "$PACKAGE_NAME"
  fi
fi
#---------------------------------------------------------------------------------------------------
cd "$CURRENT_DIRECTORY" || exit
#===================================================================================================