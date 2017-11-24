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


# my aliases:

alias eg="emacsclient --alternate-editor="" -c"
alias v="emacsclient --alternate-editor="" "
alias e="emacsclient --alternate-editor="" "
alias c="cmus "
alias vimrc="$EDITOR ~/.vimrc"
alias mtr="metronome"
alias cpdot="cp .vimrc ~/.zprezto/runcoms/.zshrc .spacemacs .muttrc ~/.zprezto/runcoms/.zpreztorc .tmux.conf ~/Documents/dotfiles"
alias tomobi="~/kindlegen "
alias mu="mutt"
alias da="date"
alias ag="sudo apt-get "
alias g="git "
alias rkt="racket"
alias py="python3.5 "
alias lua="lua5.3 "
alias sudoku="cd ~/Downloads/nudoku && ./src/nudoku"
alias shut="shutdown now"
alias vi="nvim"

# fasd aliases:

alias f='fasd -f'        # file
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='fasd_cd -d -i' # cd with interactive selection
