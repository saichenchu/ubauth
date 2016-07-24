#!/usr/bin/env bash

if [[ "$TRAVIS_OS_NAME" == "linux" ]]; then
  export DISPLAY=":99.0"
  export LD_LIBRARY_PATH=/usr/lib/x86_64-linux-gnu/
  sh -e /etc/init.d/xvfb start +extension RANDR
fi

NODE_EXEC_PATH=$(which node)

export NODE_PATH=$NODE_EXEC_PATH

./node_modules/.bin/electron-mocha build --ui bdd --timeout 80000 --reporter spec --inline-diffs --bail build