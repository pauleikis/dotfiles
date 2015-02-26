if [[ "$SHELL" != *zsh ]]
  then
    chsh -s `which zsh`
    /usr/bin/env zsh
    source ~/.zshrc
fi
