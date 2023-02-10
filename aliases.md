* Edit bashrc and immediately apply change
	```bash
	alias bashrc='$EDITOR $HOME/.bashrc && source $HOME/.bashrc'
	```
* Run parallel make
	```bash
	alias jmake='make -j $(nproc) -O'
	```
* Get first line
	```bash
	alias cap='head -n 1'
	```
* Run MATLAB in the terminal
	```bash
	alias tmat='matlab -nodesktop -nosplash'
	```
* Push a git branch to origin for the first time
	```bash
	alias gnew='git push -u origin "$(git branch --show-current)"'
	```
* Git diff staged files
	```bash
	alias gdiffc='git diff --cached HEAD'
	```
* Add or multiply numbers from stdin
	```bash
	alias dca="dc -e '0d[?+2z>a]dsaxp'"
	alias dcm="dc -e '1d[?*2z>a]dsaxp'"
	```
* Xclip operations with clipboard
	```bash
	alias xc='xclip -selection clipboard'
	alias xco='xclip -selection clipboard -o'
	alias cxc='xc < /dev/null' # clear clipboard
	```
* Bytes to iec (base 1024) or si (base 1000) format
	```bash
	alias iec='numfmt --to iec'
	alias si='numfmt --to si'
	```
* Generate a random string 38 bytes long
	```bash
	alias randpass="tr -cd '[ -~]' < /dev/random | head -c 38"
	```
* Remove identifying information from prompt and window
	```bash
	alias anon="PS1='[user@Machine \W]\$ ' && xdotool getactivewindow set_window --name 'Terminal'"
	```
