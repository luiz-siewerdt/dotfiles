export ZSH=~/.oh-my-zsh

export DEV=$HOME/Documents/DevOffice
export CONFIG=$HOME/.config
export DOTFILES=$HOME/Documents/dotfiles
export DOTNET_ROOT=$HOME/.dotnet

export SUDO_EDITOR=nvim
export EDITOR=nvim
export VISUAL=nvim


export BROWSER="brave"

ZSH_THEME="shampoo-shrek"

plugins=(
  # tmux
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export PATH=$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools
export PATH="$PATH:/home/shampoo-shrek/.spicetify"
export PATH="$DEV/scripts":$PATH
export PATH="$HOME/":$PATH
export PATH="$HOME/.spicetify":$PATH
export PATH="$HOME/.local/bin":$PATH
export PATH="$HOME/.local/kitty.app/bin/":$PATH
export PATH="$HOME/.cargo/bin":$PATH
export PATH="/usr/local/bin":$PATH
export PATH="/opt/nvim-linux64/bin":$PATH
export PATH="/opt/apache-maven-3.9.6/bin":$PATH
