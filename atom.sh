#!/usr/bin/env bash

if !(which apm) &> /dev/null; then
  ln -s /Applications/Atom.app/Contents/Resources/app/apm/node_modules/.bin/apm /usr/local/bin/apm
fi

apm install atom-material-ui
apm install auto-detect-indentation
apm install autocomplete-python
apm install hyperclick
apm install language-babel
apm install linter
apm install linter-eslint
apm install monokai
apm install remote-sync
