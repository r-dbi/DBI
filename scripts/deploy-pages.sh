#!/bin/bash

set -e

doc_dir=inst/web

# adapted from https://github.com/tjmahr/rprime/blob/1e756aea85677ebcbe785e4d3bd65e3b367e0660/deploy-pages.sh
# and https://github.com/RyanHope/gazetools/blob/master/staticdocs-gh_pages.sh
# and https://gist.github.com/domenic/ec8b0fc8ab45f39403dd
#
# For local testing use:
# TRAVIS_OS_NAME=linux TRAVIS_PULL_REQUEST=false TRAVIS_BRANCH=master TRAVIS_REPO_SLUG=rstats-db/DBI TRAVIS_COMMIT=$(git rev-parse HEAD) GITHUB_PAT=<your-PAT> scripts/deploy-pages.sh

echo "Job number: ${TRAVIS_JOB_NUMBER}"

if [ "$TRAVIS_OS_NAME" == "linux" ] && [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_BRANCH" == "f-#131-staticdocs" ] && [ "$GITHUB_PAT" != "" ]; then
  rm -rf $doc_dir
  mkdir -p $doc_dir

  # We'll pretend to be a new user. Clone the current docs.
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "travis-ci"
  git clone --quiet --branch=gh-pages https://${GITHUB_PAT}@github.com/${TRAVIS_REPO_SLUG} $doc_dir > /dev/null

  echo -e "Building staticdocs without DBIspec.Rd...\n"
  rm -f man/DBIspec.Rd
  rm -r $doc_dir/*
  R -q -e "staticdocs::build_site()"

  echo -e "Publishing staticdocs...\n"
  cd $doc_dir

  # Include .nojekyll as a directive for github
  touch .nojekyll

  # Commit and publish
  git add -A

  git commit --allow-empty -F /dev/stdin <<EOF
Deploy pages from Travis build ${TRAVIS_BUILD_NUMBER}

Build URL: https://travis-ci.org/${TRAVIS_REPO_SLUG}/${TRAVIS_BUILD_ID}
Commit: ${TRAVIS_COMMIT}
EOF

  git push --quiet origin gh-pages

  echo -e "Published staticdocs to gh-pages.\n"
fi
