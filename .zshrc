# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="/Users/danacristinii/.oh-my-zsh"

# theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

source $ZSH/oh-my-zsh.sh

# plugins:
plugins=(git git-flow brew history node npm kubectl)

# completions:
if [ /usr/local/bin/kubectl ]; then source <(kubectl completion zsh); fi

# exports
export GOPATH="${HOME}/Dev/go/"
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="$PATH:${HOME}/Dev/flutter/bin"
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python@3.10/bin:$PATH"

# aliases
alias k="kubectl"
alias p10k-update="git -C ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k pull"
alias dot-update="curl -L https://github.com/danacr/dotfiles/raw/master/.zshrc --output $HOME/.zshrc && exec zsh"

go_test() { go test $* | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[34mSKIP\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | GREP_COLOR="01;33" egrep --color=always '\s*[a-zA-Z0-9\-_.]+[:][0-9]+[:]|^'
}
