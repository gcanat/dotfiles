#!/usr/bin/env bash

function tmux_or_die() {
  if [ -z "$TMUX" ]; then
    echo >/dev/stderr Please run me in tmux...;
    exit 1;
  fi
}

function spawn_pane() {
  # TIMESTAMP=$(date +%s)
  # tmux_or_die
  # tmux split-window -d jupyter console --kernel="$1" -f="/tmp/hepl-$PPID.json" --ZMQTerminalInteractiveShell.include_other_output=True --ZMQTerminalInteractiveShell.other_output_prefix=''
  # wezterm cli split-pane --right --percent 40 -- jupyter console --kernel="$1" -f="/tmp/hepl.json" --ZMQTerminalInteractiveShell.include_other_output=True --ZMQTerminalInteractiveShell.other_output_prefix=''
  wezterm cli split-pane --right --percent 40 -- $1
}

function send() {
  # python3 -c 'import sys, textwrap; sys.stdout.write(textwrap.dedent(sys.stdin.read()))' | jupyter run --existing="/tmp/hepl.json"
  PANEID=$(wezterm cli get-pane-direction Right)
  wezterm cli send-text --pane-id $PANEID
  echo -e "\n" | wezterm cli send-text --pane-id $PANEID --no-paste
}
function send_enter() {
  # python3 -c 'import sys, textwrap; sys.stdout.write(textwrap.dedent(sys.stdin.read()))' | jupyter run --existing="/tmp/hepl.json"
  PANEID=$(wezterm cli get-pane-direction Right)
  echo -e "\n" | wezterm cli send-text --pane-id $PANEID --no-paste
}

case "$1" in
  spawn) spawn_pane "$2" >/dev/null ;;
  send) send >/dev/null 2>&1 ;;
  sendenter) send_enter ;;
  *) exit 1 ;;
esac
