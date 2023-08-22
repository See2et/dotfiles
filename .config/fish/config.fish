
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# I use oh-my-fish/theme-bobthefish as theme
# See document, https://github.com/oh-my-fish/theme-bobthefish
set -g default_user your_normal_user
set -g theme_date_format "+%a %H:%M"
set -g theme_date_timezone Asia/Tokyo
set -g theme_powerline_fonts no
set -g theme_nerd_fonts yes
set -g theme_color_scheme solarized
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_newline_cursor yes
set -g theme_newline_prompt '$ '

fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin
fish_add_path ~/.cargo/bin
fish_add_path ~/.deno/bin

function fish_user_key_bindings
  bind €cr 'peco_select_history (commandline -b)'
end

balias v nvim
balias g git
balias cl clear
balias fish_load . ~/.config/fish
balias gs 'cd $(ghq root)/$(ghq list | peco)'
balias ph 'peco_select_history (commandline -b)'

function __fish_cancel_commandline
    commandline ""
    commandline -f repaint
end
bind \cc __fish_cancel_commandline
