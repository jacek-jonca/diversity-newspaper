#!/bin/bash
# https://stackoverflow.com/questions/42253765/getting-travisci-to-commit-and-push-a-modified-file-with-tags-releases/42299765#42299765
YEAR=$(date +"%Y")
MONTH=$(date +"%m")
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git config --global push.default simple
export GIT_TAG=V2.$YEAR-$MONTH.$TRAVIS_BUILD_NUMBER
msg="Tag Generated from TravisCI for build $TRAVIS_BUILD_NUMBER"
echo "$msg" >> $TRAVIS_BUILD_DIR/build.txt
git add $TRAVIS_BUILD_DIR/build.txt
git commit -m "Update build version file with $TRAVIS_BUILD_NUMBER"
