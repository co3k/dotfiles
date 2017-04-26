fpath=(/usr/local/share/zsh-completions $fpath)

alias ls='ls -G'
alias ctags='ctags -R --regex-php="/^[ \t]*const[ \t]+([a-z0-9_]+)/\1/d/i" --exclude=cache'
alias gg="git grep --break --heading"
export LSCOLORS=gxfxcxdxbxegedabagacgx

zstyle ':completion:*' list-colors di=36 ln=36 fi=0
zstyle ':completion:*' completer _complete
zstyle :compinstall filename '/Users/co3k/.zshrc'
autoload -Uz compinit
compinit
setopt correct

bindkey -v
bindkey -M vicmd '/' history-incremental-search-forward
bindkey -M vicmd '?' history-incremental-search-backward
bindkey '^R' history-incremental-search-forward
bindkey '^S' history-incremental-search-backward

autoload -U colors && colors
autoload -Uz vcs_info
zstyle ':vcs_info:*' formats ' (%b)'
zstyle ':vcs_info:*' actionformats ' (%b|%a)'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="%{$fg[red]%}%m%{$reset_color%}:%{$fg[blue]%}%1~%{$reset_color%}%1(v|%F%1v%f|) %{$fg[white]%}%n%{$reset_color%}$(if [ $(date +"%k") -gt 19 ] ; then echo "🍺"; else echo "💰"; fi)  "
RPROMPT=""

setopt auto_pushd
function chpwd() { ls }

autoload bashcompinit
bashcompinit

function tag()
{
    vi -c "tag $1"
}

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt hist_reduce_blanks
setopt share_history
setopt EXTENDED_HISTORY

alias vi='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 ~/Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export EDITOR=vi
alias bcat='bcat --host=bcat.localhost'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# path
export PATH="$HOME/go/bin:$HOME/go_appengine:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$HOME/.anyenv/envs/phpenv/shims:/usr/local/opt/httpd/sbin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:$HOME/bin:$PATH"
export GOPATH="$HOME/go"
export GO15VENDOREXPERIMENT=1

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

export iOSOpenDevPath=/opt/iOSOpenDev
export iOSOpenDevDevice=
export PATH=/opt/iOSOpenDev/bin:$PATH
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# The next line updates PATH for the Google Cloud SDK.
source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
source "$HOME/google-cloud-sdk/completion.zsh.inc"

export PATH="$HOME/.yarn/bin:$PATH"
