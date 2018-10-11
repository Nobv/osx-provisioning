#!/bin/bash

message () {
  printf "\n\033[1m\033[34m%s\033[0m\n\n" "==> ${1}"
}

message "install brew apps!!"

is_exsits () {
  which "$1" >/dev/null 2>&1
  return $?
}

# Tools
#message "Instaling bash4.x..."
#brew install bash

if [ ${SHELL} != "/usr/local/bin/zsh" ]; then
  message "Installing zsh..."
  brew install zsh
  zsh --version

  sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
  chsh -s /usr/local/bin/zsh
  #exec $SHELL -l
  #echo $SHELL
fi

if ! is_exsits "git"; then
  message "Installing git..."
  brew install git
  git --version
fi

if ! is_exsits "ansible"; then
  message "Insstalling ansible..."
  brew install ansible
  ansible --version
fi

if ! is_exsits "mas"; then
  message "Installing mas..."
  brew install mas
  mas version
fi

if ! is_exsits "tmux"; then
  message "Installing tmux..."
  brew install tmux
  tmux -V
fi

if ! is_exsits "code"; then
  message "Installing visual-studio-code..."
  brew  cask install visual-studio-code
  code -v
fi

# Languages

if ! is_exsits "erl"; then
  message "Installing Erlang..."
  brew install erlang
  erl -version
fi

if ! is_exsits "lua"; then
  message "Installing Lua..."
  brew install lua
  lua -v
fi

if ! is_exsits "python3"; then
  message "Installing python3..."
  brew install python3
  python3 --version
fi


# Commands

if ! is_exsits "jq"; then
  message "Installing jq..."
  brew install jq
  jq --version
fi

if ! is_exsits "fzf"; then
  message "Installing fzf..."
  brew install fzf
  fzf --version
fi

if ! is_exsits "hub"; then
  message "Installing hub..."
  brew install hub
  hub --version
fi

if ! is_exsits "tree"; then
  message "Installing tree..."
  brew install tree
  tree -v
fi

if ! is_exsits "ghq"; then
  message "Installing ghq..."
  brew install ghq
  ghq --version
fi

if ! is_exsits "peco"; then
  message "Installing peco..."
  brew install peco
  peco --version
fi

# Dependencies

if [ $(which vim) = "/usr/bin/vim" ]; then
  message "Installing vim --with-lua --with-python3"
  brew install vim --with-lua --with-python3
  vim --version
fi

if [ ! -n $(pip3 freeze | grep neovim) ]; then
  message "Installing pip3 neovim..."
  pip3 install neovim
  pip3 freeze | grep neovim
fi


