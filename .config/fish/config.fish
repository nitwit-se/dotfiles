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
set -g theme_color_scheme gruvbox
#set -g fish_prompt_pwd_dir_length 0
#set -g theme_project_dir_length 1


abbr -a afk 'open -a /System/Library/CoreServices/ScreenSaverEngine.app'
abbr -a airport /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport

set LC_CTYPE "en_US.UTF-8"

set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD


## set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths

# The next line updates PATH for the Google Cloud SDK.
## if [ -f '/Users/mark/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/mark/Downloads/google-cloud-sdk/path.fish.inc'; end



kitty + complete setup fish | source

starship init fish | source


# neofetch
## set -x PATH "/usr/local/sbin" $PATH

# Set pyenv correctly..
status is-login; and pyenv init --path | source
pyenv init - | source

