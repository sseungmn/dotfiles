export ZSH="/Users/sseungmn/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=($plugins git zsh-syntax-highlighting zsh-autosuggestions fasd pyenv virtualenv)

# --------------------alias------------------------
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias fzfconfig="vim ~/.fzf.zsh"

alias vim="nvim"
alias vi="nvim"
alias vimdiff="nvim -d"
export EDITOR=/usr/local/bin/nvim

alias ntmux="tmux new -s session -n window"

alias ws1="~/Documents/workspace/ws1"
alias ws2="~/Documents/workspace/ws2"

# git repository for dotfiles
alias config='/usr/bin/git --git-dir=/Users/sseungmn/.cfg/ --work-tree=/Users/sseungmn'

alias glog='git log --graph --decorate --oneline'
#--------------------------------------------------

# pyenv, virtualenv 설정
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# powerlevel10k

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden'


