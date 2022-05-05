#!/usr/bin/env bash

git update-index -q --refresh
if ! git diff-index --quiet HEAD --; then
  echo "Working directory not clean, please commit your changes first"
  exit
fi

cd apollo_package
npm version --no-git-tag-version patch > ../version.txt
cd ..

git add .
git commit -m "[RELEASE] $(< version.txt)"
git push

rm version.txt