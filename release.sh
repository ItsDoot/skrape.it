#!/bin/bash

possibleReleaseTypes="major feature bug alpha beta rc"

if [[ ! ${possibleReleaseTypes[*]} =~ $1 ]]; then
    echo "valid argument: [ ${possibleReleaseTypes[*]} ]"
    exit 1
else
  git commit --allow-empty -m "trigger new '$1' release"
  git tag "$1"
  git push --tags
  git push
fi
