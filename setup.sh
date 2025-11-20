#!/bin/bash

softwareupdate --install-rosetta --agree-to-license

ln -sfn ./.tmux.conf ~/.tmux.conf
ln -sfn ./.vimrc ~/.vimrc

# Check Homebrew
if [ ! `which brew` ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)"

  brew -v || (echo "Failed to install brew." && exit 1)
fi

brew doctor
brew bundle

# Git config
git config --global user.name "Tasuku Kakimoto"
git config --global core.editor vim
git config --global pull.ff only

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ~/.zsh/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search ~/.zsh/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting

# Add asdf plugins
asdf plugin add ruby
asdf plugin add python
asdf plugin add golang
asdf plugin add nodejs
asdf plugin add terraform
asdf plugin add gcloud
