# Options
set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"

# Colors
set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red
set __fish_git_prompt_color ff28bb


# Icons
set __fish_git_prompt_char_stateseparator ' | '

function rainbow
        set -l colors ff0000 ff5700 ff8700 ffaf00 ffd700\
        ffff00 d7ff00 afff00 87ff00 57ff00\
        00ff00 00ff57 00ff87 00ffaf 00ffd7\
        00ffff 00d7ff 00afff 0087ff 0057ff\
        0000ff 5700ff 8700ff af00ff d700ff\
        ff00ff ff00d7 ff00af ff0087 ff0057

        set index 1
        for arg in (string split '' $argv)
                set_color $colors[$index]
                echo -n -s $arg
                set index (math (math $index + 1) % (count $colors) + 1)
    end
end

function fish_prompt
        set last_status $status

        # [ marcin @ x250 ]
        rainbow [_marcin_@_x250_]
        echo -n -s " "
        # [ pwd ]
        set_color 00c3aa
        echo -n -s "["
        echo -n -s " "
        printf '%s' (prompt_pwd)
        echo -n -s " "
        echo -n -s "]"
        # [ git branch ]
        set_color normal
        printf '%s ' (__fish_git_prompt) | sed 's/(/[ /;s/)/ ]/'
        # cursor
        printf "\n "
        set_color 8233cd
        echo -n -s " >"
        set_color 53e3fb
        echo -n -s ">"
        set_color d5e1f1
        echo -n -s "> "
        set_color normal
        printf "\n"
end
