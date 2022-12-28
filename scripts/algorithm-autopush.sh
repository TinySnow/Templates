#!/usr/bin/env bash

set -Eeuo pipefail

git add .

if [ "$1" == "y" ]; then
  git commit -m "Leetcode question $2 finished"
elif [ "$2" == "n" ]; then
  git commit -m "Leetcode question $2 UNfinished"
fi

git push origin main

echo "Done."