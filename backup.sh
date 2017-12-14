# Based on Paul Irish's well organized backup script
# https://github.com/paulirish/dotfiles/blob/master/setup-a-new-machine.sh

if [ -z "$1" ]; then
    BACKUP_LOCATION=${HOME}/migration
else
    BACKUP_LOCATION=$1
fi

mkdir -p ${BACKUP_LOCATION}/home/
mkdir -p ${BACKUP_LOCATION}/Library/"Application Support"/
mkdir -p ${BACKUP_LOCATION}/Library/Preferences/
mkdir -p ${BACKUP_LOCATION}/Library/Application Support/
mkdir -p ${BACKUP_LOCATION}/rootLibrary/Preferences/SystemConfiguration/

cd ${BACKUP_LOCATION}

# what is worth reinstalling?
brew leaves              > brew-list.txt    # all top-level brew installs
brew cask list           > cask-list.txt
npm list -g --depth=0    > npm-g-list.txt
yarn global ls --depth=0 > yarn-g-list.txt

# Copy tunnelblick config
# cp -Rp /Library/Application\ Support/Tunnelblick/Users/$(whoami)/*.tblk ${BACKUP_LOCATION}

# backup some dotfiles likely not under source control
cp -Rp \
    ~/.bash_history \
    ~/.gitconfig.private \
    ~/.ssh \
    ~/.z \
        ${BACKUP_LOCATION}/home

# wifi
cp -Rp /Library/Preferences/SystemConfiguration/com.apple.airport.preferences.plist ${BACKUP_LOCATION}/rootLibrary/Preferences/SystemConfiguration/

cp -Rp ~/Library/Preferences/com.googlecode.iterm2.plist ${BACKUP_LOCATION}/Library/Preferences/
cp -Rp ~/Library/Preferences/org.herf.Flux.plist ${BACKUP_LOCATION}/Library/Preferences/

# editor settings & plugins
cp -Rp ~/Library/Application\ Support/Code ${BACKUP_LOCATION}/Library/"Application Support"
