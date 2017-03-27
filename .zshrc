source ~/.bashrc

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

#  General Productivity
## Show git status on an empty <Return>
accept-line() {
  if [[ -z $BUFFER && -d .git ]]; then
    zle -I
    git status
  else
    zle ".$WIDGET"
  fi
}
zle -N accept-line

#
# User configuration sourced by interactive shells
#

# Source zim
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
