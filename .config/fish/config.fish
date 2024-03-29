## Set values
# Hide welcome message
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Set settings for https://github.com/franciscolourenco/done
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low


set -g theme_display_git no
set -g theme_display_git_untracked no
set -g theme_display_git_ahead_verbose yes
#set -g theme_git_worktree_support yes
#set -g theme_display_vagrant yes
#set -g theme_display_docker_machine no
#set -g theme_display_hg yes
#set -g theme_display_virtualenv no
#set -g theme_display_ruby no
#set -g theme_display_user yes
#set -g theme_display_vi no
#set -g theme_display_date no
#set -g theme_display_cmd_duration yes
#set -g theme_title_display_process yes
#set -g theme_title_display_path no
#set -g theme_title_use_abbreviated_path no
set -g theme_date_format "+%a %H:%M"
#set -g theme_avoid_ambiguous_glyphs yes
#set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_show_exit_status yes
#set -g default_user your_normal_user
set -g theme_color_scheme nord
set -g fish_color_autosuggestion '#4c566a'

#set -g fish_prompt_pwd_dir_length 0
#set -g theme_project_dir_length 1


abbr -a afk 'open -a /System/Library/CoreServices/ScreenSaverEngine.app'
abbr -a airport /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

set LC_CTYPE "en_US.UTF-8"

set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD

function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

# Fish command history
function history
    builtin history --show-time='%F %T '
end

function backup --argument filename
    cp $filename $filename.bak
end

# Copy DIR1 DIR2
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
	set from (echo $argv[1] | trim-right /)
	set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end


## Useful aliases
# Replace ls with exa
#alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
#alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
#alias ll='exa -l --color=always --group-directories-first --icons'  # long format
#alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
#alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles

# Replace some more things with better alternatives
#alias cat='bat --style header --style rules --style snip --style changes --style header'
#[ ! -x /usr/bin/yay ] && [ -x /usr/bin/paru ] && alias yay='paru --bottomup'

# Common use
alias aup="pamac upgrade --aur"
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias upd='sudo reflector --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist && sudo pacman -Syu && fish_update_completions && sudo updatedb && sudo -H DIFFPROG=meld pacdiff'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware

if contains (uname) "Linux"
    alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
    alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages

    # Get fastest mirrors
    alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
    alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
    alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
    alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

    # Help people new to Arch
    alias apt='man pacman'
    alias apt-get='man pacman'
    alias pacdiff='sudo -H DIFFPROG=meld pacdiff'               # Compare .pacnew & .pacsave files
    alias helpme='cht.sh --shell'
    alias please='sudo'
    alias tb='nc termbin.com 9999'
    alias paru="paru --bottomup"

    # Cleanup orphaned packages
    alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

    # Get the error messages from journalctl
    alias jctl="journalctl -p 3 -xb"

    # Recent installed packages
    alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"



end



# Common
starship init fish | source

if contains (uname) "Linux"
    source ~/.profile

    # Add ~/.local/bin to PATH
    if test -d ~/.local/bin
        if not contains -- ~/.local/bin $PATH
            set -p PATH ~/.local/bin
        end
    end

    # Add depot_tools to PATH
    if test -d ~/Applications/depot_tools
        if not contains -- ~/Applications/depot_tools $PATH
            set -p PATH ~/Applications/depot_tools
        end
    end

    if status --is-interactive
        paleofetch
    end

else
    # Mac?
    kitty + complete setup fish | source

    # Set pyenv correctly..
    status is-login; and pyenv init --path | source
    pyenv init - | source
end


# neofetch
## set -x PATH "/usr/local/sbin" $PATH
set -x PATH $PATH "/var/lib/snapd/snap/bin" 
