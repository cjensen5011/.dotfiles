# path to oh my zsh install
export ZSH="$HOME/.oh-my-zsh"

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

# zsh cominit
autoload -Uz compinit && compinit

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"                                       # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

# alias
alias zshconfig="nvim ~/.zshrc"
alias sshconfig="nvim ~/.ssh/config"
alias sauce="source ~/.zshrc"
alias vim="nvim"

alias lg="lazygit"
alias tmls="tmux ls"
alias tma="tmux a -t"
alias tmn="tmux new -t"
alias tmx="tmux kill-session -t"
alias tmk="tmux kill-session"

alias tml5r="~/tmux-l5r.sh"
alias tmcw="~/tmux-cw.sh"
alias tmwt="~/tmux-wtrtrk.sh"

# eza (better ls)
alias ls="eza -la --icons=always"

# rbenv
eval "$(rbenv init - zsh)"

# the fuck
eval $(thefuck --alias)

# starship
eval "$(starship init zsh)"

# zoxide (better cd)
eval "$(zoxide init zsh)"
alias cd="z"

# fzf
eval "$(fzf --zsh)"

source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
