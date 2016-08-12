#!/bin/sh

if test $# -lt 3; then
  echo "Usage: <program> <input> <output>"
  exit 1
fi

program=$1
input=$2
output=$3

if ! ($program < $input | diff -u $output /dev/stdin); then
    echo 'Failed; check diff.'
fi
