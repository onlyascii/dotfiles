#!/bin/bash
export DOTFILES_ORG=${1:-onlyascii}
export DOTFILES_PROJECT=${2:-dotfiles}
export DOTFILES_BRANCH=${3:-master}
export GITHUB_REPO="https://github.com/${DOTFILES_ORG}/${DOTFILES_PROJECT}.git"

if [ "$DOTFILES_PROJECT" ] && [ -d "$DOTFILES_PROJECT" ]; then
  echo "Removing existing $DOTFILES_PROJECT"
  rm -rf "$DOTFILES_PROJECT"
fi

echo "Cloning ${GITHUB_REPO}#${DOTFILES_BRANCH}..."
git clone -c advice.detachedHead=false --depth=1 -b $DOTFILES_BRANCH $GITHUB_REPO
