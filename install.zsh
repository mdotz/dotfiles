#!/bin/zsh

# Install homebrew and kitty beforehand

if ! ls | grep -q "^install\.zsh$"; then
    echo "Error: install.zsh not found in current directory" >&2
    echo "Please cd to the directory containing install.sh and run it again" >&2
    exit 1
fi

echo "*** Installing brew packages ***"
echo "- neovim"
brew install neovim

echo "- yazi"
brew install yazi

echo "- zellij"
brew install zellij

echo "*** *** ***"

echo "*** Creating config symlinks ***"

echo "- kitty"
ln -s $(pwd)/kitty ~/.config/kitty

echo "- nvim"
ln -s $(pwd)/nvim ~/.config/nvim

echo "- zellij"
ln -s $(pwd)/zellij ~/.config/zellij

echo "*** *** ***"

echo "*** Installing oh-my-zsh ***"

if [[ -z "$ZSH" ]]; then
  echo "  oh-my-zsh already installed"
  ZSH="${ZSH:-$HOME/.oh-my-zsh}"
  ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "*** *** ***"

echo "*** Adding stuff to zshrc ***"
ZSHRC_PATH="$HOME/.zshrc"
SOURCE_COMMAND="source $(pwd)/.zshrc_dotfiles"

if grep -q "$SOURCE_COMMAND" "$ZSHRC_PATH"; then
    echo "  Line '$SOURCE_COMMAND' already exists in $ZSHRC_PATH"
else
     echo $SOURCE_COMMAND >> $ZSHRC_PATH
     echo "  Added '$SOURCE_COMMAND' to $ZSHRC_PATH"
     echo "  !!! Note that parts of your .zshrc might be overriden by .zshrc_dotfiles !!!"
fi

source "$ZSHRC_PATH"

if [[ -z "$ZSH_CUSTOM" ]]; then
  echo "!!! zsh custom not set !!!"
else
  git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode

  git clone https://github.com/marlonrichert/zsh-autocomplete $ZSH_CUSTOM/plugins/zsh-autocomplete

  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

PLUGINS_LINE_NUMBER=$(grep -n '^\s*plugins=' $ZSHRC_PATH | tail -1 | cut -d: -f1)
PLUGINS="git zsh-vi-mode zsh-autocomplete zsh-autosuggestions"

sed -i '' "${PLUGINS_LINE_NUMBER}c\\
plugins=($PLUGINS)\\
" "$ZSHRC_PATH"

echo "*** *** ***"

echo "To apply changes immediately, run: source ~/.zshrc"
