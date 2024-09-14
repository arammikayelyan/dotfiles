# Path to your oh-my-zsh installation.
export ZSH="/home/aram/.oh-my-zsh"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^r "rfv\n"
# Bind Ctrl-n to accept the zsh-autosuggestions
bindkey '^n' forward-word
bindkey '^n' autosuggest-accept

# Search history with fzf
h() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# ALIASES
alias zc="$EDITOR $HOME/.zshrc"
alias sc="source $HOME/.zshrc"
alias cl="clear"
alias dev="cd ~/Development"
alias books="cd ~/Books"
alias psy="cd ~/Books/Psychology"
alias down="cd ~/Downloads"
alias docs="cd ~/Documents"
alias vid="cd ~/Videos"
alias off="shutdown now"

## cd
alias ...='../..'
alias ....='../../..'
alias .....='../../../..'
alias ......='../../../../..'

# EXA
alias l="exa --long --header --icons --group-directories-first --no-user --no-time --no-filesize --no-permissions"
alias ll="exa --long --header --icons --group-directories-first"
alias ld="l -d */"
alias la="exa --long --header --all --icons --group-directories-first"
alias lag="exa --long --header --all --git --icons --group-directories-first"
alias lt="exa --tree --icons --group-directories-first"
alias lat="exa --tree --all --icons"

# GIT
alias gitlog="git log --graph --all --pretty='format:%C(auto)%h %C(cyan)%ar %C(auto)%d %C(magenta)%an %C(auto)%s'"
alias gitdel="git reset --hard"
alias lg="lazygit"

# TMUX
alias tn="tmux new -s"
alias ta="tmux attach"
alias td="tmux detach"
alias tat="tmux attach -t"
alias tsw="tmux switch-client -t"
alias tls="tmux ls"
alias tkt="tmux kill-session -t"

# GO
alias gor="go run"
alias gob="go build"

# Nala
alias nupd="sudo nala update"
alias nupg="sudo nala upgrade"
alias nls="nala list --upgradable"

function mcd {
  mkdir -p "$1"
  cd "$1"
}

function rmd {
  rm -rf "$1"
}

# NVM (Node Version Manager) setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_OPS='--extended'

# Go environment setup
export PATH=$PATH:/usr/local/go/bin

eval "$(starship init zsh)"
