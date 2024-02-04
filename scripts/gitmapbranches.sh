trap 'tput cnorm; clear; exit 0' INT
clear
tput civis  # Hide cursor.
tput sc  # Save cursor position.

#Run `git map-branches`. Clear after each line to work around issues on some terminals.
git map-branches

tput ed  # Clear to end of display.
tput rc  # Restore cursor position.
