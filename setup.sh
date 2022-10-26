#!/bin/bash

# Check Homebrew
if [ ! `which brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)"

  brew -v || (echo "Failed to install brew." && exit 1)
fi

brew doctor
brew bundle

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-searc
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
