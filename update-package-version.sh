#!/usr/bin/env bash

git update-index -q --refresh
if ! git diff-index --quiet HEAD --; then
  echo "Working directory not clean, please commit your changes first"
  exit
fi

cd apollo_package
npm --no-git-tag-version version > ../version.txt
cd ..

git add .
git commit -m "$(< version.txt)"
git push

rm version.txt