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
Add this to your bash profile, replacing `<installation directory>` with the directory you cloned the repo into:
```
export PATH="<installation directory>/doxyfind:$PATH"
alias doxyfind="doxyfind.sh"
```

## Usage
Anywhere inside a git repo:
```bash
doxyfind
```
