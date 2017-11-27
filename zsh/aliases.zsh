# Use colors in coreutils utilities output
alias ls='ls -Alho'
alias grep='grep --color'
alias egrep='egrep --color'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

alias -g ND='*(/om[1])'
alias -g NF='*(.om[1])'
alias -g NF2='*(.om[2])'

# Aliases to speed up common tasks
function p() {
  head -1 <(ps aux)
  grep -i $@ =(ps aux)
}
alias e='env | egrep -i'
alias ip='curl icanhazip.com'
alias nb='a && jupyter notebook && d'

# Python
function a() {
    OLD=`pwd`
    cd ~/Tools && \
    source python/bin/activate
    cd $OLD
    unset OLD
}
alias d='deactivate'
alias s='source .venv/bin/activate'
function i() {
  python3 -m venv .venv && \
  source .venv/bin/activate && \
  pip install --upgrade setuptools
}
function u() {
  deactivate
  rm -r .venv
}

alias fh='git diff "HEAD" | flake8 --diff'

# git
alias gst='git status -sb'
alias gu='git pull'
alias gp='git push'
alias ga='git add . -A'
alias gup='git pull && git push'
alias gcd='cd `git rev-parse --show-toplevel`'
alias git-prune='git branch --merged master | grep -v "^* master" | xargs git branch -d'
alias git-prune-echo='git branch --merged master | grep -v "^* master" | xargs echo'
alias gless='git diff --color=always | less -r'
alias grel='git for-each-ref --count=5 --sort=-committerdate refs/remotes/origin/ --format="%(authordate:short)%09%(objectname:short)%09%1B[0;33m%(refname:short)%1B[m%09"'

function mp() {
  git rebase master &&\
  git checkout master &&\
  git merge $1 &&\
  git pull &&\
  git push &&\
  git checkout $1 &&\
  git rebase master;
}

#httpie
alias -g iPhone='"User-Agent:Mozilla/5.0 (iPhone; CPU iPhone OS 8_0 like Mac OS X) AppleWebKit/600.1.3 (KHTML, like Gecko) Version/8.0 Mobile/12A4345d Safari/600.1.4"'
alias -g iPad='"User-Agent:Mozilla/5.0 (iPad; CPU OS 7_0 like Mac OS X) AppleWebKit/537.51.1 (KHTML, like Gecko) Version/7.0 Mobile/11A465 Safari/9537.53"'

# my dot files
function dfu() {
    (
        cd ~/.suit && git pull --ff-only && ./install -q
    )
}
function dot() {
  file="~/.suit/zsh/$1.zsh"
  subl $file ||\
  atom $file ||\
  vim $file ||\
  nano $file
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
function zrc() {
  file="~/.zshrc_local"
  subl $file ||\
  atom $file ||\
  vim $file ||\
  nano $file
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

function atom-pipe () {
	OUT="$(mktemp -t atom)"
	cat > $OUT
	atom $OUT
}

function perf () {
  curl -o /dev/null  -s -w "%{time_connect} + %{time_starttransfer} = %{time_total}\n" "$1"
}

function eh () {
  mkdir -p ~/Temp/hsout
  ghc $*.hs -outputdir ~/Temp/hsout && "./$1" && rm $1 && rm -r ~/Temp/hsout
}
