export PATH=${ASDF_DATA_DIR:-$HOME/.asdf}/shims:${HOME}/.krew/bin:/opt/homebrew/bin:/opt/homebrew/opt/libpq/bin:/opt/homebrew/opt/mysql-client/bin:$PATH

alias aa='aws sts get-caller-identity || aws sso login'
alias ww='windsor context set'
alias cilium='cilium -n system-cilium'


# SSH into boxes
alias nuc='ssh 192.168.1.53'
alias pi='ssh 192.168.1.140'
alias hc='ssh 192.168.1.44'
alias ci='ssh copia-imager@10.41.1.17'

# Pinentry
alias pinentry='pinentry-mac'

#Aliases for Kubectl & Helm
alias d='kubectl -n kube-system get secret admin-user -o jsonpath="{.data.token}" | base64 -d'
alias h='helm'
alias k='kubectl'
alias ke='kubectl exec -it'
alias kl='kubectl -n longhorn-system'
alias ko='kubectl -n operations'
alias ks='kubectl -n kube-system'
alias kd='kubectl -n datadog'
alias kv='kubectl -n vector'
alias kk='kubectl -n kubevirt'
alias kw='kubectl -n web-server'
alias kc='kubectl -n system-cilium'
alias kt='kubectl -n traefik'
alias km='kubectl -n monitoring'
alias ksg='kubectl -n system-gitops'

#Alias for flux
alias fa='flux get all'
alias fk='flux get kustomizations'

#some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lk='ls -lhaG'

#git command autocompletion script

#Git aliases
alias gst='git status'
alias gco='git checkout'
alias gci='git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gad='git add -A'
alias gpl='git pull'
alias gpu='git push'
alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%H%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias gtg='git commit --allow-empty -m "chore: empty commit to trigger CI/CD"'

#MySQL aliases
alias mstart='brew services start mysql@5.7'
alias mrestart='brew services restart mysql@5.7'
alias mstop='brew services stop mysql@5.7'
alias m='mysql -u root'
alias mq='mysql -u root skillshare -Be'

#simple ip
alias ip0='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'

#more details
alias ip1="ifconfig -a | perl -nle'/(\d+.\d+.\d+.\d+)/ && print $1'"

#external ip
alias ip2="curl -s https://www.showmyip.com/simple/ | awk '{print $1}'"

#grep with color
alias grep='grep --color=auto'

#refresh shell
alias reload='source ~/.zshrc'

# GIT Prompt
source "$(brew --prefix)/opt/zsh-git-prompt/zshrc.sh"
# prompt config
#PROMPT='%B%m %~%b$(git_super_status) %# '
PROMPT='%B%~%b$(git_super_status) %# '

#c for clear
alias c='clear'

#up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# History configuration
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000000
SAVEHIST=10000000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.
alias history='history 1'

# GPG shit
export GPG_TTY=$(tty)

# Windsor stuff after this line
eval "$(windsor hook zsh)"

# Function to get the Windsor context with color
get_windsor_context() {
  local context
  context=$(windsor get-context 2>/dev/null)
  # Add color and formatting
  echo "%{$fg[cyan]%}[$context]%{$reset_color%}"
}

# Function to get the Kubernetes context with color
get_namespace() {
  local ns
  ns="$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)"
  # Add color and formatting
  echo "%{$fg[cyan]%}[$ns]%{$reset_color%}"
}

# prompt config
PROMPT='$(get_windsor_context) $(get_namespace) %B%~%b$(git_super_status) %# '

