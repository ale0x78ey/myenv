#!/bin/bash
set -x

source common/install.sh
install_setup

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null && pwd)"
install_ln ${SCRIPT_DIR}/python.conf ~/.python.conf

install curl \
        python3

if [[ "`uname -s`" == "Linux" ]]; then
  # Build dependencies.
  install build-essential \
          libffi-dev      \
          libssl-dev      \
          python3-dev     \
          python3-venv
fi

if ! `python3 -m pip &>/dev/null`; then
  curl https://bootstrap.pypa.io/get-pip.py | python3 -
fi

python3 -m pip install --user -U pip

python3 -m pip install --user \
  setuptools \
  wheel

#
# Testing tools.
#

install tox

#
# Remote debugging based on pdb.
#

# https://github.com/tamentis/rpdb
python3 -m pip install --user rpdb

install rlwrap telnet
# Ex: $ rlwrap telnet localhost 4444

#
# MySQL support
#

if [[ "`uname -s`" == "Linux" ]]; then
  install libmysqlclient-dev
fi