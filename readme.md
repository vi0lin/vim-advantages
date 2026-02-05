# Vim-Advantages

```
sh | wget github.com/vi0lin/vim-advantages/blob/main/install.sh && rm ./install.sh
```

```
call plug#begin()
  Plug 'vi0lin/vim-advantages'
call plug#end()
:PlugInstall
```

# Features
<table>
  <thead>
    <tr><td colspan=2><b>Quick Filesystem Traversal</b></td></tr>
  </thead>
  <tbody>
    <tr><td colspan=2>
You can Quickly Access The Filesystem<br>/path/to/file/<b>File.ext</b><br>
The first part, gets highlighted accordingly to your cwd.<br>
Step up with <code>C ,</code> and step in with <code>C .</code>
Then, <code>Tab</code> or <code>C-p</code> uses this pointer for effectively moving around the operating systems directory tree.
</td></tr>
  </tbody>
</table>

<!--
<table>
  <thead>
    <tr><td colspan=2><b>Remote Machines</b></td></tr>
  </thead>
  <tbody>
    <tr><td colspan=2></td></tr>
  </tbody>
</table>
-->

## Statusline
<table>
  <thead>
    <tr><td>Repository</td><td>Branch</td><td>Mode</td><td>Quick Traversal Path</td><td>Space</td><td>Line Number / Max Lines</td></tr>
  </thead>
  <tbody>
    <tr><td>vim-advantages</td><td>Main</td><td>n</td><td>/path/to/<b>file.ext</b></td><td></td><td>41/246</td></tr>
  </tbody>
</table>

## File Traversal
<table>
  <thead>
    <tr>
      <th>Key</th>
      <th>Feature</th>
      <th>Info</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>C-p</td>
      <td>Fuzzy Finder Integration (FZF) </td>
      <td>Current File Workdir / Quick Filesystem Traversal workdir</td>
    </tr>
    <tr>
      <td>C-S-p</td>
      <td>Fuzzy Finder Integration (FZF) </td>
      <td>Git Repository Path</td>
    </tr>
    <tr><td>C-A-p</td><td>Fuzzy Finder Integration (FZF)</td><td>/etc /home /lib</td><td></td></tr>
    <tr><td>Tab</td><td >Tab Trough Files in CWD</td><td>Todo: Add Filesearch Feature</td></tr>
    <tr><td>C-comma</td><td colspan=2>Set CWD ..</td></tr>
    <tr><td>C-dot</td><td colspan=2>Restore Previous CWD (traverse one folder up towards the last saved state)</td></tr>
    <tr><td>Up/Down/h/j</td><td colspan=2>Select a file or folder</td></tr>
    <tr><td>Enter</td><td colspan=2>Open the file, or go into the selected directory</td></tr>
    <tr><td>Tab / S-Tab</td><td colspan=2>Opening the next or previous file anyways</td></tr>
  </tbody>
</table>

## Window Manager
<table>
  <thead>
    <tr><td>Key</td><td>Feature</td></tr>
  </thead>
  <tbody>
    <tr><td>comma-[hjkl]</td><td>Adds a buffer (left,below,above,right)</td></tr>
    <tr><td>comma-comma-[hjkl]</td><td>Adds a terminal (left,below,above,right)</td></tr>
    <tr><td>C-S-[hjkl]</td><td>Move Window</td></tr>
    <tr><td>C-S-[hjkl]</td><td>Move Window To The Foremost</td></tr>
    <tr><td>C-q</td><td>Close Window</td></tr>
    <tr><td>C-S-q</td><td>Close Tab</td></tr>
    <tr><td>A-[hl]</td><td>Create a Tab, when there is none, or Move to the next or previous Tab</td></tr>
    <tr><td>C-Space</td><td>Maximizes window / restores previous size</td></tr>
  </tbody>
</table>

## Execution & Debug
<table>
  <thead>
    <tr><td>Key</td><td>Feature</td><td>Info</td></tr>
  </thead>
  <tbody>
    <tr><td>F5 F6 F7 F8</td><td>Will be used, to execute commands</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td>S-[F5 F6 F7 F8]</td><td>Send Visual Selection To Terminal</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td>C-[F5 F6 F7 F8]</td><td>Sig Term</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td>C-S-[F5 F6 F7 F8]</td><td>Redo Last Command</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td colspan=3>Somehow remote machines must integrate well. I focus on executing bash, python, c++, vulkan, flutter, c, rust and vimscript.</td></tr>
    <tr><td colspan=3>LSP and clang<br>I am gonna switch to neovim and use the LSP and clang for learning c++. Hopefully it will not melt my cpu.</td></tr>
    <tr><td colspan=3>The Execution Keymappings will be stored in a .vim-advantages file in the vim-advantages installation dir. So every file buffer preserves its own exeuction scripts. Wherether installing on a remote machine, run local, build, debug, setting up, installing and running services, remote or locally - it all will be effortless and comfortable.</td></tr>
    <tr><td>F5 F6 F7 F8</td><td>Make Makefile CMake Clangd integration</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td>:Help</td><td colspan=2>Prints The Current Commands accordingly to the file in a popup</td></tr>
  </tbody>
</table>

## Git
<table>
  <thead>
    <tr><td>Command</td><td>Key</td><td>Feature</td></tr>
  </thead>
  <tbody>
    <tr><td>:Push</td><td></td><td>Pushes The File to Github</td></tr>
    <tr><td>:PushRepo</td><td></td><td>Pushes The Repo to Github</td></tr>
  </tbody>
</table>

<!--
## Lazy Git Integration
<table>
  <thead>
    <tr><td>Key</td><td>Feature</td></tr>
  </thead>
  <tbody>
    <tr><td colspan=2>Lazy Git</td></tr>
  </tbody>
</table>
-->

## Path Completion
<table>
  <thead>
    <tr><td>Key</td><td>Feature</td><td>Info</td></tr>
  </thead>
  <tbody>
    <tr><td>/</td><td>Opens a wildmenu for a quick, simple, efficient and practicable path autocompletion</td><td>Path Completion is Buggy, its commented out</td></tr>
  </tbody>
</table>

## General Vim
<table>
  <thead>
    <tr><td>Key</td><td>Feature</td><td>Info</td></tr>
  </thead>
  <tbody>
    <tr><td>C-F2</td><td>Toggle Word Wrap</td><td></td></tr>
    <tr><td>,,,-l</td><td>Toggle Linenumbers</td><td></td></tr>
    <tr><td>,,,-L</td><td>Toggle Linenumbers Global</td><td></td></tr>
  </tbody>
</table>

```
VIM is buggy
EMACS SEEMS TO BE ERROR PRONE

YOU WILL FIND LOTS OF TRASH IN THE SOURCE FILES
```


<!--
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

## 2. Install Manually
This Needs To Be Integrated In Some Vim Source File Of Your Local Vim Installation
```
call plug#begin()
  Plug 'vi0lin/vim-advantages'
call plug#end()

:PlugInstall
```
-->

<!--
# Vim-Advantages
This project is considered a library or plugin
that can be installed with all features if
needed. It provides predefined keyboard mappings and quickly
introduces you to using Vim so you can
develop everything.

> [!WARNING]
> Do not use this repository at this time, as it is under construction.

# Features
- Execution Manager
- Window Manager
- File Completion
- Text Actions

# Remove Accidentally Published Git Content

> [!TIP]
> Did you know how to delete traces of accidentially published content in the git history? 

> [!WARNING]
> Please use the following codes with extreme caution. It is not recommended to do this for shared projects, as the entire git tree will be changed.
> Overwriting the repo history only works with a new clone. I am working on cleaning up the repo in bash, but I need to make sure that no data is lost in the process (e.g., .gitignored files).
> Please work with a new clone if you want to use this bash script.

### Example
```
# remove ./src/Functions.vim from history
git filter-repo --path ./src/Functions.vim --invert-paths
git reflog expire --expire=now --all
git gc --prune=now --aggressive
git remote -v
# todo / dynamically gather repository url
git remote add origin {REPO}
github push origin --force --all

# rebase or re-clone
git fetch origin
git reset --hard origin/main
```

### Prototype Function
> [!WARNING]
> The snippet is still a work in progress and will be commented very soon.
```
git_remove() {
  paths=""
  echo "# remove $@ from history"
  for p in "$@"; do paths+=" --path "$p; done
  echo "git filter-repo$paths --invert-paths"
  echo "git reflog expire --expire=now --all"
  echo "git gc --prune=now --aggressive"
  echo "git remote -v"
  echo "# todo / dynamically gather repository url"
  echo "git remote add origin {REPO}"
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

# Build And Install GCC 15
Most linux distros deliver older GCC versions like GCC 12.
Here is, how to compile and install GCC 15.2.0 on your own.
Call the following bash function `build_gcc_15` in a suitable place.
This action takes some time.

```
build_gcc_15() {
  wget https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/gcc-15.2.0.tar.xz
  tar -xf gcc-15.2.0.tar.xz
  cd gcc-15.2.0
  ./contrib/download_prerequisites
  mkdir build && cd build
  ./configure --prefix=/usr/local/gcc-15 --enable-languages=c,c++ --disable-multilib
  make -j$(nproc)
  sudo make install
  # Add to your path
  echo 'export PATH=/usr/local/gcc-15/bin:$PATH' >> ~/.bashrc
  source ~/.bashrc
  gcc --version
}
```

# Donations
Donate to support my work. Every gesture helps me finalize my projects.
[PayPal](https://paypal.me/aVvNokLn0A1M)

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
-->
