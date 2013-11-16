#!/bin/bash

case `basename $0` in
  git-hooks.sh)
    cd `dirname $0`
    for GIT_HOOK in pre-commit post-merge
    do
      if [ ! -e .git/hooks/$GIT_HOOK ]; then
        ln -s ../../git-hooks.sh .git/hooks/$GIT_HOOK
      fi
    done
    echo "Git hooks configured. Now you will be guarded by testrun run every git pull or commit."
    exit 0
    ;;
esac

case $NO_TEST in
  "")
    ;;
  *)
    echo
    echo "Skipping tests as NO_TEST is set. To not skip tests please do: unset NO_TEST"
    echo
    sleep 1
    exit 0
    ;;
esac

source ~/.bash_profile || exit $?
if [ -d ~/.rvm ]; then
  rvm reload || exit $?
fi
RUBY=`which ruby`
RUBY_DIR=`dirname $RUBY`
GEM_DIR=`rvm gemdir`
export PATH="$GEM_DIR/bin:$RUBY_DIR:$PATH"

bundle exec rspec || exit $?
