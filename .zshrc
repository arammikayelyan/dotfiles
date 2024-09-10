# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/aram/.oh-my-zsh"

HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(git z zsh-autosuggestions zsh-syntax-highlighting ubuntu)
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

bindkey -s ^f "tmux-sessionizer\n"


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

h() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac --height "50%" | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

# ALIASES
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias zc="$EDITOR $HOME/.zshrc"
alias vc="$EDITOR $HOME/.config/nvim/init.vim"
alias sc="source $HOME/.zshrc"
alias cl="clear"
alias dev="cd ~/Development"
alias books="cd ~/Books"
alias prog="cd ~/Books/Programming"
alias psy="cd ~/Books/Psychology"
alias down="cd ~/Downloads"
alias docs="cd ~/Documents"
alias vid="cd ~/Videos"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cc="code ."
alias c="code"
alias psmem="ps axch -o cmd:15,%mem --sort=-%mem | head"
alias pscpu="ps axch -o cmd:15,%cpu --sort=-%cpu | head"
alias freemem="free -h | awk '/^Mem:/ {print $3 "/" $2}'"
alias open="xdg-open"
# Suffix alias
alias -s { md,txt,go }=vim
alias l="exa --long --header"
alias la="exa --long --header --all"
alias lag="exa --long --header --all --git"
alias lt="exa --tree"

# TMUX
alias tn="tmux new -s"
alias ta="tmux attach"
alias td="tmux detach"
alias tat="tmux attach -t"
alias tls="tmux ls"
alias tkt="tmux kill-session -t"

# GO
alias gor="go run"
alias gob="go build"

# VIM
alias v="vim"

function go_test {

  go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'

}

function mcd {
  mkdir -p "$1"
  cd "$1"
}

function rmd {
  rm -rf "$1"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fuzzy finder
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_OPS='--extended'

export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(go env GOPATH)/bin"

