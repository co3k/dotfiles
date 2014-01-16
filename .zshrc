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
PROMPT="%m:%1~ %n$ "

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

export PATH=/usr/local/opt/httpd/sbin:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
