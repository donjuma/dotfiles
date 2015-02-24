#!/usr/bin/env bash
VERSION_FILE=~/.dotversion
INTERNAL_VERSION_FILE=~/.dotfiles/version
PKG_PATH=~/.dotfiles/pkgs

get_installed_version() {
    local line
    read line < $VERSION_FILE
    echo $line
}

get_pkg_version() {
    local line
    read line < $INTERNAL_VERSION_FILE
    echo $line
}

do_install() {

    for pkg in `ls $PKG_PATH`; do
        for file in `ls $PKG_PATH/$pkg`; do
            ln -is $PKG_PATH/$pkg/$file ~/.$file
        done
    done

    cp $INTERNAL_VERSION_FILE $VERSION_FILE
}

if [ -f "$VERSION_FILE" ] && [ `get_pkg_version` -eq `get_installed_version`]; then
    echo "Dotfiles are already at the newest version!"
    exit 1
else
    echo "Installing Dotfiles"
    do_install
fi
