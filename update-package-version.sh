#!/usr/bin/env bash

git update-index -q --refresh
if ! git diff-index --quiet HEAD --; then
  echo "Working directory not clean, please commit your changes first"
  exit
fi

cd apollo_package
version = npm version --no-git-tag-version patch
cd ..

echo "New version is $version"

git add .
git commit -m "[RELEASE] $version"
