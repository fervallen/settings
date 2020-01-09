
alias pull='git pull'
alias push='git push'
alias pop='git stash pop'
alias stash='git stash'
alias master='git checkout master'
alias develop='git checkout develop'
alias clear-branches='git branch | grep -v "master\|develop\|*" | xargs git branch -D'

alias vds='ssh mtk@vds'
alias dev='ssh pavel@dev'

nb () {
    git checkout master
    git pull
    git checkout -b "$1"
}

out () {
    git checkout "$1"
}

patch () {
    git add .
    git commit --amend --allow-empty --no-edit
    git push --force origin HEAD
}

send () {
    git add .
    git commit -m "$1"
    git push origin HEAD
}

rebmas () {
    git add .
    CURRENT=`git rev-parse --symbolic-full-name --abbrev-ref HEAD`
    git checkout master
    git pull
    git checkout $CURRENT
    git rebase master
}

mermas () {
    git add .
    CURRENT=`git rev-parse --symbolic-full-name --abbrev-ref HEAD`
    git checkout master
    git pull
    git checkout $CURRENT
    git merge master
}

reset () {
    git checkout master
    git pull
}
