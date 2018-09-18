alias pull='git pull'
alias push='git push'
alias pop='git stash pop'
alias stash='git stash'
alias master='git checkout master'
alias clear-branches='git branch | grep -v "master\|*" | xargs git branch -D'

alias prod='ssh fervallen@prod'
alias stage='ssh fervallen@stage'
alias static='ssh fervallen@static'
alias vds='ssh mtk@vds'

nb () {
    git checkout master
    git pull
    git checkout -b "HC-$1"
}

out () {
    git checkout "HC-$1"
}

gout () {
    git checkout "HC-$1"
    gulp build
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

greset () {
    reset
    gulp build
}

