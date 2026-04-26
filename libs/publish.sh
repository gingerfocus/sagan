#!/bin/sh

for f in $(ls -d */); do
    dir="$HOME/.local/share/typst/packages/local/${f}0.1.0/" 
    mkdir "$dir" -p
    cp -r "${f}." "$dir"
done
