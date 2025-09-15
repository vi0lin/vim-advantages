# My Approach to Using Vim
This project is considered a library or plugin
that can be installed with all features if
needed. It provides predefined keyboard mappings and quickly
introduces you to using Vim so you can
develop everything.
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

## Example For Handling Visual Selections Almost Properly
### General Visual Selection Handling
```
function VisualSelection() range
  let [l:start_line, l:start_col]=getpos("'<")[1:2]
  let [l:end_line, l:end_col]=getpos("'>")[1:2]
  let lines=getline(l:start_line, l:end_line)
  fun! _prep_visualblock() closure
    for line in lines
      let line=line[l:start_col-1:l:end_col]
    endfor
    return lines
  endf
  fun! _prep_visual() closure
    let lines[0]=lines[0][l:start_col-1:]
    let lines[-1]=lines[-1][:l:end_col-1]
    return lines
  endf
  if IsNormal(g:CI) 
    let result=[getline('.')]
  elseif IsVisual(g:CI)
    let result=_prep_visual() 
  elseif IsVisualLine(g:CI)
    let result=lines
  elseif IsVisualBlock(g:CI)
    let result=_prep_visualblock() 
  elseif IsInsert(g:CI)
    let result=[getline('.')]
  endif
  return result
endfunction

function CommandInfo(flag='')
  let mode = mode(0)
  let modee = mode(1)
  let visualmode = visualmode(1)
  let commandmode = a:flag=='c'?1:0
  let terminalinsertmode = a:flag=='t'?1:0
  let g:CI = [mode, modee, visualmode, commandmode, terminalinsertmode]
  return g:CI
endfunction

function IsTerminalInsert()
  let [mode, modee, visual, command, terminalinsert] = g:CI 
  return terminalinsert && modee=="nt"
endfunction
function IsTerminalNormal()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return !IsAnyVisual(g:CI) && !terminalinsert && modee=="nt"
endfunction
function IsTerminalVisual()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return !terminalinsert && modee=="nt"
endfunction
function IsNormal()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return !IsAnyVisual(g:CI) && modee=="n" || IsTerminalNormal()
endfunction
function IsAnyVisual()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual=~#"[vV]"
endfunction
function IsVisual()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual==#"v"
endfunction
function IsVisualLine()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual==#"V"
endfunction
function IsVisualBlock()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual==""
endfunction
function IsInsert()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return modee=~?".*i.*"||IsTerminalInsert()
endfunction
function IsCommand()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return command
endfunction
function IsTerminal()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return modee =~?".*t"
endfunction
```

### Example Function WordPerLine
```
function WordPerLine(n) range
  call CommandInfo()
  let text=VisualSelection()
  let words=split(join(text, ' '), '\s\+')
  if IsAnyVisual()
    execute "'<,'>d"
  else
    execute 'normal! dd'
  endif
  let formatted =[]
  let current_line=[]
  for i in range(0, len(words)-1)
    call add(current_line, words[i])
    if (i+1) % a:n == 0 || i == len(words)-1
      call add(formatted, join(current_line, ' '))
      let current_line = []
    endif
  endfor
  if !empty(current_line)
    call add(formatted, join(current_line, ' '))
    call append(line('.')-1, join(formatted, ' '))
  endif
  call append(line('.')-1, formatted)
  normal! k
endfunction
command -range -nargs=1 WordPerLine <line1>,<line2>call WordPerLine(<args>)
```
#### Usage
Formats a visual selection or the current line to contain a specified number of words per line.
```
:'<,'>WordPerLine 5
```
