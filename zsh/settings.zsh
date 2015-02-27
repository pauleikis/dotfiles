#cd without cd
setopt autocd

#load completion
autoload -U compinit
compinit -d "~/.suit/zcompdump"
#completion menu
zstyle ':completion:*' menu select
# fuzzy matching of completions for when you mistype them
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
# get better autocompletion accuracy by typing longer words
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*'   force-list always
#speed
zstyle ':completion:*' accept-exact '*(N)'
#hostname and remote dir completion
zstyle ':completion:*:(ssh|scp|ftp):*' hosts $hosts
zstyle ':completion:*:(ssh|scp|ftp):*' users $users


#Nicer history
HISTSIZE=1048576
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE

unsetopt menu_complete

setopt inc_append_history
setopt share_history
setopt hist_ignore_space
setopt hist_verify
setopt extended_history
setopt hist_expire_dups_first
