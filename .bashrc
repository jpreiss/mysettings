# Use system .bashrc skeleton for stuff like terminal colors.
source /etc/skel/.bashrc

# Clipboard simulation, similar to pbcopy/pbpaste on Mac OS.
alias copy='xclip -selection c'
alias paste='xclip -selection c -o'
alias pasten='xclip -selection c -o; echo'

# For seemingly-inevitable pulseaudio freakouts.
alias fixsound='pulseaudio -k'

# Try to mimic "open" command on Mac OS. Essentially, do what would happen if
# we double-clicked on the file in a GUI.
open () { xdg-open "$1" &> /dev/null & }

# Start an interactive Python3 with all my favorite libraries imported.
alias pynp='python3 -i -c"import numpy as np; import numpy.linalg as la; \
            import scipy as sp; import matplotlib.pyplot as plt; \
            import pandas as pd"'

# Run latexmk to continuously recompile "Overleaf style".
# Piping in /dev/null skips through LaTeX's interactive error handling.
latexmker () { latexmk -pdf -pvc $1 < /dev/null; }

# Run pdfcrop on all .pdf files in the current directory.
pdfcropall() { find . -name "*.pdf" | xargs -P 8 -I@ pdfcrop @ @; }

# Switch to Greek keyboard and back by holding both shifts.
setxkbmap -layout "us,gr" -option "grp:shifts_toggle"

export PATH=${HOME}/texlive/2020/bin/x86_64-linux:${HOME}/miniconda2/bin:$PATH

export TEXINPUTS=".:~/tex:"

export GH="https://github.com"  # fast clones

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/james/miniconda2/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/james/miniconda2/etc/profile.d/conda.sh" ]; then
        . "/home/james/miniconda2/etc/profile.d/conda.sh"
    else
        export PATH="/home/james/miniconda2/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
