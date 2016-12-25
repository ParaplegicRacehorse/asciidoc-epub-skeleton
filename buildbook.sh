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


if ((NOT $1) OR (NOT $2)) then
    echo "useage: buildbook.sh <epub|mobi|book> <PATH-TO-'SPINE'> \n where 'SPINE' is your master document full of metadata and includes"
    break
fi

While :
do
    case "$1" in
    mobi) asciidoc-epub3 -D output -a ebook-format=kf8 $2
    epub) asciidoc-epub3 -D output -a ebook-format=epub3 -a ebook-validate $2
    book) asciidoc-epub3 -D output -a ebook-format=kf8 $2 && asciidoc-epub3 -D output -a ebook-format=epub3 -a ebook-validate $2
    esac
#    shift
done

