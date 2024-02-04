#! /bin/bash
# Unhide cursor and clear screen on Ctrl-C.
clear

# Run `hg st` and `hg whatsout`. Clear after each line to work around issues
# on some terminals.
while :; do
  tput sc # Save cursor position

  # Run `git status` and `git diff origin/main --name-only`.
  # Clear after each line.
  echo -n $'\e[4mGit Status:\e[0m'
  tput el # Clear to end of line
  echo ''
  git status

  tput el # Clear to end of line
  echo -n $'\e[4mChanged in this CL:\e[0m'
  tput el # Clear to end of line
  echo ''
  git diff origin/main --name-only

  tput ed # Clear to end of display
  tput rc # Restore cursor position
  sleep 1;
done
