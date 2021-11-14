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
zstyle ':vcs_info:*' formats " (%b)"
zstyle ':vcs_info:*' actionformats ' (%b|%a)'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
PROMPT="%{$fg[red]%}%m%{$reset_color%}:%{$fg[blue]%}%1~%{$reset_color%}%1(v|%F%{$fg[yellow]%}%1v%f|) %{$fg[white]%}%n%{$reset_color%}$(if [ $(date +"%k") -gt 19 ] ; then echo "💰"; else echo "💰"; fi)  "
RPROMPT=""

function zle-line-init zle-keymap-select {
    VIM_NORMAL="[NORMAL]"
    VIM_INSERT="[INSERT]"
    RPS1="${${KEYMAP/vicmd/$VIM_NORMAL}/(main|viins)/$VIM_INSERT}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

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

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
export EDITOR=vi
alias bcat='bcat --host=bcat.localhost'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Colorize STDERR
# from http://wikigentoo.ksiezyc.pl/Zsh.htm#Colorize_STDERR
#exec 2>>(while read line; do
#  print '\e[91m'${(q)line}'\e[0m' > /dev/tty; print -n $'\0'; done &)

# path
export PATH="$HOME/go/bin:$HOME/go_appengine:$HOME/Library/Android/sdk/tools:$HOME/Library/Android/sdk/platform-tools:$HOME/.anyenv/envs/phpenv/shims:/usr/local/opt/httpd/sbin:/usr/local/bin:/usr/local/sbin:/sbin:/usr/sbin:$HOME/bin:$HOME/.zinit/bin:$PATH"
export GOPATH="$HOME/go"
export GHQ_ROOT="$GOPATH/src"
export GO15VENDOREXPERIMENT=1

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
#export PATH="$HOME/.anyenv/bin:$PATH"
# eval "$(anyenv init -)"

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

export iOSOpenDevPath=/opt/iOSOpenDev
export iOSOpenDevDevice=
export PATH=/opt/iOSOpenDev/bin:$PATH
export JAVA_HOME="/Applications/Android Studio.app/Contents/jre/jdk/Contents/Home"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# The next line updates PATH for the Google Cloud SDK.
# source "$HOME/google-cloud-sdk/path.zsh.inc"

# The next line enables shell command completion for gcloud.
# source "$HOME/google-cloud-sdk/completion.zsh.inc"

export PATH="$HOME/.yarn/bin:$PATH"

# added by travis gem
[ -f /Users/k-ebihara/.travis/travis.sh ] && source /Users/k-ebihara/.travis/travis.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/k-ebihara/Documents/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/k-ebihara/Documents/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/k-ebihara/Documents/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/k-ebihara/Documents/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"
export PATH="/usr/local/opt/bison/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/bin:$PATH"
export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="$PATH:/Users/k-ebihara/work/flutter/bin"

export PATH="$HOME/.poetry/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

eval $(gimme stable)

#### Added by Zinit's installer
#if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
#    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
#    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
#    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
#        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
#        print -P "%F{160}▓▒░ The clone has failed.%f%b"
#fi
#
#: "zinit" && {
#  source "$HOME/.zinit/bin/zinit.zsh"
#  autoload -Uz _zinit
#  (( ${+_comps} )) && _comps[zinit]=_zinit
#
#  # Load a few important annexes, without Turbo
#  # (this is currently required for annexes)
#  zinit light-mode for \
#      zinit-zsh/z-a-rust \
#      zinit-zsh/z-a-as-monitor \
#      zinit-zsh/z-a-patch-dl \
#      zinit-zsh/z-a-bin-gem-node
#
#  zinit wait lucid light-mode for \
#    atinit"zicompinit; zicdreplay" \
#        zdharma/fast-syntax-highlighting \
#    atload"_zsh_autosuggest_start" \
#        zsh-users/zsh-autosuggestions \
#    blockf atpull'zinit creinstall -q .' \
#        zsh-users/zsh-completions
#
#  zinit is-snippet for \
#      OMZL::completion.zsh \
#      OMZL::key-bindings.zsh \
#      OMZL::directories.zsh
#
#  zinit wait lucid is-snippet as"completion" for \
#      OMZP::docker/_docker \
#      OMZP::docker-compose/_docker-compose \
#      OMZP::rust/_rust \
#      OMZP::cargo/_cargo \
#      OMZP::rustup/_rustup
#
#  zinit snippet OMZL::git.zsh
#  zinit snippet OMZP::git
#  zinit cdclear -q
#
#  POWERLEVEL9K_MODE="nerdfont-complete"
#  POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(vi_mode dir vcs)
#  POWERLEVEL9K_DISABLE_RPROMPT=true
#
#  setopt promptsubst
#  zinit snippet OMZT::gnzh
#  zinit light powerlevel9k/powerlevel9k
#
#  zinit cdclear -q
#
#  zinit snippet https://github.com/aws/aws-cli/blob/v2/bin/aws_zsh_completer.sh
#  zinit light lukechilds/zsh-better-npm-completion
#
#  zinit ice depth=1
#  zinit light  softmoth/zsh-vim-mode 
#
#  zinit light reegnz/jq-zsh-plugin
#
#  zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
#  autoload -U compinit
#  compinit
#  zstyle ':completion:*:default' menu select=1
#}

: "color" && {
  setopt promptsubst
  autoload -U colors
  colors
}

### End of Zinit's installer chunk

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/k-ebihara/.sdkman"
[[ -s "/Users/k-ebihara/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/k-ebihara/.sdkman/bin/sdkman-init.sh"
export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export GRADLE_HOME=$HOME/.sdkman/candidates/gradle/current
export PATH=$JAVA_HOME/bin:$GRADLE_HOME/bin:$PATH
export DOCKER_HOST=tcp://127.0.0.1:2375
