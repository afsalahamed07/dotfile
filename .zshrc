# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -f "/opt/homebrew/bin/brew" ]] then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# zinit light jeffreytse/zsh-vi-mode
# # Append a command directly
# zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions, using the cached dump when it is fresh.
autoload -Uz compinit
if [[ ! -f "${ZDOTDIR:-$HOME}/.zcompdump" || "${ZDOTDIR:-$HOME}/.zcompdump" -ot "$HOME/.zshrc" ]]; then
  compinit
else
  compinit -C
fi

zinit cdreplay -q


# Keybindings
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

bindkey '^R' history-incremental-search-backward
bindkey '^A' beginning-of-line    # Move to the beginning of the line
bindkey '^E' end-of-line          # Move to the end of the line
bindkey '^K' kill-line            # Delete from the cursor to the end of the line
bindkey '^U' backward-kill-line   # Delete from the cursor to the beginning of the line

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory 
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias python='python3'
# alias cheat='curl cheat.sh'
alias diary='nvim ~/Documents/diary.md'

# Shell integrations
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# eval "$(zoxide init --cmd cd zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export DATABASE_PASSWORD="Afsal321123," # postgress passowrod for role afsalahamed
. "/Users/afsalahamed/.deno/env"


export NVM_DIR="$HOME/.nvm"
load-nvm() {
  unset -f nvm node npm npx corepack load-nvm
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
}
nvm() { load-nvm; nvm "$@"; }
node() { load-nvm; node "$@"; }
npm() { load-nvm; npm "$@"; }
npx() { load-nvm; npx "$@"; }
corepack() { load-nvm; corepack "$@"; }

# bun completions
[ -s "/Users/afsalahamed/.bun/_bun" ] && source "/Users/afsalahamed/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/opt/homebrew/bin:/usr/local/go/bin:$PATH"
# optional but nice:
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"

export LIBRARY_PATH="/opt/homebrew/opt/libgccjit/lib/gcc/current:/opt/homebrew/opt/gcc/lib/gcc/current:$LIBRARY_PATH"
export C_INCLUDE_PATH="/opt/homebrew/opt/libgccjit/include:$C_INCLUDE_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libgccjit/lib/pkgconfig:/opt/homebrew/opt/gcc/lib/pkgconfig:$PKG_CONFIG_PATH"


eval "$(zoxide init zsh)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# opencode
export PATH=/Users/afsalahamed/.opencode/bin:$PATH
