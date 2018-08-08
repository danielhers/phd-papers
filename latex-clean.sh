#!/bin/bash

arg=${1:-.}
exts="aux bbl blg brf idx ilg ind lof log lol lot out toc syntex.gz"

if [ -d $arg ]; then
  for ext in $exts; do
    set -x
    rm -f $arg/*.$ext
    set +x
  done
else
  for ext in $exts; do
    set -x
    rm -f $arg.$ext
    set +x
  done
fi

