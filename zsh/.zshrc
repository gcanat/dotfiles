#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load



export HISTFILE=~/.histfile
export HISTSIZE=1000000   # the number of items for the internal history list
export SAVEHIST=1000000   # maximum number of items for the history file

# The meaning of these options can be found in man page of `zshoptions`.
setopt HIST_IGNORE_ALL_DUPS  # do not put duplicated command into history list
setopt HIST_SAVE_NO_DUPS  # do not save duplicated command
setopt HIST_REDUCE_BLANKS  # remove unnecessary blanks
setopt SHARE_HISTORY
# fox.zsh-theme

PROMPT="%{$fg[cyan]%}┌──[%{$fg_bold[white]%}%n%{$reset_color%}%{$fg[cyan]%}☮%{$fg_bold[white]%}%M%{$reset_color%}%{$fg[cyan]%}]%{$fg[white]%}-%{$fg[cyan]%}(%{$fg_bold[white]%}%~%{$reset_color%}%{$fg[cyan]%})$(git_prompt_info)
└─$ % %{$reset_color%}"

ZSH_THEME_GIT_PROMPT_PREFIX="-[%{$reset_color%}%{$fg[white]%}git://%{$fg_bold[white]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}%{$fg[cyan]%}]-"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"

#export PYTHONHASHSEED=0
alias ped='ssh -p 22 pedale@163.172.212.122'
alias gullo='ssh ttkap@136.243.23.68 -p 15050'
alias tfnight='source ~/.venv/tf-nightly/bin/activate'
alias torchnight='source ~/.venv/lambda-tf/bin/activate'
alias msbgd='cd /media/gui/b17f5d3a-229e-4038-b883-2de825fdb706/home/gui/Documents/MSBGD_Cours'
#alias luamake='/home/gui/.config/nvim/lua-language-server/3rd/luamake/luamake'
#alias nvim='~/.local/bin/nvim.appimage'
export PATH="$PATH:/home/gui/.local/share/coursier/bin"
