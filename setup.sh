#!/bin/sh
# Determine OS platform
UNAME=$(uname | tr "[:upper:]" "[:lower:]") # "darwin" | "linux"

# If Linux, try to determine specific distribution
if [ "$UNAME" == "linux" ]; then
    # If available, use LSB to identify distribution
    if [ -f /etc/lsb-release -o -d /etc/lsb-release.d ]; then
        DISTRO=$(lsb_release -i | cut -d: -f2 | sed s/'^\t'// | tr "[:upper:]" "[:lower:]")
    # Otherwise, use release info file
    else
        DISTRO=$(ls -d /etc/[A-Za-z]*[_-][rv]e[lr]* | grep -v "lsb" | cut -d'/' -f3 | cut -d'-' -f1 | cut -d'_' -f1 | tr "[:upper:]" "[:lower:]")
    fi
fi
# For everything else (or if above failed), just use generic identifier
[ "$DISTRO" == "" ] && DISTRO=$UNAME

if ! command -v zsh &> /dev/null
then
    if [ "$UNAME" == "linux" ]; then
        apt install zsh
    elif [ "$UNAME" == "darwin" ]; then
        brew install zsh
    fi
    chsh -s $(which zsh)
fi
curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
# git clone https://github.com/zsh-users/zsh-autosuggestions ${HOME}/.oh-my-zsh/custom/plugins/zsh-autosuggestions

~/.dotfiles/setup-symlinks.sh
unset UNAME
unset DISTRO