#!/bin/bash
#
# Requires ruby
# Requires asciidoctor-epub3 (and asciidoctor) rubygems
# Wants epubcheck and kindlegen. These can be installed with ruby
#
# You may need rake to get kindlegen installed via gem
#
# apt install ruby ruby-dev
# yum install ruby ruby-dev
# gem install asciidoctor epubcheck rake
# gem install asciidoctor-epub3 kindlegen --pre
#
####

####
#
# useage: buildbook.sh <epub|mobi> <PATH-TO-'SPINE'>
#   where 'SPINE' is your master document full of metadata and includes
#
####

####
#
# I am not a scripter. Patches to include logic for checking
# required and optional depends are appreciated.
#
####


if [ -z "$1" ]; then
    printf "useage: buildbook.sh <epub|mobi|book> <PATH-TO-'SPINE'> \n where 'SPINE' is your master document full of metadata and includes"
    exit
fi

if [ -z "$2" ]; then
    printf "useage: buildbook.sh <epub|mobi|book> <PATH-TO-'SPINE'> \n where 'SPINE' is your master document full of metadata and includes"
    exit
fi

while :
do
    case "$1" in
        mobi)
            asciidoctor-epub3 -D output -a ebook-format=kf8 "$2"
            ;;
        epub)
            asciidoctor-epub3 -D output -a ebook-format=epub3 -a ebook-validate "$2"
            ;;
        book)
            asciidoctor-epub3 -D output -a ebook-format=kf8 "$2" && asciidoc-epub3 -D output -a ebook-format=epub3 -a ebook-validate "$2"
            ;;
    esac
done

