#!/bin/bash

# adapted from https://github.com/RyanHope/gazetools/blob/master/staticdocs-gh_pages.sh 
# and https://gist.github.com/domenic/ec8b0fc8ab45f39403dd

if [ "$TRAVIS_REPO_SLUG" == "${GH_REF}" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "master" ]; then

  echo -e "Publishing staticdocs...\n"
  
  # Extract the generated static docs
  cp -r inst/web ${HOME}
  cd $HOME
  
  # We'll pretend to be a new user. Clone the current docs.
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "travis-ci"
  git clone --quiet --branch=gh-pages https://${GH_TOKEN}@github.com/${GH_REF} gh-pages > /dev/null
  
  # Overwrite the current docs with the newly generated ones
  cd gh-pages
  git rm -rf *
  cp -Rf $HOME/web/* .
  
  # Include .nojekyll as a directive for github
  touch .nojekyll
  
  # Commit and publish
  git add -A
  git commit -m "Travis build $TRAVIS_BUILD_NUMBER succeeded. Auto-pushed staticdocs to gh-pages"
  git push --force --quiet origin gh-pages
  
  echo -e "Published staticdocs to gh-pages.\n"

fi