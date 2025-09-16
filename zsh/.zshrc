# path to oh my zsh install
export ZSH="$HOME/.oh-my-zsh"

# neovim
export EDITOR=nvim

# plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=50000

# tmux-sessionizer
export PATH="$HOME/.dotfiles/scripts:$PATH"
bindkey -s ^f "tmux-sessionizer\n"

# fzf
eval "$(fzf --zsh)"

# zsh cominit
autoload -Uz compinit && compinit

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home

# android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# rbenv
eval "$(rbenv init - zsh)"

# alias
alias zshconfig="nvim ~/.zshrc"
alias sshconfig="nvim ~/.ssh/config"
alias sauce="source ~/.zshrc"
alias vim="nvim"

# git
alias lg="lazygit"
alias gitconfig="nvim ~/.gitconfig" # edit global git config

# tmux
alias tmls="tmux ls" # list tmux sessions
alias tma="tmux a -t" # attach to named tmux session
alias tmn="tmux new -t" # new tmux session
alias tmx="tmux kill-session -t" # kill named tmux session
alias tmk="tmux kill-session" # kill all tmux sessions

# alias tml5r="~/tmux-l5r.sh"
# alias tmcw="~/tmux-cw.sh"
# alias tmwt="~/tmux-wtrtrk.sh"

# eza (better ls)
alias ls="eza -la --icons=always"

# the fuck
eval $(thefuck --alias)

# starship
eval "$(starship init zsh)"

# zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"

