# ZSH settings

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"
plugins=(zsh-autosuggestions gh)
source $ZSH/oh-my-zsh.sh
export ZSH_AUTOSUGGEST_HISTORY_IGNORE="cd *"


# GitHub aliases

getbranch () {
    git rev-parse --abbrev-ref HEAD
}

ggl () {
    git pull origin $(getbranch)
}

alias count="ls -1 | wc -l" # count files in current directory
alias ggp="git push origin HEAD"
alias gap="git add -p"
alias gsh="git show"
alias gcb="git checkout -b"
alias gsta="git stash"
alias gst="git status"
alias glo="git log"
alias gco="git checkout"
alias gcd="git checkout develop"
alias gmd="git merge develop"
alias gstaa="git stash apply"
alias grh1="git reset HEAD~1"
alias gcad="git commit --amend --date=now"


# Misc.

export GIT_EDITOR=nvim
export BAT_THEME=Nord
export FZF_DEFAULT_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
eval "$(pyenv init -)"
alias dcu="docker compose up"
alias py="python3"
