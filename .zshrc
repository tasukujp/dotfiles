export LANG=ja_JP.UTF-8
export EDITOR=vim

autoload -Uz compinit && compinit
autoload -Uz colors && colors

PROMPT="${fg[cyan]}%~${reset_color} %# "

HISTFILE="$HOME/.zsh_history"
HISTSIZE=1000000
SAVEHIST=1000000

setopt hist_ignore_dups
setopt no_beep
setopt nonomatch
setopt share_history

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-completions/zsh-completions.plugin.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(direnv hook zsh)"
. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH="$HOME/bin:$PATH"
export PATH="$(brew --prefix openssl@1.1)/bin:$PATH"
export PATH="$(brew --prefix mysql@5.7)/bin:$PATH"

export LDFLAGS="-L$(brew --prefix openssl@1.1)/lib"
export CPPFLAGS="-I$(brew --prefix openssl@1.1)/include"

# alias
alias ls='exa --grid --color auto --icons --sort=type'
alias ll='exa --long --color always --icons --sort=type'
alias lsa='exa --grid --all --color auto --icons --sort=type'
alias lla='exa --long --all --color auto --icons --sort=type'

alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gp='git push origin'
alias gs='git status'
alias gcm='git commit -m'
