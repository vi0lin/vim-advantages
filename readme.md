# My Approach to Using Vim
This project is considered a library or plugin
that can be installed with all features if
needed. It provides predefined keyboard mappings and quickly
introduces you to using Vim so you can
develop everything.

> [!NOTE]
> lines link
>   299 [./src/Map.vim](./src/Map.vim)
>   188 [./src/Statusline.vim](./src/Statusline.vim)
>    46 [./src/Autocommands.vim](./src/Autocommands.vim)
>   472 [./src/TextActions.vim](./src/TextActions.vim)
>  2397 [./src/Functions.vim](./src/Functions.vim)
>   137 [./src/Commands.vim](./src/Commands.vim)
>   367 [./src/Keymaps.vim](./src/Keymaps.vim)
>    50 [./install.sh](./install.sh)

# Install
The Project Is In An Unstable State.
Consider Not Using It.

You Can Choose Installing Vim-advantages Using 1. or 2.
## 1. Install This Project
Executing This Shellscript, Anywhere In Your Terminal. It will automatically install Plug.vim in your vim installation and automatically execute step #2
```
sh | wget github.com/vi0lin/vim-advantages/blob/main/install.sh && rm ./install.sh
```

## 2. Manually Installing Vim-advantages
This Needs To Be Integrated In Some Vime Source File Of Your Local Vim Installation
```
call plug#begin()
  Plug 'vi0lin/vim-advantages'
call plug#end()

:PlugInstall
```
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
