# My Approach to Using Vim
This project is considered a library or plugin
that can be installed with all features if
needed. It provides predefined keyboard mappings and quickly
introduces you to using Vim so you can
develop everything.

> [!WARNING]
> Do not use this repository at this time, as it is under construction.

# Inhaltsangabe
- [./src/Map.vim](./src/Map.vim)
- [./src/Statusline.vim](./src/Statusline.vim)
- [./src/Autocommands.vim](./src/Autocommands.vim)
- [./src/TextActions.vim](./src/TextActions.vim)
- [./src/Functions.vim](./src/Functions.vim)
- [./src/Commands.vim](./src/Commands.vim)
- [./src/Keymaps.vim](./src/Keymaps.vim)
- [./install.sh](./install.sh)

# Install
> [!WARNING]
> The project is in an unstable state. Do not use it, as it may contain errors.

You Can Choose Installing vim-advantages Using 1. or 2.
## 1. Install This Project
Executing This Shellscript, Anywhere In Your Terminal. It will automatically install Plug.vim in your vim installation and automatically execute step #2
### Unix
```
sh | wget github.com/vi0lin/vim-advantages/blob/main/install.sh && rm ./install.sh
```
### Windows
#### bash
```
curl -o install.sh https://raw.githubusercontent.com/vi0lin/vim-advantages/refs/heads/main/install.sh
"C:\Program Files\Git\bin\bash.exe" .\install.sh
```
#### wsl
```
curl -o install.sh https://github.com/vi0lin/vim-advantages/refs/heads/main/install.sh
wsl --install
wsl bash install.sh
del install.sh
```

## 2. Manually Installing vim-advantages
This Needs To Be Integrated In Some Vim Source File Of Your Local Vim Installation
```
call plug#begin()
  Plug 'vi0lin/vim-advantages'
call plug#end()

:PlugInstall
```

# Remove Accidentally Published Git Content

> [!TIP]
> Did you know hhow to delete traces of accidentially published content in the git history? 

> [!WARNING]
> Please use the following codes with extreme caution. It is not recommended to do this for shared projects, as the entire git tree will be changed.

### Example
```
# remove ./src/Functions.vim from history
git filter-repo --path ./src/Functions.vim --invert-paths
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git remote -v
git remote add origin https://github.com/vi0lin/app-development
github push origin --force --all

# rebase or re-clone
git fetch origin
git reset --hard origin/main
```

### Prototype Function
> [!WARNING]
> The snippet is under construction and will be commented, very soon.
```
git_remove() {
  paths=""
  echo "# remove $@ from history"
  for p in "$@"; do paths+=" --path "$p; done
  echo "git filter-repo$paths --invert-paths"
  echo "git reflog expire --expire=now --all"
  echo "git gc --prune=now --aggressive"
  echo "git remote -v"
  echo "git remote add origin https://github.com/vi0lin/app-development"
  echo "github push origin --force --all"
  echo ""
  echo "# rebase or re-clone"
  echo "git fetch origin"
  echo "git reset --hard origin/main"
}
```
### Using Generator
```
git_remove ./src/Functions.vim
```

# General Project Information
## Why I Prefer Custom Vim Functions
- I usually avoid Vim plugins.
- Vim's scripting language can be risky.
- I prefer writing my own functions.
- Hesitant to dive into others' plugin code.
- Others' scripting skills often impress me.
- Their stable solutions inspire my work.

## Organizing Vim for a Cozy Experience
- My approach keeps Vim editing comfortable.
- Easy to integrate or extend features.
- Newcomers can learn effective Vim techniques.
- Shows how to handle project editing smoothly.
- Demonstrates Vim's flexibility for on-the-fly tweaks.

## Why Vim Stands Out
- Every programming language has unique needs.
- Modifying heavy IDEs feels unpredictable.
- Vim is quick, smart, and suits real programmers.
- A reliable tool for efficient editing.

## Current Progress
- Keeping the code tidy and organized.
- Removing unnecessary code.
- Preparing to upload files soon.
