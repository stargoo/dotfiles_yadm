# If you come from bash you might have to change your $PATH.
export PATH=$HOME/.local/bin:/usr/local/bin:$PATH:$HOME/go/bin
export PATH=$PATH:/home/scott/.cargo/bin
# XDG Setup
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

#enable vi mode
bindkey -v
# Setup History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt extended_glob

# for bookmarks if used
setopt auto_cd

MACHINE="$(uname -s)"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  if [[ $MACHINE == "Darwin" ]]; then
    export EDITOR='/opt/homebrew/bin/nvim'
  else
    export EDITOR='/usr/bin/nvim'
  fi
else
  if [[ $MACHINE == "Darwin" ]]; then
    export EDITOR='/opt/homebrew/bin/nvim'
  else
    export EDITOR='/usr/bin/nvim'
  fi
fi

# Use completions on dotfiles
_comp_options+=(globdots)

source $HOME/.config/zsh/fpathAdditions.zsh
source $HOME/.config/zsh/alias.zsh
source $HOME/.config/zsh/exports.zsh
source $HOME/.config/zsh/functions.zsh
source $HOME/.config/zsh/plugins.zsh
#

# include some app support
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(starship init zsh)"
eval "$(pyenv init -)"
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi
