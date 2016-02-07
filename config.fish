set fish_color_autosuggestion FFC473
set fish_color_command FF9400
set fish_color_comment A63100
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_end FF4C00
set fish_color_error FFDD73
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host \x2do\x1ecyan
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param FFC000
set fish_color_quote BF9C30
set fish_color_redirection BF5B30
set fish_color_search_match \x2d\x2dbackground\x3dpurple
set fish_color_status red
set fish_color_user \x2do\x1egreen
set fish_color_valid_path \x2d\x2dunderline
set fish_greeting Welcome\x20to\x20fish\x2c\x20the\x20friendly\x20interactive\x20shell\x0aType\x20\x1b\x5b32mhelp\x1b\x5b30m\x1b\x28B\x1b\x5bm\x20for\x20instructions\x20on\x20how\x20to\x20use\x20fish
set fish_key_bindings vi_mode_insert
set fish_pager_color_completion normal
set fish_pager_color_description 555\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan

alias ctags='ctags -R --regex-php="/^[ \t]*const[ \t]+([a-z0-9_]+)/\1/d/i" --exclude=cache'
alias gg="git grep --break --heading"
alias vi='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim $argv'
alias vim='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim $argv'

function tag
    vi -c "tag $argv"
end

# path
set -gx PATH "/usr/local/opt/httpd/sbin" "/usr/local/bin" "/usr/local/sbin" "/sbin" "/usr/sbin" "$HOME/bin" $PATH
set -gx GOPATH "$HOME/go"

### Added by the Heroku Toolbelt
set -gx PATH /usr/local/heroku/bin $PATH
set -gx PATH $HOME/.anyenv/bin $PATH

eval "(anyenv init -)"

# added by travis gem
[ -f /Users/k-ebihara/.travis/travis.sh ]; and source /Users/k-ebihara/.travis/travis.sh

set -gx iOSOpenDevPath /opt/iOSOpenDev
set -gx iOSOpenDevDevice ""
set -gx PATH /opt/iOSOpenDev/bin $PATH

set -gx NVM_DIR ~/.nvm
source (brew --prefix nvm)/nvm.sh
