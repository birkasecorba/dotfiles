# dotfiles
My configurations. Use at your own risk.

## Download
```sh
curl -#L https://github.com/birkasecorba/dotfiles/tarball/master | tar -xzv --exclude=README.md
```

## Usage
Make sure all bash files are executable
```bash
cd dotfiles
find . -type f -name '*.sh' -exec chmod +x {} \;
```

To prune and setup new symlinks
- `./setup-symlinks.sh`

To install apps/cli
- `./brew.sh`
- `./brew-cask.sh`

To set OSX defaults
- `./macos.sh`

Setup cronjob
- `cronjob cronjob`
