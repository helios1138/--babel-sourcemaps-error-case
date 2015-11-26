#!/usr/bin/env bash

rm -rf pre-build/
rm -rf build/

errors=$(./node_modules/typescript/bin/tsc)

if [[ $? != 0 ]]; then
    echo "$errors"
else
    ./node_modules/typescript/bin/tsc
    ./node_modules/babel-cli/bin/babel.js pre-build/ --out-dir build/ --source-maps inline
fi
