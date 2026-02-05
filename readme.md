# Vim-Advantages

#### Linux
```
sh | wget github.com/vi0lin/vim-advantages/blob/main/install.sh && rm ./install.sh
```

#### Windows
```
curl -o install.sh https://raw.githubusercontent.com/vi0lin/vim-advantages/refs/heads/main/install.sh
"C:\Program Files\Git\bin\bash.exe" .\install.sh
```
```
curl -o install.sh https://github.com/vi0lin/vim-advantages/refs/heads/main/install.sh
wsl --install
wsl bash install.sh
del install.sh
```

#### Vim Plug
```
call plug#begin()
  Plug 'vi0lin/vim-advantages'
call plug#end()
:PlugInstall
```


# Features
<table>
  <thead>
    <tr><th colspan=2><b>Quick Filesystem Traversal</b></th></tr>
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
    <tr><th>Repository</th><th>Branch</th><th>Mode</th><th>Quick Traversal Path</th><th>Space</th><th>Line Number / Max Lines</th></tr>
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
    <tr><td>C-A-p</td><td>Fuzzy Finder Integration (FZF)</td><td>/etc /home /lib</td></tr>
    <tr><td colspan=3>The FZF binary-call bottlenecks with a bad interface.<br>On <code>Enter</code> Key, it only delivers the file path, that then can possibily be saved in a temporary file.<br>
That means there is no good solution for archieving further functionality, but retrieving the FZF found file or files in a list.<br>
Handling keystrokes, like vims popup_create function, are less programmable with FZF.<br>
Therefore I implement the directory traversing myself.<br>
<code>Enter</code> opens a file, or goes into a Folder.<br>
<p>
Moving towards and away from the cached target is possibile. This simply changes the CWD of the current buffer. And filechecking within the current directory is simply made.</p>
</td></tr>
    <tr><td>Tab</td><td >Tab Trough Files in CWD</td><td>Todo: Add Filesearch Feature, that filters the list to contain the given keystrokes</td></tr>
    <tr><td>[a-zA-Z0-9]</td><td >Search</td><td>Unimplemented</td></tr>
    <tr><td>C-,</td><td colspan=2>Set CWD ..</td></tr>
    <tr><td>C-.</td><td colspan=2>Restore Previous CWD (traverse one folder up towards the last saved state)</td></tr>
    <tr><td>Up/Down/h/j</td><td colspan=2>Select a file or folder</td></tr>
    <tr><td>Enter</td><td colspan=2>Open the file, or go into the selected directory</td></tr>
    <tr><td>Tab / S-Tab</td><td colspan=2>Opening the next or previous file anyways</td></tr>
  </tbody>
</table>

## Window Manager
<table>
  <thead>
    <tr><th>Key</th><th>Feature</th></tr>
  </thead>
  <tbody>
    <tr><td>,-[hjkl]</td><td>Adds a buffer (left,below,above,right)</td></tr>
    <tr><td>,,-[hjkl]</td><td>Adds a terminal (left,below,above,right)</td></tr>
    <tr><td>C-S-[hjkl]</td><td>Move Window</td></tr>
    <tr><td>C-S-[hjkl]</td><td>Move Window To The Foremost</td></tr>
    <tr><td>C-q</td><td>Close Window</td></tr>
    <tr><td>C-S-q</td><td>Close Tab</td></tr>
    <tr><td>A-[hl]</td><td>Create a Tab, when there is none, or Move to the next or previous Tab</td></tr>
    <tr><td>C-Space</td><td>Maximizes window / restores previous size</td></tr>
  </tbody>
</table>

## Execution & Debug (needs implementation)
<table>
  <thead>
    <tr><th>Key</th><th>Feature</th><th>Info</th></tr>
  </thead>
  <tbody>
    <tr><td>F1-F12</td><td>Will be used, to execute commands</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td>S-[F1-F12]</td><td>Send Visual Selection To Terminal</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td>C-[F1-F12]</td><td>Sig Term</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td>C-S-[F1-F12]</td><td>Redo Last Command</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td>,[S][C][A][F1-F12]</td><td>Programm Command</td><td>Unimplemented</td></tr>
    <tr><td>,,[S][C][A][F1-F12]</td><td>Select Window For Operation</td><td>Unimplemented</td></tr>
    <tr><td>,,,[S][C][A][F1-F12]</td><td>Select Target For Operation</td><td>Unimplemented</td></tr>
    <tr><td colspan=2>The Keys F1 to F12 are programmable</td><td>Unimplemented</td></tr>
    <tr><td colspan=3>Remote machines must integrate well.</td></tr>
    <tr><td colspan=3>Commands will get elected by filetype and programming environment</td></tr>
    <tr><td colspan=3>I used to realize solutions for bash, python, c++, vulkan, flutter, c, rust and vimscript. I will also share my results there with you.</td></tr>
    <tr><td colspan=3>LSP and clang<br>I am gonna switch to neovim and use the LSP and clang for learning c++. Hopefully it will not melt my cpu.</td></tr>
    <tr><td colspan=3>The Execution Keymappings will be stored in a .vim-advantages file in the vim-advantages installation dir. So every file buffer preserves its own exeuction scripts. Wherether installing on a remote machine, run local, build, debug, setting up, installing and running services, remote or locally - it all will be effortless and comfortable quickly accessible on keypress, well documented easy adaptable.</td></tr>
    <tr><td>F5 F6 F7 F8</td><td>Make Makefile CMake Clangd integration</td><td>Its All unconsidered and unfinished.</td></tr>
    <tr><td>:Help</td><td>Prints the current commands accordingly to the file in a popup</td><td>Unimplemented</td></tr>
  </tbody>
</table>

## Git
<table>
  <thead>
    <tr><th>Command</th><th>Key</th><th>Feature</th></tr>
  </thead>
  <tbody>
    <tr><td colspan=3>My vim configuration has a hidden file where my account details for vi0lin on github.com are stored.</td></tr>
    <tr><td>:Push</td><td></td><td>Pushes The File to Github</td></tr>
    <tr><td>:PushRepo</td><td></td><td>Pushes The Repo to Github</td></tr>
    <tr><td>:PushCWD</td><td></td><td>Pushes The Files of the CWD to Github</td></tr>
    <tr><td>:GitDiff</td><td></td><td>Show The Git Differences Of This File</td></tr>
    <tr><td>:GitDiffAll</td><td></td><td>Show The Git Differences Of All Changed Files Of This Repository</td></tr>
    <tr><td>:GitDiffCWD</td><td></td><td>Show The Git Differences From The Changed Files In The Current Workdir</td></tr>
    <tr><td colspan=3>Git Diff needs a solution for the no-pager option. Also the clearing with the !clear && ... bash-call is not valid.</td></tr>
    <tr><td>:GitCommit</td><td></td><td>Git Commit (Todo: Standard Message or Last Message If Set)</td></tr>
    <tr><td>:GitCommitNewMessage</td><td>Unimplemented</td><td>Git Commit (Will Yield A Popup, To Add A Commit Message)</td></tr>
    <tr><td>:GitCommitLastMessage</td><td>Unimplemented</td><td>Git Commit With Last Message</td></tr>
    <tr><td>:GitAdd</td><td></td><td>Git Add This File</td></tr>
    <tr><td>:GitAddCWD</td><td></td><td>Git Add Files In CWD</td></tr>
    <tr><td>:GitAddRepo</td><td></td><td>Git Add Files In The Repository</td></tr>
    <tr><td colspan=2>There are multiple unquoted Git commands</td><td></td></tr>
    <tr><td colspan=2>Lazy Git</td>Not yet integrated.<td></td></tr>
  </tbody>
</table>

## Path Completion
<table>
  <thead>
    <tr><th>Key</th><th>Feature</th><th>Info</th></tr>
  </thead>
  <tbody>
    <tr><td>/</td><td>Opens a wildmenu for a quick, simple, efficient and practicable path autocompletion</td><td>Path Completion is Buggy, its commented out</td></tr>
  </tbody>
</table>

## General Vim
<table>
  <thead>
    <tr><th>Key</th><th>Feature</th><th>Info</th></tr>
  </thead>
  <tbody>
    <tr><td>C-F2</td><td>Toggle Word Wrap</td><td></td></tr>
    <tr><td>,,,-l</td><td>Toggle Linenumbers</td><td></td></tr>
    <tr><td>,,,-L</td><td>Toggle Linenumbers Global</td><td></td></tr>
    <tr><td>C-s</td><td>Saves the file - Reloads it, when it is a vim file</td><td></td></tr>
  </tbody>
</table>

> [!WARNING]
> YOU WILL FIND LOTS OF TRASH IN THE SOURCE FILES

<!--
```
VIM is buggy
EMACS SEEMS TO BE ERROR PRONE
```
-->


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
