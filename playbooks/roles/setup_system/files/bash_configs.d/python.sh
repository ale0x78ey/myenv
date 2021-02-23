# Don't use .pyc и .pyo.
export PYTHONDONTWRITEBYTECODE=1

# Pyenv options
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if [[ "$(which pyenv)" ]]; then
  eval "$(pyenv init -)"
fi