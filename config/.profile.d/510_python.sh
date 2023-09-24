export PYENV_ROOT="$HOME/.pyenv"
if test -d $PYENV_ROOT; then
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/mrkn/.pyenv/versions/miniconda3-latest/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/mrkn/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh" ]; then
        . "/home/mrkn/.pyenv/versions/miniconda3-latest/etc/profile.d/conda.sh"
    else
        export PATH="/home/mrkn/.pyenv/versions/miniconda3-latest/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

type conda 2>&1 >/dev/null
if [ $? -eq 0 ]; then
  conda deactivate
fi
