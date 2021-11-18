# dotfiles
My configurations. Use at your own risk.

## Download & Setup

### Download
```sh
mkdir ~/.dotfiles && \
curl -#L https://github.com/birkasecorba/dotfiles/tarball/master | tar -xzv --exclude=README.md -C ~/.dotfiles --strip-components=1 && \
```

### Give Execute Permissions to Scripts
```sh
find ~/.dotfiles -type f -name '*.sh' -exec chmod +x {} \;
```

### Get ZSH
```sh
~/.dotfiles/setup-zsh.sh
```

### Get oh-my-zsh
```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

```sh
~/.dotfiles/install.sh
```


## Optionals
```sh
~/nginx.sh
```

## Usage
Setup cronjob
- `crontab crontab`
