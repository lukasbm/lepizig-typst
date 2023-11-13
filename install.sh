#!/bin/bash

# TODO: check if cwd at root of repository

target=$argv[1]
mkdir -p $target
cp fau-typst.typ $target
mkdir -p $target/theme
cp theme/* $target/themes
mkdir -p $target/lib
cp lib/* $target/lib
echo "Done"
