# Use colors in coreutils utilities output
alias ls='ls -Al'
alias grep='grep --color'
alias egrep='egrep --color'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

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

# navigation
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# git
alias gst='git status -sb'
alias gu='git pull'
alias gp='git push'

# my dot files
function dfu() {
    (
        cd ~/.suit && git pull --ff-only && ./install -q
    )
}
function dot() {
  atom ~/.suit/zsh/$1.zsh || vim ~/.suit/zsh/$1.zsh || nano ~/.suit/zsh/$1.zsh
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

if [[ $IS_MAC -eq 1 ]]; then
    # view man pages in Preview
    pman() { ps=`mktemp -t manpageXXXX`.ps ; man -t $@ > "$ps" ; open "$ps" ; }
fi
