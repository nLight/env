#  Git
## Git undo
alias gundo="git reset HEAD~1"

## Resolve conflicts
alias conflicts='git status -s | grep -e "^\(DD\|AU\|UD\|UA\|DU\|AA\|UU\)" | cut -d " " -f2'
alias resolve='conflicts | xargs atom-beta'
alias cadd='conflicts | xargs git add'

## fbr - checkout git branch (including remote branches), sorted by most recent commit, limit 30 last branches
fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

## fco - checkout git branch/tag
fco() {
  local tags branches target
  tags=$(
    git tag | awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') || return
  branches=$(
    git branch --all | grep -v HEAD             |
    sed "s/.* //"    | sed "s#remotes/[^/]*/##" |
    sort -u          | awk '{print "\x1b[34;1mbranch\x1b[m\t" $1}') || return
  target=$(
    (echo "$tags"; echo "$branches") |
    fzf-tmux -l30 -- --no-hscroll --ansi +m -d "\t" -n 2) || return
  git checkout $(echo "$target" | awk '{print $2}')
}



## WIP
alias wip="git commit -am \"WIP\" --no-verify"

## Open changed files in editor
alias changes='git status -s | grep -e "^\(\\sM\|\\?\\?\)" | rev | cut -d" " -f1 | rev | xargs atom-beta'

alias g="git"
alias gcm="git commit -m"
alias gco="git checkout"
alias gs="git status"
alias fixup="git commit --fixup"
alias fixlast="git commit --fixup HEAD~"
alias gri="git rebase -i"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
