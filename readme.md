# My Approach to Using Vim

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
function VisualSelection(ci) range
  let ci = a:ci
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
  if IsNormal(ci) 
    let result=[getline('.')]
  elseif IsVisual(ci)
    let result=_prep_visual() 
  elseif IsVisualLine(ci)
    let result=lines
  elseif IsVisualBlock(ci)
    let result=_prep_visualblock() 
  elseif IsInsert(ci)
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
```

### Example Function WordPerLine
```
function WordPerLine(n) range
  let ci=CommandInfo()
  let text=VisualSelection(ci)
  let words=split(join(text, ' '), '\s\+')
  if IsAnyVisual(ci)
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
