. "$HOME/.config/fish/functions/aliases.fish"

# Start X at login
if status --is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx
  end
end

xset r rate 250 40

set -g fish_prompt_pwd_dir_length 20
