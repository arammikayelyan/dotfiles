# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="spaceship"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="dd.mm.yyyy"

plugins=(
  git
  z
  zsh-autosuggestions
  zsh-syntax-highlighting
  ubuntu
)

source $ZSH/oh-my-zsh.sh

# User configuration
SPACESHIP_TIME_SHOW=true 

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# ALIASES
alias dotfiles="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias zc="$EDITOR $HOME/.zshrc"
alias vc="$EDITOR $HOME/.vimrc"
alias sc="source $HOME/.zshrc"
alias cls="clear"
alias dev="cd ~/Projects"
alias books="cd ~/Books"
alias prog="cd ~/Books/Programming"
alias psy="cd ~/Books/Psychology"
alias down="cd ~/Downloads"
alias docs="cd ~/Documents"
alias vid="cd ~/Videos"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cc="code ."
alias c="code"
# alias ll="ls -1a --group-directories-first"
alias lc="colorls -lA --sd"
alias psmem="ps axch -o cmd:15,%mem --sort=-%mem | head"
alias pscpu="ps axch -o cmd:15,%cpu --sort=-%cpu | head"
alias freemem="free -h | awk '/^Mem:/ {print $3 "/" $2}'"
alias open="xdg-open"
alias mv='mv -i'
alias rm='rm -i'
# Suffix alias
alias -s { md,txt,go }=vim

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

function .. {
  builtin cd ../ "$@" && ll
}

function cd {
  builtin cd "$@" && ll
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
# export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export FZF_DEFAULT_OPS='--extended'

export PATH=/home/aram/.nvm/versions/node/v13.3.0/bin:/home/aram/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/bin:/usr/local/go/bin:/home/aram/.fzf/bin:/usr/local/go/bin:~/.local/bin

fpath+=${ZDOTDIR:-~}/.zsh_functions
