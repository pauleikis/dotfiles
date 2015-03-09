#cd without cd
setopt autocd

#Nicer history
export HISTSIZE=1048576
export HISTFILE="$HOME/.zsh_history"
export SAVEHIST=$HISTSIZE

export CLICOLOR=1

unsetopt menu_complete

setopt inc_append_history
setopt share_history
setopt hist_ignore_space
setopt hist_verify
setopt extended_history
setopt hist_expire_dups_first
