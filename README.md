# doxyfind
- Finds root of git repo containing current working directory
- Looks for Doxyfiles in the repo
- Picks the shortest path to a Doxyfile
- Runs doxygen in the corresponding directory

## Installation
Clone somewhere such as `/usr/bin`:
```
cd <installation directory>
git clone https://github.com/t-bre/doxyfind
```
Add the following to your bash / zsh configuration, replacing `<installation directory>` with the directory you cloned the repo into:
```
export PATH="<installation directory>/doxyfind:$PATH"
alias doxyfind="doxyfind.sh"
```
Restart terminal. Alternatively for bash run `source ~/.bashrc` or for zsh run `source ~/.zshrc`

## Usage
Anywhere inside a git repo:
```bash
doxyfind
```
Tested on macOS Big Sur with zsh.
