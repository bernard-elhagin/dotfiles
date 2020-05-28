#!/bin/sh
case "$1" in
    *.png|*.jpg|*.jpeg|*.mkv|*.mp4|*.avi) mediainfo "$1";;
    *.md) glow -s dark "$1";;
    *.pdf) pdf2txt -s dark "$1";;
    *.zip) zipinfo "$1";;
    *.tar.gz) tar -ztvf "$1";;
    *.tar.bz2) tar -jtvf "$1";;
    *.tar) tar -tvf "$1";;
    *.rar) unrar l "$1";;
    *.7z) 7z l "$1";;
    *.xml|*.wsdl|*.xslt|*.xsl|*.dbs) highlight "$1" -O ansi --force --syntax=xml;;
    *.zsh*|*.bash*|*.git*) pistol "$1";;
    *) highlight "$1" -O ansi --force;;
esac
