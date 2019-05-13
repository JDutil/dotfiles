alias reload!='. ~/.zshrc'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias be="bundle exec"
alias amend="git commit --amend"
alias head1="git rebase -i HEAD~1"
alias ext_specs='bundle; be rake test_app; be rspec'
alias weather='curl http://wttr.in/'

# Use `hub` as our git wrapper:
#   http://defunkt.github.com/hub/
hub_path=$(which hub)
if (( $+commands[hub] ))
  then
  alias git=$hub_path
fi

# The rest of my fun git aliases
alias gl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gp='git push origin HEAD'
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias grm="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"

function fix() {
  git rebase -i HEAD~$1
}

function branch_name() {
  branch_name="$(git symbolic-ref HEAD 2>/dev/null)"
  branch_name=${branch_name##refs/heads/}
  echo $branch_name
}

function spush() {
  git push upstream `branch_name`
}

function spull() {
  git pull --rebase upstream `branch_name`
}

# Ruby
alias rubo="git status --short | cut -d \" \" -f 3 | xargs rubocop -c .rubocop.yml -a"

# Spree
function fd() {(cd ~/Code/spreeworks/ops && bundle exec bin/fd $*)}
