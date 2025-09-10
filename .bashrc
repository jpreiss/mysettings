
if [ `uname` == "Linux" ]; then
    # Use system .bashrc skeleton for stuff like terminal colors.
    source /etc/skel/.bashrc

    # Clipboard simulation, similar to pbcopy/pbpaste on Mac OS.
    alias copy='xclip -selection c'
    alias paste='xclip -selection c -o'
    alias pasten='xclip -selection c -o; echo'

    # Try to mimic "open" command on Mac OS. Essentially, do what would happen
    # if we double-clicked on the file in a GUI.
    open () { xdg-open "$1" &> /dev/null & }

    # For seemingly-inevitable pulseaudio freakouts.
    alias fixsound='pulseaudio -k'

    # Switch to Greek keyboard and back by holding both shifts.
    setxkbmap -layout "us,gr" -option "grp:shifts_toggle"

    # TODO can we install texlive in a x-platform way to avoid this?
    export PATH=${HOME}/texlive/2020/bin/x86_64-linux:$PATH

elif [ `uname` == "Darwin" ]; then
    alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
    alias gvim='/Applications/MacVim.app/Contents/bin/mvim'

    # TODO should this be for both OSes?
    export HISTSIZE=5000
    export HISTFILESIZE=5000
fi


# Start an interactive Python3 with all my favorite libraries imported.
alias pynp='python3 -i -c"import numpy as np; import numpy.linalg as la; \
            import scipy as sp; import matplotlib.pyplot as plt; \
            import pandas as pd"'

# Run latexmk to continuously recompile "Overleaf style".
# Piping in /dev/null skips through LaTeX's interactive error handling.
latexmker () { latexmk -pdf -pvc $1 < /dev/null; }

# Run pdfcrop on all .pdf files in the current directory.
pdfcropall() { find . -name "*.pdf" | xargs -P 8 -I@ pdfcrop @ @; }

# Run aspell on all .tex files in the current directory.
aspelltex() { for f in *.tex; do aspell check -t \
    --add-tex-command="citep op" \
    --add-tex-command="citet op" \
    --add-tex-command="Cref p" \
    "$f"; done }

# Copy newest $1 files from ~/Downloads to $2.
mvdown() { ls -t ~/Downloads | head -$1 | xargs -I\{\} mv ~/Downloads/\{\} $2; }

# Bitcraze toolbelt.
alias tb='docker run --rm -it -e "HOST_CW_DIR=${PWD}" -e "CALLING_HOST_NAME=$(hostname)" -e "CALLING_UID"=$UID -e "CALLING_OS"=$(uname) -v ${PWD}:/tb-module -v ${HOME}/.ssh:/root/.ssh -v /var/run/docker.sock:/var/run/docker.sock bitcraze/toolbelt'

export TEXINPUTS=".:~/jplatex:"

export GH="https://github.com"  # fast clones
