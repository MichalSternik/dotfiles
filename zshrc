#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export TERM=xterm-256color

# my aliases:

alias e="emacsclient --alternate-editor="" -ct"
alias eg="emacsclient --alternate-editor="" -c"
alias v="emacsclient --alternate-editor="" -ct"
alias c="TERM=tmux-256color cmus "
alias home="cd ~; clear"
alias vimrc="vi ~/.vimrc"
alias mtr="metronome"
alias cpdot="cp .vimrc ~/.zprezto/runcoms/* .spacemacs .weechat .muttrc .tmux.conf ~/Documents/dotfiles"
alias tomobi="~/kindlegen "
alias mu="mutt"
alias baduk="sudo java -jar ~/Downloads/cgoban.jar"
alias apt="sudo apt-get "
alias rkt="racket"
alias py="python2.7 "
alias lua="lua5.3 "
alias shut="shutdown now"
alias irc="TERM=screen-256color weechat"
alias wee="TERM=screen-256color weechat"
alias beeti="beet import  "
alias r="ranger "
alias rm="rm -f "
alias gdball="gdb --batch --ex run --ex bt --ex q --args "
alias rtv="cd ~/Documents/books/programowanie/repos/rtv && python3.5 -m rtv"

# my functions:

mkcd()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# fasd aliases:

alias f='fasd -f'        # file
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='fasd_cd -d -i' # cd with interactive selection
