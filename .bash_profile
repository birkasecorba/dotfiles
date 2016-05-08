# Add coreutils && findutils PATH
CORE_UTILS_PATH="$(brew --prefix coreutils)"
FIND_UTILS_PATH="$(brew --prefix findutils)"
export PATH="$FIND_UTILS_PATH/libexec/gnubin":"$CORE_UTILS_PATH/libexec/gnubin":$PATH
export MANPATH="$FIND_UTILS_PATH/libexec/gnubin":"$CORE_UTILS_PATH/libexec/gnubin":$PATH

# Set Node PATH
export PATH='$HOME/.npm-packages/bin':$PATH

# Load the shell dotfiles
for file in ~/.{aliases,functions,bash_prompt}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
# shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Sets brew cask options
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# Brew completion
if which brew > /dev/null && [ -f "/usr/local/etc/bash_completion.d/brew" ]; then
	source /usr/local/etc/bash_completion.d/brew;
fi;

# Add Git completion, Enable tab completion for `g` by marking it as an alias for `git`
if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	source /usr/local/etc/bash_completion.d/git-completion.bash;
	if type _git &> /dev/null; then
		complete -o default -o nospace -F _git g;
	fi;
fi;

# Add tab completion for `defaults read|write NSGlobalDomain`
complete -W "$(defaults domains | sed 's/,//g') NSGlobalDomain" defaults;

# Add tab completion for Applications
complete -W "$(ls /Applications/ | sed 's/.app//g' | sed 's/ /\\ /g')" killall;
