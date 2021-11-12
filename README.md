# dotfiles
My configurations. Use at your own risk.

## Download & Setup
```sh
mkdir ~/.dotfiles && \
curl -#L https://github.com/birkasecorba/dotfiles/tarball/master | tar -xzv --exclude=README.md -C ~/.dotfiles --strip-components=1 && \
find ~/.dotfiles -type f -name '*.sh' -exec chmod +x {} \; && \
~/.dotfiles/setup-zsh.sh
```

```sh
$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
```

```sh
~/.dotfiles/setup.sh
```



## Usage
Setup cronjob
- `crontab crontab`
