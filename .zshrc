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



# aliases:

alias v="emacsclient --alternate-editor="" -t "
alias e="emacsclient --alternate-editor="" -t "
alias c="cmus "
alias x="exit"
alias cl="clear"
alias vimrc="$EDITOR ~/.vimrc"
alias space="$EDITOR ~/.spacemacs"
alias mtr="metronome"
alias cpdot="cp .vimrc .zshrc .spacemacs ~/Documents/dotfiles"
alias tomobi="~/kindlegen "
alias da="date"
alias ag="sudo apt-get "
alias g="git "
alias pdf="atril "
alias T="| tail"
alias L="| less"
alias H="| head"

# fasd aliases:

alias f='fasd -f'        # file
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias j='fasd_cd -d'     # cd, same functionality as j in autojump
alias jj='fasd_cd -d -i' # cd with interactive selection
