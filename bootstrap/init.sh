if [[ "$SHELL" != *zsh ]]
  then
    chsh -s `which zsh`
    /usr/bin/env zsh
fi

source ~/.zshrc

exit 0
