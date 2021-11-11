# dotfiles
My configurations. Use at your own risk.

## Download
```sh
mkdir ~/.dotfiles && curl -#L https://github.com/birkasecorba/dotfiles/tarball/master | tar -xzv --exclude=README.md -C ~/.dotfiles --strip-components=1
```

## Usage
Make sure all bash files are executable, rename the folder to `.dotfiles` and move it under your home directory.
```bash
cd ~/.dotfiles
find . -type f -name '*.sh' -exec chmod +x {} \;
```

To prune and setup new symlinks
- `./setup-symlinks.sh`

Setup cronjob
- `crontab crontab`
