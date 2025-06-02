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
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "*** *** ***"

echo "*** Adding stuff to zshrc ***"
ZSHRC_PATH="$HOME/.zshrc"
BREW_EVAL="eval \$(/opt/homebrew/bin/brew shellenv)"

if grep -Fxq "$BREW_EVAL" "$ZSHRC_PATH"; then
    echo "  Line '$BREW_EVAL' already exists in $ZSHRC_PATH"
else
     printf '%s\n%s' "$BREW_EVAL" "$(cat "$ZSHRC_PATH")" > "$ZSHRC_PATH"
    echo "  Added '$BREW_EVAL' to beginning of $ZSHRC_PATH"
fi

YAZI_FUNCTION='function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '\'''\'' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}'

if grep -q "function y()" "$ZSHRC_PATH"; then
    echo "  Function y() already exists in $ZSHRC_PATH"
else
    echo "" >> "$ZSHRC_PATH"  # Add blank line before function
    echo "$YAZI_FUNCTION" >> "$ZSHRC_PATH"
    echo "" >> "$ZSHRC_PATH"  # Add blank line after function
    echo "  Added yazi function y() to $ZSHRC_PATH"
fi

echo "*** *** ***"

echo "To apply changes immediately, run: source ~/.zshrc"
