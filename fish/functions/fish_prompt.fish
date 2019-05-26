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

function fish_prompt
        set last_status $status

        # [ marcin @ x250 ]
        set_color ff0000
        echo -n "["
        set_color ff2a00
        echo -n " "
        set_color ff5500
        echo -n "m"
        set_color ff7f00
        echo -n "a"
        set_color ffaa00
        echo -n "r"
        set_color ffd400
        echo -n "c"
        set_color ffff00
        echo -n "i"
        set_color bfff00
        echo -n "n"
        set_color 80ff00
        echo -n " "
        set_color 40ff00
        echo -n "@"
        set_color 00ff00
        echo -n " "
        set_color 00ff55
        echo -n "x"
        set_color 00ffaa
        echo -n "2"
        set_color 00ffff
        echo -n "5"
        set_color 00aaff
        echo -n "0"
        set_color 0055ff
        echo -n " "
        set_color 0000ff
        echo -n "]"
        echo -n " "
        # [ pwd ]
        set_color 00c3aa
        echo -n "["
        echo -n " "
        printf '%s' (prompt_pwd)
        echo -n " "
        echo -n "]"
        echo -n " "
        # [ git branch ]
        set_color normal
        printf '%s ' (__fish_git_prompt) | sed 's/(/[ /;s/)/ ]/'
        # cursor
        set_color 00aaff
        printf "\n 🐟 "
        set_color normal
end
