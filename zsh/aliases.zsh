# Use colors in coreutils utilities output
alias ls='ls -AlG'
alias grep='grep --color'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

# Aliases to speed up common tasks
function p() {
  head -1 <(ps aux)
  grep $@ =(ps aux)
}

# Python
function a() {
    OLD=`pwd`
    cd ~/Tools
    source python/bin/activate
    cd $OLD
}
alias d='deactivate'

# navigation
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Update dotfiles
function dfu() {
    (
        cd ~/.suit && git pull --ff-only && ./install -q
    )
}

# git
alias gst='git status -sb'
alias gu='git pull'
alias gp='git push'
