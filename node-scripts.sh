. utils.sh

# Download nvm
# This adds the following code to .bashrc
# remove it from there and add it to .bash_profile manually
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash

ask 'Move auto-generated lines out of .bashrc to .bash_profile before continuing'
reload

# install the latest longtermsupport version of node
nvm install --lts

brew install yarn --without-node

# Node required CLIs
npm install webpack -g
npm install svgo -g
npm install imageoptim-cli -g
npm install eslint -g
npm install -g eslint-config-airbnb
npm install -g eslint-plugin-jsx-a11y
