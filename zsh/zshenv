#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi

export GIT_EDITOR=hx
export EDITOR=hx
. "$HOME/.cargo/env"
export HELIX_RUNTIME=/root/helix/runtime
alias wimg='wezterm imgcat'
export NNN_PLUG='f:finder;o:fzopen;d:diffs;v:preview-tui'
export NNN_FIFO=/tmp/nnn.fifo
# export NNN_PREVIEWIMGPROG=imgcat
alias nnn='nnn -d -e -H -r'
