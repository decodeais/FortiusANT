#!/bin/bash

if [ -f "FortAntEnv/bin/activate" ]; then
    # Aktiviere die virtuelle Umgebung
    source "$HOME/FortiusANT/raspberry/FortAntEnv/bin/activate"

    # Passe die PS1-Variable an, um (base) durch FortAntEnv zu ersetzen
    echo "export PS1='(FortAntEnv) \[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'" >  bashrc_virtualenv

    # Starte eine neue BashShell mit der temporären Konfigurationsdatei
    bash --rcfile bashrc_virtualenv
#
    # Entferne die temporäre Konfigurationsdatei
    rm -f bashrc_virtualenv
else
    echo -e "\033[0;31m No virtual environment \033[0m"  
fi

