#!/usr/bin/env bash

git update-index -q --refresh
if ! git diff-index --quiet HEAD --; then
  echo "Working directory not clean, please commit your changes first"
  exit
fi

cd apollo_package
npm version --no-git-tag-version patch > version.txt
version=$(cat version.txt)
echo "New version is $version"
cd ..

rm ./apollo_package/version.txt
git add .
git commit -m "[RELEASE] $version"
