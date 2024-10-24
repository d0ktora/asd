# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/doktora/.zshrc'

autoload -Uz compinit
compinit
PROMPT="[%F{yellow}%n@%m %F{reset} %F{140}%~%F{reset}]"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

alias vim='nvim'
alias ls='ls --color=auto'
alias ip='ip --color=auto'
alias pacman='pacman --color=auto'
# End of lines added by compinstall
