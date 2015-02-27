# Use colors in coreutils utilities output
alias ls='ls -AlG'
alias grep='grep --color'

# Aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'

# Update dotfiles
function dfu() {
    (
        cd ~/.suit && git pullff && ./install -q
    )
}
