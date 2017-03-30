#  Git
## Git undo
alias gundo="git reset HEAD~1"

## Resolve conflicts
alias conflicts='git status -s | grep -e "^\(DD\|AU\|UD\|UA\|DU\|AA\|UU\)" | cut -d " " -f2'
alias resolve='conflicts | xargs atom'
alias cadd='conflicts | xargs git add'

## WIP
alias wip="git commit -am \"WIP\""

## Open changed files in sublime
alias changes='git status -s | grep -e "^\(\\sM\|\\?\\?\)" | rev | cut -d" " -f1 | rev | xargs atom'

alias g="git"
alias gcm="git commit -m"
alias gco="git checkout"
alias gs="git status"
alias fixup="git commit --fixup"
alias fixlast="git commit --fixup HEAD~"
alias gri="git rebase -i"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
