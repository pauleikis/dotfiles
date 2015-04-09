# Use colors in coreutils utilities output
alias ls='ls -Alh'
alias grep='grep --color'
alias egrep='egrep --color'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

alias -g ND='*(/om[1])'
alias -g NF='*(.om[1])'

# Aliases to speed up common tasks
function p() {
  head -1 <(ps aux)
  grep -i $@ =(ps aux)
}
alias e='env | egrep -i'
alias ip='curl icanhazip.com'

# Python
function a() {
    OLD=`pwd`
    cd ~/Tools && \
    source python/bin/activate
    cd $OLD
    unset OLD
}
alias d='deactivate'

# git
alias gst='git status -sb'
alias gu='git pull'
alias gp='git push'
alias ga='git add . -A'
alias gup='git pull && git push'

# my dot files
function dfu() {
    (
        cd ~/.suit && git pull --ff-only && ./install -q
    )
}
function dot() {
  subl ~/.suit/zsh/$1.zsh ||\
  atom ~/.suit/zsh/$1.zsh ||\
  vim ~/.suit/zsh/$1.zsh ||\
  nano ~/.suit/zsh/$1.zsh
}
function koma() {
  OLD=`pwd`
  cd ~/.suit && \
  git add . && \
  git commit -m "$@" && \
  gp
  cd $OLD
  unset OLD
}

function k() {
  kill %$1
}

function clock () {
    while sleep 1;
    do
        tput sc
        tput cup 0 $(($(tput cols)-29))
        date
        tput rc
    done &
}

function count () {
    while sleep 1;
    do
        tput sc
        tput cup 0 $(($(tput cols)-10))
        echo $(($(ls | wc -l)-1))
        tput rc
    done &
}
