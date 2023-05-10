echo "Starting ~/.bash_aliases"


# Reference: https://inpa.tistory.com/entry/LINUX-%F0%9F%93%9A-Alias-%EC%84%A4%EC%A0%95-%EC%82%AC%EC%9A%A9-%EB%B0%A9%EB%B2%95-%EC%A0%95%EB%A6%AC-%EB%8B%A8%EC%B6%95%EC%96%B4-%EC%98%88%EC%8B%9CTIP
alias gs='git status'

alias gl='git log --pretty=format:"%Cgreen%h%Creset %s %C(bold blue)%cr %C(yellow)%d %an %Creset  " --abbrev-commit;'
alias gb="git branch"

alias rr="git reset --hard HEAD^^^^^; git clean -df; git pull"

alias gco="git checkout"
alias gba="git branch -av"
alias grm="git remote"

alias glo="git log --oneline"
alias gln="git log --name-only"
alias glg="git log --pretty=format:\"%h %s\" --graph"

alias gcp="git cherry-pick"
alias grf="git reflog"
alias gr-hh="git reset --hard HEAD"
alias gr-hh1="git reset --hard HEAD^"

alias gst="git status"
alias gsl="git stash list"
alias gss="git stash save -u"
alias gsa="git stash apply"
alias gsp="git stash pop"

alias gcs="git commit -s"
alias gca="git commit --amend"

alias gg="git grep"
alias gd="git diff"