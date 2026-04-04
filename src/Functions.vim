" Avoid cdo prompt for overwiting files
if !exists("g:vim_advantages_got_sourced")

function Vim_Advantages_Path()
  return split(&runtimepath, ",")[1]
endfunction

set hidden

function FindGitReposSystem()
  !find / -name .git -type d 2>/dev/null
endfunction

function __words()
  let c = 0
  redir => output
    " silent %s/[aeiou]//gn
    silent %s/\w//gn
  redir END
  let c = str2nr(matchstr(output, '\d\+'))
  echo c . " words found"
endfunction

function __vowels()
  let c = 0
  redir => output
    silent %s/[aeiou]//gn
  redir END
  let c = str2nr(matchstr(output, '\d\+'))
  echo c . " vowels found"
endfunction

" function ClipboardToUploader()
" FZF wieder zum laufen bringen.
" unterste zeile - c++ for example whole file word count | whole file double line count
" Kommentare aus VS() substituieren
" Try Enabling Statusline Only In One Buffer
" Force NewLines On Paste A Blockwised Yank Rectangle
" Uploader Chunkwise In Vim
" Put Registers
" Quick Command Assignments And Execution And Commands In Popup
" <leader><leader> show popup quickly without interferring <leader><leader> timeout
" put=execute('registers')
" vim is almost bash / textbased / i want to go away / to c
" LayoutBash is slow
" Make LayoutBash Only One File And Have Tabs To Tab Trough
" Fix Auto Intending
" Fix () {} auto closing [] curls "" '' `` ``` """ '''
" quicker file navigation
" <Tab> <S-Tab> Traverse Tab Buffers - LayoutBash Open File, but Easy Tab Traverse Instead
" Fix <A-h> Fix <A-l> in Terminal
" function ClipboardToUploader()
" Comments in vpn_roadwarrior_configuration
" Buffer At The Bottom Management (longpath)
" <leader><leader> shows path, where you located for g or p
" Push <C-g>/g <C-p>/p
" Kommentare Als Vimscript ausführen / In Dateien ausfindig machen
" Projektweise Und Fallback .vim-advantages mit Definierten Commands und
" Befehlssätzen
" Verschiedene Dateiformate haben verschiedene Kommentare
" Auto Intending Korrigieren
" Bubble Up Bubble Down Korrektur
" Ctrl A soll einen Block oder eine Funktion markieren
"   Ctrl-S jk wird die Markierung weiter nach oben oder unten erweitern
" Einfach Befehle Verändern / Popup List / Hinzufügen
" Liste Aller Buffer in FZF öffnen / Auswählen
" Tabweise Bufferliste Toggle Trough und Popup FZF
" <leader>s '<,'>s@@@g
" <leader><leader>s '<,'>s@{PASTE_FROM_REGISTER_"}@{Cursor Here}@g
" Fix C-c in Mobile, does not leave the visual selection
" Fix autoreload vimfiles, on save
" Quick git init --bare {somewhereelse} && Integration
"
"  !curl https://192.168.1.69:9000/upload
    \ -data getreg('"')
" endfunction

" if &term =~ 'xterm' || &term =~ 'kitty' || &term =~ 'alacritty'
  " set ttimeoutlen=50
  " set ttimeoutlen=0
  " Enable modifyOtherKeys (Vim 8.2+ / 9+)
  " let &t_TI = "\<Esc>[>4;2m"
  " let &t_TE = "\<Esc>[>4;m"
" endif

function __put_txt(lines)
endfunction

" put=execute('registers')
" p or P   inserts inline or characterwise (interlace, or overwrites parts of existing text)
" 0p 0P    prefixing it with a register should force linewise behaviour (THAT DOES NOT WORK IN MY CASE)
" :put     inserts below / treats blockwise register
" :put!    inserts above
"	if get(Part1, 'name') == get(Part2, 'name')

function __push_txt(...) range
  let i = 0
  let data=VS()
  while i < len(a:000)
    let arg = a:000[i]
    if arg ==# '-c' || arg ==# '--clipboard'
      " echo "clipboard enabled"
    elseif arg ==# '-r' || arg ==# '--register' || arg ==# '--reg'
      " echo "register enabled"
      if i+1<len(a:000)
        let r=a:000[i+1]
        echo r
        if r !~ '\v^-'
          " echo "parameter found after "..arg .. " " .. r
        " if r ==# '["0123456789acdefghijklmnopqrsuvwxy-*+.:%#/=]'
          let data=getreg('r')
        else
          let data=getreg('"')
        endif
      endif
    elseif arg ==# '-v' || arg ==# '--visual'
      let data=VS()
    elseif arg ==# '-n' || arg ==# '--norm' || arg ==# '--normal'
      let data=VS()
    endif
    let i += 1
  endwhile
  echo data
endfunction
" command! -range -bar -nargs=* RECP :call __push_txt(<f-args>)
" NewMap map <leader>aa :RECP --reg *<cr>
" NewMap map <leader>an :RECP --reg "<cr>
" NewMap map <leader>ab :RECP<cr>

function Re()
  if exists('g:vim_advantages_got_sourced')
    unlet g:vim_advantages_got_sourced
  endif
endfunction

function ReEnd()
  let g:vim_advantages_got_sourced='true'
endfunction

function! JumpToNextFile(dir) abort
    " dir = 1  → forward (like Ctrl-I)
    " dir = -1 → backward (like Ctrl-O)
    let jl = getjumplist()
    let jumplist = jl[0]
    let cur_idx = jl[1]
    let current_buf = bufnr('%')
    if a:dir > 0
        " Forward: search from cur_idx + 1 to the end
        let range = range(cur_idx + 1, len(jumplist) - 1)
    else
        " Backward: search from cur_idx - 1 down to 0
        let range = range(cur_idx - 1, 0, -1)
    endif
    for i in range
        let entry = jumplist[i]
        if entry.bufnr != current_buf && entry.bufnr > 0
            " Found a jump in a different file
            let steps = abs(i - cur_idx)
            execute 'normal! ' . steps . (a:dir > 0 ? "\<C-I>" : "\<C-O>")
            return
        endif
    endfor
    " No different file found in that direction
    echo "No more jumps to other files in this direction"
endfunction

let g:hostinfo="host@your-ip"
function Download_Unreleased()
  let rem="/home/user/.vim/plugged/vim-advantages/src/"
  let loc=rem
  fun! SshD(file) closure
    let c = '!ssh '..g:hostinfo..' "cat '..rem..a:file..'" > '..loc..a:file
    exec c
    echo c
    exec "source "..loc..a:file
  endfunction
  SshD Functions.vim.unreleased
  SshD Functions.vim9.unreleased
" echo expand('%:p:h')
endfunction

function! TESTTEST()
  echo execute('scriptnames')->split('\n')->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})->join('\n')
endfunction

" function! ExampleGrep()
"   return
"   grep pattern **/*.vim
"   vimgrep pattern **/*.vim
"   copen
"   cdo s/pattern/text/gc
"   cdo s/pattern/text/g
"   cfdo %s/pattern/text/gc
"   cfdo %s/pattern/text/g
"   wall
"   cfdo update
"
"   cfirst
"   %s/pattern/text/gc
"   cnext
"   %s/pattern/text/gc
"
"   grep pattern *.lua
"   cdo s//NewPattern/gc \| update
"
"   " not tested
"   lgrep function -> call src/js/**/*.js
"   cfdo %s//new/g | lupdate
"
"   " // replace last search pattern
"   cdo s//new/gce | update
"   " e flag (no error message when nothing found)
"   grep -i
"   " -i setignore case
"   set ignorecase
"   " ripgrep / ag / git-grep are much faster
"   if executable('rg')
"     set grepprg=rg\ --vimgrep\ --smart-case
"     set grepformat=%f:%l:%c:%m:,%f:%l:%m
"   endif
"   cdo s//newpattern/gc
"   " press a for abort
"
"   cdo s//new/g | w!
"   set nobackup nowritebackup " temporarily
"   set backup& writebackup&
"
"   cfdo %s//new/gc | update
"
"   " but the best solution is
"   set hidden
" endfunction

" call Print("message")
" call vim9#Print2("message")
" vim9cmd vim9#Print("MEEESSAGE")
" vim9cmd vim9#Print2("MEEESSAGE")
" finish

" Development is progressing slowly due to an important decision-making stage.
" 0.03% Chance This Will Even Work

" Returns something close to mapping notation (best-effort)
" Works well for ascii, <C-a>–<C-z>, <F1>–<F12>, <C-F1> in many terminals

func! NEW()
  vnew | put=getbufline('#', 1, '$')
endfunction
command! -bar -nargs=0 NEW :call NEW()

func! SystemClipboard()
  let @+ = @:
endfun

func! PutCommand(nr=0)
  " put=":
  " put :
  if a:nr == 0
    let nnr=1
  else
    let nnr=a:nr
  endif
  let x=join(map(range(histnr(':')-nnr, histnr(':')-1), "histget(':', v:val)"), "\n")
  put=x
endfun

function! GrepSplit(term)
  NEW | exec '%!grep '..a:term | exec '%!sort | uniq'
endfunction

func! Key2Notation(key) abort
    if type(a:key) == v:t_number
        let nr = a:key
        let c = nr2char(nr)
    else
        let c = a:key           " already string from getcharstr()
        let nr = char2nr(c)
    endif

    if nr >= 0 && nr <= 31
        " Ctrl + letter/symbol
        if nr == 0      | return '<Nul>'     | endif
        if nr == 27     | return '<Esc>'     | endif
        let letter = nr2char(nr + 64)       " 1 → A, 2 → B, …
        return '<C-' .. toupper(letter) .. '>'
    endif

    if c =~ '^[[:print:]]$'
        if c == ' '     | return '<Space>'   | endif
        if c == "\<Tab>"| return '<Tab>'     | endif
        return c
    endif

    " Try to guess function keys / modified fx from common term sequences
    " (very incomplete – terminals differ!)
    let seq = substitute(c, "\<", '', 'g')   " just in case

    if seq =~# '^[[1;[1-9]*[A-HOPZ~]$' || seq =~# '^O[A-Z]' || seq =~# '^\[\[.\+$'
        " Many <Fx>, <S-Fx>, <C-Fx> land here
        return '<' .. substitute(seq, '^[^[]*\[\[=\?', '', '') .. '>'   " crude
    endif

    " Fallback: show hex escape
    let hex = ''
    for i in range(0, strlen(c)-1)
        let hex ..= printf('\x%02x', char2nr(c[i]))
    endfor
    return printf('<%s>', hex)
endfunc

" Usage example
nnoremap <leader>K :<C-u>call ShowKeyNotation()<CR>

func! ShowKeyNotation() abort
    echon 'Press key/combo → '
    let k = getcharstr()
    redraw
    echo 'getcharstr() → ' .. string(k)
    echo 'Best-guess mapping notation → ' .. Key2Notation(k)
endfunc

function! Folder_Up(nr)
  let path=CWD()
  let i = 0
  " echo path a:nr i
  while i < a:nr
    let path=GetParentDir(path)
    let i += 1
  endwhile
  return path
endfunction
function! Folder_Project()
  return CWD()
endfunction
function! Folder_Repo(backwards=0)
  let file = -1
  if a:backwards==0
    let file=w:git
  elseif a:backwards==1
    let file=FindGit(GetParentDir(w:git))
  elseif a:backwards==2
    let file=FindGit(GetParentDir(FindGit(GetParentDir(w:git))))
  endif
  if file == -1
    " getcwd is not userfriendly
    " consider throwing a message
    let file=getcwd()
    echo "No higher Repo"
    return
  endif
  return file
endfunction
function! Folder_System()
  return g:system_folders
endfunction

function RgDir(args)
  call fzf#vim#grep('rg --column --line-number --color=always --smart-case --files '.shellescape(split(a:args)[0]))
endfunction
command! -bang -nargs=* -complete=dir RgDir :call RgDir(<q-args>)
nnoremap <leader>rg :RgDir<space>

function! AgIn(path, ...)
  let query = join(a:000, ' ')
  call fzf#vim#ag(query, {'dir': a:path})
endfunction
command! -nargs=+ -complete=dir AgIn call AgIn(<f-args>)

function! ColorScheme()
  colorscheme blue
  colorscheme darkblue
  colorscheme default
  colorscheme delek
  colorscheme desert
  colorscheme elflord
  colorscheme evening
  colorscheme habamax
  colorscheme industry
  colorscheme koehler
  colorscheme lunaperche
  colorscheme morning
  colorscheme murphy
  colorscheme pablo
  colorscheme peachpuff
  colorscheme quiet
  colorscheme retrobox
  colorscheme ron
  colorscheme shine
  colorscheme slate
  colorscheme sorbet
  colorscheme torte
  colorscheme wildcharm
  colorscheme zaibatsu
  colorscheme zellner
  colorscheme blue
  colorscheme default
  colorscheme elflord
  colorscheme industry
  colorscheme koehler
  colorscheme morning
  colorscheme slate
  colorscheme pablo
  colorscheme peachpuff
  colorscheme ron
  colorscheme shine
  colorscheme torte
  colorscheme zellner
  colorscheme darkblue
  colorscheme murphy
  colorscheme evening
  colorscheme desert
  colorscheme delek
  colorscheme slate
  colorscheme habamax
endfunction
colorscheme desert

fun! CloseOther()
  let win=winnr()
  let max_win=winnr('$')
  let arr=range(1,max_win)
  call filter(arr, 'v:val != '..win)
  " exec arr..'windo echo winnr()'
  for id in reverse(arr)
    " echo id
    " if win_id2win(id) > 0
    " endif
    let b=winbufnr(id)
    execute id.'wincmd q'
    execute b.'bd'
  endfor
endf
map <F12> :call CloseOther()<cr>
map <leader>p :GithubPush<cr>

function! Help()
  " if getbufvar(bufnr(), '&buftype') == 'terminal'
  "   echo "Terminal"
  " elseif getbufvar(bufnr(), '&buftype') == 'buffer'
  "   echo "Buffer"
  " endif
  echo "F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12"
endfunction

function! ToggleComment()
    if has_key(s:comment_map, &filetype)
        let comment_leader = s:comment_map[&filetype]
        if getline('.') =~ "^\\s*" . comment_leader . " "
            execute "silent s/^\\(\\s*\\)" . comment_leader . " /\\1/"
        else
            if getline('.') =~ "^\\s*" . comment_leader
                execute "silent s/^\\(\\s*\\)" . comment_leader . "/\\1/"
            else
                execute "silent s/^\\(\\s*\\)/\\1" . comment_leader . " /"
            end
        end
    else
        echo "No comment leader found for filetype"
    end
    if GetMode()=="Visual"
      norm gv
    endif
endfunction

function! DeleteFile()
  let file=expand('%')
  let sure=input('Deleting File '.file.'. Are you sure? [type yes] ')
  if sure == "yes"
    redraw!
    call delete(file)
    bd
  endif
endfunction

function! JoinSplits(dir)
  " call win_gotoid(win_getid(winnr('l')))
  " call win_gotoid(win_getid(winnr('1l')))
  let total=winnr('$')
  let winid=win_getid()
  let target=winnr(a:dir)
  let buf=bufnr()
  " echo "total:" total
    \.", win:"win
    \.", target:"target
    \.", a:dir:"a:dir
  " exec "wincmd"a:dir
  " exec target'windo echo winnr()'
  exec "wincmd"a:dir
  split
  exec "b"buf
  let new_winid=win_getid()
  call win_gotoid(winid) | close
  call win_gotoid(new_winid)
endfunction

function! NewWindow(direction)
  echo "Implement NewWindow"
  if a:direction ==# "H" || a:direction ==# "h"
    vsplit
    <C-S-l>
  elseif a:direction ==# "J" || a:direction ==# "j"
  elseif a:direction ==# "K" || a:direction ==# "k"
  elseif a:direction ==# "L" || a:direction ==# "l"
  endif
endfunction

function! MoveOutOfSplit(dir)
  echo "Implement MoveOutOfSplit"
  let target=winnr(a:dir)
  let bufnr=bufnr()

  let opposite_direction=['l','k','j','h'][index(['h','j','k','l'], a:dir)]]
  if target==winnr()
    exec 'wincmd '..toupper(dir)
  else
    " exec winnr()..'wincmd q'
    wincmd q
    exec 'wincmd '..dir
    exec 'b'..bufnr
  endif
endfunction

function! DebugPaths()
  echo "CWD          "CWD()
  echo "POINTER     "POINTER()
  echo "POINTER_DIR "POINTER_DIR()
  echo "RELATIVE     "RELATIVE()
  echo "RELATIVE_DIR "RELATIVE_DIR()
  echo "ABSOLUTE     "ABSOLUTE()
  echo "ABSOLUTE_DIR "ABSOLUTE_DIR()
endfunction

function! NewFile()
  let path=POINTER_DIR().'/'
  let node = input('New File:  ['..path..']  ', path, 'file')
  call _newfile_andCD(node)
endfunction

" Environment
function! __dump(obj)
  return l:
endfunction
function! __load(json)
  let l:=a:json
endfunction

function! SaveDict(file, dict)
  call writefile([json_encode(a:dict)], a:file)
endfunction

function! LoadDict(file)
  return json_decode(join(readfile(a:file), "\n"))
endfunction

function! FindProjects()
  let list=systemlist("find . -name .git -type d")
  echo list
endfunction

" Does Not Dissolve Arrays
function! PrettyNested(dict, indent=2,surround_with_brackets=1)
  if a:surround_with_brackets==1
    let output="{\n"
  else
    let output=""
  endif
  for [key, value] in items(a:dict)
    let indent=repeat(' ', a:indent+1)
    if type(value) == v:t_dict
      let output.=indent.string(key).': '.PrettyNested(value, a:indent+1, 1).",\n"
    elseif type(value) == v:t_list
      let output.='[ '.PrettyNested(value, a:indent+1, 1)." ],\n"
    else
      let output.=indent.string(key).': '.string(value).",\n"
    endif
  endfor
  let output.=repeat(' ', a:indent)
  if a:surround_with_brackets==1
    let output.='}'
  endif
  return output
endfunction

function! PrettyDictNested2(dict, indent=2)
  let output="{\n"
  for [key, value] in items(a:dict)
    let indent=repeat(' ', a:indent+1)
    if type(value) == v:t_dict
      let output.=indent.string(key).': '.PrettyDictNested2(value, a:indent+1).",\n"
    else
      let output.=indent.string(key).': '.string(value).",\n"
    endif
  endfor
  let output.=repeat(' ', a:indent).'}'
  return output
endfunction

function! Pretty(x)
  return PrettyNested(a:x)
endfunction

function! P(x)
  return PrettyNested(a:x)
endfunction

function! Format(x)
  return PrettyNested(a:x, 2)
endfunction

function! Format2(x)
  return PrettyDictNested2(a:x, 2)
endfunction

function! J(x)
  return json_encode(a:x)
endfunction

function! CountWindowsInDirection(direction)
  let i = 0
  let last_win=winnr()
  while v:true
    " let next_win=winbufnr(winnr(i..a:direction))
    let next_win = winnr(i+1..a:direction)
    if next_win == last_win
      return i
    endif
    let last_win = next_win
    let i += 1
  endwhile
endfunction

function! DirectionBufWin(direction)
  return winbufnr(winnr(a:direction))
endfunction

function! GetWinDirectionIfTerm(direction)
  for i in range(0, CountWindowsInDirection(a:direction))
    let win=DirectionBufWin(i+1..a:direction)
    if BufIsTerminal(win)
      return win
    endif
  endfor
  return -1
endfunction

function! BufType(nr)
  echo getbufvar(a:nr, 'buftype')
endfunction

function! BufIsBuffer(nr)
  if getbufvar(a:nr, '&buftype') == 'buffer'
    return 1
  endif
  return 0
endfunction

function! BufIsTerminal(nr)
  if getbufvar(a:nr, '&buftype') == 'terminal'
    return 1
  endif
  return 0
endfunction

function! GetTargetTerm(direction)
  " if exists("b:target_term_fixed")
  "   return b:target_term_fixed
  " endif
  " if exists("b:target_term")
  "   return b:target_term
  " endif
  return SearchTargetTerm(a:direction)
endfunction

function! GetDirection(key)
  let directions={
    \  'F5': 'h',
    \  'F6': 'j',
    \  'F7': 'k',
    \  'F8': 'l'
    \}
  return directions[a:key]
endfunction

function! SearchTargetTerm(direction)
  let b:target_term=GetWinDirectionIfTerm(a:direction)
  return b:target_term
endfunction

function! FixTargetTerm(key)
  let directions={
    \  'F5': 'h',
    \  'F6': 'j',
    \  'F7': 'k',
    \  'F8': 'l'
    \}
  " if !exists("b:target_term")
  let direction=directions[a:key]
  " let win=DirectionBufWin(direction)
  " echo getbufvar(buf, )
  " echo direction buf
  " echo DirectionBufUntilTermOrEnd(direction)
  " echo CountWindowsInDirection(direction)
  " echo GetWinTermDirection(direction)
  let b:target_term_fixed=GetWinDirectionIfTerm(direction)
  " if BufIsTerminal(buf)
  "   let b:target_term=buf
  " else
  "   echo "Not A Terminal On"direction
  " endif
  " else
  "   echo b:target_term
  " endif
endfunction

function! ToArrayIfIsnt(data)
  if type(a:data)!=3
    return [a:data]
  endif
  return a:data
endfunction

map <leader>x :if exists("b:target_term") \| unlet b:target_term \| endif<cr>
function! List_CWD_OpenedWindows()
  let list = []
  for nr in range(1,winnr('$'))
    call extend(list, [getwinvar(nr, 'cwd')])
  endfor
  return list
endfunction

function! BuildString_Find_All_CWDS_slow(cwds)
  let out=""
  let len=len(a:cwds)
  let range=range(1,len)
  let i = 1
  while i < len
    let out=out.a:cwds[i]
    if i<len-1
      let out=out.' '
    endif
    let i+=1
	endwhile
  " echo out
  return 'find '.out.' -type f -name ="*.sh"'
endfunction

function! BuildString_Find_All_CWDS(cwds, pattern, postfix='')
  let cwds=uniq(uniq(a:cwds))
  let out=""
  let len=len(cwds)
  let range=range(1,len)
  let i = 1
  while i < len
    " if len>1 && i==1
    "   let out=out..'.,'
    " endif
    let out=out.cwds[i]..'/'..a:postfix
    " ..'/**'
    if i<len-1
      let out=out.','
    endif
    let i+=1
	endwhile
  " exec 'set path='..out
  " set path?
  " find *.sh
  return globpath(out, a:pattern)
endfunction

function! SelectTerm(keymap)
  if a:keymap=~#"F[1234]"
    echo "tab"
  elseif a:keymap=~#"F[5678]"
    echo "win"
  endif
endfunction

function! SelectCommand_callback(id, code, register)
  echo "Not Implemented"
endfunction

function! SelectCommand(keymap, info='')
  let Callback=function('SelectCommand_callback', ["window"])
  let list=[ 'Data', 'More Data', 'Data For The List' ]
  call SelectCommandPopup("Commands: ", list, Callback)
  return
  if a:keymap=~#"F[1234]"
    echo "tab"
  elseif a:keymap=~#"F[5678]"
    echo "win"
  endif
  " function SelectCommand()
  "   let Callback=function('OpenFile_callback', ["window"])
  "   call FZFPopup("Open file: ", "file", CWD(), Callback)
  " endfunction
endfunction

" function ConfigureExecute(keymap, shift=0, control=0, alt=0)
"   let vs=VS()
"   " echo a:shift a:control
"   " a:alt
"   call SelectCommand(a:keymap,"")
" endfunction

function! GetRepoLocation()
  if w:git!=-1
    return w:git
  else
    return getcwd()
  endif
endfunction

function! GetVimJsonLocation()
  if w:git!=-1
    return w:git.."/vim.json"
  else
    return (getcwd()=='/' ? getcwd() : getcwd()..'/').."vim.json"
  endif
endfunction

function! Execute2(keymap, shift=0, control=0, alt=0)
  echo "TEST"
  return
  " Example Execution Manager Data Structure
  let pocket={
    \ "mappings": [
      \ { "key": "F1", "command": "ls -al", "cc": 1, "cr": 1 },
      \ { "key": "F2", "command": "ls -al", "cc": 1, "cr": 0 },
      \ { "key": "F3", "command": "ls -al", "cc": 1, "cr": 0 },
      \ { "key": "F4", "command": "ls -al", "cc": 1, "cr": 0 },
    \ ],
    \ "commands": [
    \ { "name": "Build Uploader", "cmd": "source file.sh" },
    \ { "name": "Run Uploader", "cmd": "source file.sh" },
    \ { "name": "Test Uploader", "cmd": "source file.sh" },
    \ { "name": "Push Uploader", "cmd": "source file.sh" },
    \]
  \ }
  echo Format(pocket)
  " call DebugPaths()
  " echo RELATIVE_DIR()
  let holder=[]
  let cwds=uniq(List_CWD_OpenedWindows())
  let cmd=BuildString_Find_All_CWDS(cwds, '*.sh')
  let build=BuildString_Find_All_CWDS(cwds, 'build')
  let run=BuildString_Find_All_CWDS(cwds, 'run')
  let json=BuildString_Find_All_CWDS(cwds, 'vim.json')
  let new='new'
  call extend(holder,[cwds])
  call extend(holder,[cmd])
  call extend(holder,[build])
  call extend(holder,[run])
  call extend(holder,[json])
  call extend(holder,[new])
  echo Format(holder)
  let file=GetVimJsonLocation()
  call SaveDict(file, pocket)
  let loaded=LoadDict(file)
  echo loaded
  " echo cmd build run json
  " let vs=VS()
  "let cmd3=BuildString_Find_All_CWDS(cwds, 'run', '**')
  " let sh_files=systemlist(cmd)
  " echo sh_files
  " let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  " echo a:keymap
endfunction

hi QuickFixLine ctermbg=Yellow guibg=Yellow
function! COTests()
  " lopen copen cclose lclose cwindow height lwindow height cbottom lbottom
  " botright cwindow
  " botleft
	" au BufReadPost quickfix  setlocal modifiable
	" 	\ | silent exe 'g/^/s//\=line(".") .. " "/'
	" 	\ | setlocal nomodifiable
	" echo getqflist({'winid' : 1}).winid
	" echo getloclist(2, {'winid' : 1}).winid

  "  " get the title of the current quickfix list
  "  :echo getqflist({'title' : 0}).title
  "  " get the identifier of the current quickfix list

  "  :let qfid = getqflist({'id' : 0}).id
  "  " get the identifier of the fourth quickfix list in the stack
  "  :let qfid = getqflist({'nr' : 4, 'id' : 0}).id
  "  " check whether a quickfix list with a specific identifier exists
  "  :if getqflist({'id' : qfid}).id == qfid
  "  " get the index of the current quickfix list in the stack
  "  :let qfnum = getqflist({'nr' : 0}).nr
  "  " get the items of a quickfix list specified by an identifier
  "  :echo getqflist({'id' : qfid, 'items' : 0}).items
  "  " get the number of entries in a quickfix list specified by an id
  "  :echo getqflist({'id' : qfid, 'size' : 0}).size
  "  " get the context of the third quickfix list in the stack
  "  :echo getqflist({'nr' : 3, 'context' : 0}).context
  "  " get the number of quickfix lists in the stack
  "  :echo getqflist({'nr' : '$'}).nr
  "  " get the number of times the current quickfix list is changed
  "  :echo getqflist({'changedtick' : 0}).changedtick
  "  " get the current entry in a quickfix list specified by an identifier
  "  :echo getqflist({'id' : qfid, 'idx' : 0}).idx
  "  " get all the quickfix list attributes using an identifier
  "  :echo getqflist({'id' : qfid, 'all' : 0})
  "  " parse text from a List of lines and return a quickfix list
  "  :let myList = ["a.java:10:L10", "b.java:20:L20"]
  "  :echo getqflist({'lines' : myList}).items
  "  " parse text using a custom 'efm' and return a quickfix list
  "  :echo getqflist({'lines' : ['a.c#10#Line 10'], 'efm':'%f#%l#%m'}).items
  "  " get the quickfix list window id
  "  :echo getqflist({'winid' : 0}).winid
  "  " get the quickfix list window buffer number
  "  :echo getqflist({'qfbufnr' : 0}).qfbufnr
  "  " get the context of the current location list
  "  :echo getloclist(0, {'context' : 0}).context
  "  " get the location list window id of the third window
  "  :echo getloclist(3, {'winid' : 0}).winid
  "  " get the location list window buffer number of the third window
  "  :echo getloclist(3, {'qfbufnr' : 0}).qfbufnr
  "  " get the file window id of a location list window (winnr: 4)
  "  :echo getloclist(4, {'filewinid' : 0}).filewinid
<
	"						*setqflist-examples*
Th"e |setqflist()| and |setloclist()| functions can be used to set the various
at"tributes of a quickfix and location list respectively. Some examples for
us"ing these functions are below:
>
  "  " create an empty quickfix list with a title and a context
  "  :let t = 'Search results'
  "  :let c = {'cmd' : 'grep'}
  "  :call setqflist([], ' ', {'title' : t, 'context' : c})
  "  " set the title of the current quickfix list
  "  :call setqflist([], 'a', {'title' : 'Mytitle'})
  "  " change the current entry in the list specified by an identifier
  "  :call setqflist([], 'a', {'id' : qfid, 'idx' : 10})
  "  " set the context of a quickfix list specified by an identifier
  "  :call setqflist([], 'a', {'id' : qfid, 'context' : {'val' : 100}})
  "  " create a new quickfix list from a command output
  "  :call setqflist([], ' ', {'lines' : systemlist('grep -Hn main *.c')})
  "  " parse text using a custom efm and add to a particular quickfix list
  "  :call setqflist([], 'a', {'id' : qfid,
	"	\ 'lines' : ["a.c#10#L10", "b.c#20#L20"], 'efm':'%f#%l#%m'})
  "  " add items to the quickfix list specified by an identifier
  "  :let newItems = [{'filename' : 'a.txt', 'lnum' : 10, 'text' : "Apple"},
	"	    \ {'filename' : 'b.txt', 'lnum' : 20, 'text' : "Orange"}]
  "  :call setqflist([], 'a', {'id' : qfid, 'items' : newItems})
  "  " empty a quickfix list specified by an identifier
  "  :call setqflist([], 'r', {'id' : qfid, 'items' : []})
  "  " free all the quickfix lists in the stack
  "  :call setqflist([], 'f')
  "  " set the title of the fourth quickfix list
  "  :call setqflist([], 'a', {'nr' : 4, 'title' : 'SomeTitle'})
  "  " create a new quickfix list at the end of the stack
  "  :call setqflist([], ' ', {'nr' : '$',
	"		\ 'lines' : systemlist('grep -Hn class *.java')})
  "  " create a new location list from a command output
  "  :call setloclist(0, [], ' ', {'lines' : systemlist('grep -Hn main *.c')})
  "  " replace the location list entries for the third window
  "  :call setloclist(3, [], 'r', {'items' : newItems})

  let l:cmd = g:bashrc_source..'; wakeup 0 0 2'
  call job_start(l:cmd, {
    \ 'out_cb': {channel, msg -> execute('cgetexpr msg')},
    \ 'close_cb': {channel -> execute('lopen')},
    \ })
endfunction
map <C-F8> :call COTests()<cr>

function! GitCheckoutPrevback()
endfunction

function! GitCheckoutPrevbackCWD()
endfunction

function! GitCheckoutPrevnext()
endfunction

function! GitCheckoutPrevnextCWD()
endfunction

function! GitStash()
endfunction

function! GitStashCWD()
endfunction

function! GitApplyStash()
endfunction

command! -range -nargs=? Push <line1>,<line2>:call Push(<q-args>)
function! Push(commitmessage='')
  GitAdd
  GitStatus
  " call system("read")
  " call input("Procceed? [<CR> Yes] [<C-c> Cancel]")
  call GitCommit(a:commitmessage)
  GithubPush
endfunction

command! -range -nargs=? Pull <line1>,<line2>:call Pull(<q-args>)
function! Pull(commitmessage='')
  StashPush
  !git pull origin main --no-rebase
  StashPop
endfunction

command! -range -nargs=? StashPush <line1>,<line2>:call StashPush(<q-args>)
function! StashPush(commitmessage='')
  !git stash push
endfunction

command! -range -nargs=? StashPop <line1>,<line2>:call StashPop(<q-args>)
function! StashPop(commitmessage='')
  !git stash pop
endfunction

command! -range -nargs=? PushRepo <line1>,<line2>:call PushRepo(<args>)
function! PushRepo(commitmessage='')
  GitAddRepo
  GitStatus
  call GitCommit(a:commitmessage)
  GithubPush
endfunction

function! Fetch_Last_Git_Message()
  if exists("b:isGitRepo") && b:isGitRepo=='true'
    let g:lastcommitmessage=systemlist('git log -1 --pretty=%B | head -n 1')[0]
  endif
endfunction

if !exists("g:set_git_message")
  let g:set_git_message=1
endif

function! Toggle_Set_Last_Git_Message()
  let g:set_git_message=!g:set_git_message
endfunction

if !exists("g:lastmessage")
  call Fetch_Last_Git_Message()
endif

function! UpdateLastCommitMessageWhenChanged(commitmessage='')
  if exists('g:lastcommitmessage')
    let message = input("Commit with Message: ['".g:lastcommitmessage."']  ")
    if message != ''
      let g:lastcommitmessage = message
    endif
  else
    echo "g:lastcommitmessage does not exists"
  endif
endfunction

command! -range -nargs=0 GitMessage <line1>,<line2>:call GitMessage()
function! GitMessage(commitmessage='')
  call Fetch_Last_Git_Message()
  if g:set_git_message
    if a:commitmessage==''
      call UpdateLastCommitMessageWhenChanged()
    endif
  endif
endfunction

command! -range -nargs=* PushCWD <line1>,<line2>:call PushCWD(<q-args>)
function! PushCWD(commitmessage='')
  GitAddCWD
  GitStatus
  call GitCommit(a:commitmessage)
  GithubPush
endfunction

function! GetOptExample(...) abort
    let opts = #{verbose: 0, output: '', force: 0}
    let files = []
    let i = 0
    while i < a:0
        let arg = a:000[i]
        if arg =~# '^--\?\w'
            if arg ==# '-v' || arg ==# '--verbose'
                let opts.verbose = 1
            elseif arg ==# '-f' || arg ==# '--force'
                let opts.force = 1
            elseif arg =~# '^-\?-\?o\(utput\)\?='
                " Handle -o=value or --output=value
                let val = substitute(arg, '^-\?-\?o\(utput\)\?=', '', '')
                if empty(val)
                    let i += 1
                    let val = a:000[i]
                endif
                let opts.output = val
            elseif arg ==# '-o' || arg ==# '--output'
                let i += 1
                let opts.output = a:000[i]
            else
                echoerr "Unknown option: " .. arg
                return
            endif
        else
            call add(files, arg)
        endif
        let i += 1
    endwhile
    " Use opts and files...
    if opts.verbose
        echo "Running in verbose mode"
    endif
endfunction


command! -range -nargs=0 GitDiff <line1>,<line2>:call GitDiff(<f-args>)
command! -range -nargs=* Diff <line1>,<line2>:call GitDiff(<f-args>)
function! GitDiff(...)
  let cmd = #{text: '--text', pager: '', cached: '', file: '%'}
  let i = 0
  while i < len(a:000)
    let arg = a:000[i]
    if arg ==# '-a' || arg ==# '--all'
      let cmd.file=''
    elseif arg ==# '-t' || arg ==# '--text'
      let cmd.text='--text'
    elseif arg ==# '-n' || arg ==# '--no-text'
      let cmd.text=''
    elseif arg ==# '-p' || arg ==# '--no-pager'
      let cmd.pager=''
    elseif arg ==# '-c' || arg ==# '--cached'
      let cmd.cached='--cached'
    endif
    let i += 1
  endwhile
  " !clear && git --no-pager diff --text %
  " !clear && git diff --text %
  " !clear && git diff --cached --text %
  " let args=join([ cmd.text, cmd.pager, cmd.cached, cmd.file ], ' ')
  let x = [ cmd.text, cmd.pager, cmd.cached, cmd.file ]
  let cleaned=filter(x, 'v:val != "^\\s*$"')
  " exec "!clear && git diff "..join(cleaned, ' ')
  exec "!clear && git diff "..join(cleaned, ' ')
  " let x =<< eval trim EOF
  " !clear && git diff {cmd.text} {cmd.pager} {cmd.cached} {cmd.file}
  " EOF
" exec trim(join(x,''))
endfunction

command! -range -nargs=0 GitDiffAll <line1>,<line2>:call GitDiffAll(<q-args>)
command! -range -nargs=0 DiffAll <line1>,<line2>:call GitDiffAll(<q-args>)
function! GitDiffAll()
  " !clear && git --no-pager diff --text
  " !clear && git diff --text
  GitDiff --all
endfunction

command! -range -nargs=0 GitDiffCWD <line1>,<line2>:call GitDiffCWD()
function! GitDiffCWD()
  " !clear && git diff
  GitDiff --all
endfunction

command! -range -nargs=0 GitAdd <line1>,<line2>:call GitAdd()
function! GitAdd()
  !clear && git add %
endfunction

command! -range -nargs=0 GitAddCWD <line1>,<line2>:call GitAddCWD()
function! GitAddCWD()
  " !clear && git add .
  !clear && git add -A
  " || git add -A
endfunction

command! -range -nargs=0 GitAddRepo <line1>,<line2>:call GitAddRepo()
function! GitAddRepo()
  " echo '!clear && git add'w:git
  exec '!clear && git add'w:git
  " || git add -A
endfunction

command! -range -nargs=0 GitRemoveCached <line1>,<line2>:call GitRemovemCached()
function GitRemoveCached()
  !git rm -r --cached .
endfunction

command! -range -nargs=? GitCommit <line1>,<line2>:call GitCommit(<args>)
function! GitCommit(message='')
  call GitMessage(a:message)
  let msg=''
  if a:message==''
    let msg=g:lastcommitmessage
  else
    let msg=a:message
  endif
  " echo msg
  " call input(msg)
  " echo '!clear && git commit -m "'..msg..'"'
  exec '!clear && git commit -m "'..msg..'"'
endfunction

command! -range -nargs=0 GitPush <line1>,<line2>:call GitPush()
function! GitPush()
  !clear && git push origin master
endfunction

command! -range -nargs=0 Status <line1>,<line2>:call GitStatus()
command! -range -nargs=0 GitStatus <line1>,<line2>:call GitStatus()
function! GitStatus()
  !clear && git status
endfunction

function GithubIntegrateProject(repo)
  " check if current folder has .git files
  let tmp_folder="folder_tmp"
  if !isdirectory(tmp_folder)
    let git =<< trim eval END
    git clone {a:repo} {tmp_folder}
    # check if there are any files that gets overwritten
    # mv -i {tmp_folder}/{{.,}}* . 2>/dev/null
    # mv -i {tmp_folder}/* {tmp_folder}/.[!.]* . 2>/dev/null
    shopt -s dotglob nullglob
    mv -i {tmp_folder}/* .
    rm -r {tmp_folder}
END
    let output=system(join(git, "\n"))
    echo output
  endif
endfunction
command! -range -nargs=* GithubIntegrateProject <line1>,<line2>:call GithubIntegrateProject(<f-args>)

if !exists('g:github_user') | let g:github_user='your_username' | endif
if !exists('g:github_email') | let g:github_email='your_email' | endif
if !exists('g:github_pat') | let g:github_pat='{pat_TOKEN}' | endif
if !exists('g:github_ghp') | let g:github_ghp='{ghp_TOKEN}' | endif
command! -range -nargs=0 GithubPush <line1>,<line2>:call GithubPush()
function! GithubPush()
  let $github_user=g:github_user
  let $github_email=g:github_email
  let $github_pat=g:github_pat
  !github_feed() {
  \ username=$1;
  \ email=$2;
  \ pat=$3;
  \ git config --global user.name "$1";
  \ git config --global user.email "$2";
  \ git config --global credential.helper cache;
  \ echo "protocol=https" > /tmp/git-credentials;
  \ echo "host=github.com" >> /tmp/git-credentials;
  \ echo "username=$username" >> /tmp/git-credentials;
  \ echo "email=$email" >> /tmp/git-credentials;
  \ echo "password=$pat" >> /tmp/git-credentials;
  \ git credential approve < /tmp/git-credentials;
  \ };
  \ github_unfeed() {
  \   rm /tmp/git-credentials;
  \ };
  \ git config '--global' core.autocrlf false;
  \ github_feed $github_user $github_email $github_pat;
  \ git push origin main;
  \ github_unfeed;
  \ git config '--global' '--unset-all' core.autocrlf;
endfunction

function! GithubCreateProject(...)
  let $name=a:000[0]
  let $desc=join(a:000[1:], " ")
  let $github_ghp=g:github_ghp
  let command =<< eval trim EOF
  curl -s -H "Authorization: Bearer {$github_ghp}"
   -H "Accept: application/vnd.github+json"
   -H "X-GitHub-Api-Version: 2022-11-28"
   https://api.github.com/user
   | grep node_id | cut -d'"' -f4
EOF
  " extract node_id
  " echo command
  let node_id = trim(system(join(command,' ')))
  " echo node_id
  let vars = {
  \  "github_ghp": $github_ghp,
  \   "node_id": node_id,
  \   "name": $name,
  \   "desc": $desc
  \ }
  "   let command =<< trim EOF
  "   curl -X POST
  "     -H "Authorization: Bearer {$github_ghp}"
  "     -H "Content-Type: application/json"
  "     -d '{ "query": "mutation {
  "     createProjectV2(input: {ownerId: \"{$node_id}\", title: \"{$name}\"})
  "     { projectV2 { id number title url } }
  "     }"}'
  "     https://api.github.com/graphql
  " EOF
  let command =<< trim EOF
curl -X POST \
  -H "Authorization: Bearer {$github_ghp}"
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  -d '{
    "name": "{$name}",
    "description": "{$desc}",
    "private": false,
    "auto_init": true,
    "license_template": "mit"
  }' \
  https://api.github.com/user/repos
EOF
let create_command=join(command, ' ')
for [key, val] in items(vars)
  let create_command = substitute(create_command, '{$'..key..'}', val, 'g')
endfor
  " echo create_command
  let output = system(create_command)
  echo output
  " Deprecated REST API
  " !curl -X POST
  " \  -H "Authorization: Bearer $github_ghp"
  " \  -H "Accept: application/vnd.github+json"
  " \  -H "X-GitHub-Api-Version: 2022-11-28"
  " \  -H "Content-Type: application/json"
  " \  -d '{
  " \    "name": "$name",
  " \    "body": "$desc"
  " \  }'
  " \  https://api.github.com/user/projects
  " !curl -X POST
  " \   -H "Authorization: Bearer $github_ghp"
  " \   -H "Accept: application/vnd.github+json"
  " \   -H "X-GitHub-Api-Version: 2022-11-28"
  " \   -d '{"name": "To Do"}'
  " \   https://api.github.com/projects/PROJECT_ID/columns
  " TODO: Automatic Clone
  " TODO: Set Origin Of Current Folder
  " TODO: Automatic Push Current Directory
endfunction
command! -range -nargs=* GithubCreateProject <line1>,<line2>:call GithubCreateProject(<f-args>)

function! QuickYank(args='', flags='') range
  let vs=VS()
  if a:args=='init'
    call setreg('a', '')
  elseif a:args=='paste'
    let reg=split(getreg('A'), '\%x00')
    call appendbufline(bufnr(), line('.'), reg)
    return
  endif
  call setreg('A', vs)
  let reg=getreg('A')
  call RS()
endfunction

function! EnsureEnvironment()
  if !exists("g:b_environment_set")
    let g:b_environment_set=1
    echo 'Dear User,'
    echo ' '
    echo '   This Will Install All Nessecary Files'
    echo '   bash | wget https://github.com/vim-advantages/vim-advantage.sh'
    echo ' '
    echo 'Your Sincerely'
    echo 'Author'
  endif
endfunction

function! AG()
  let p=CWD()
  :Ag
  call CD(p)
endfunction

" :echo split(&runtimepath, ',')[0]

function! SetEnvironment(user_dir='~', main_repo='', source_dir='', bashrc='~/.bashrc')
  let g:main_repo=a:main_repo
  let g:system_folders='/'
  let g:user_dir=a:user_dir
  let g:source_dir=a:source_dir
  let g:bashrc = a:bashrc
  let g:bashrc_source = "source ".g:bashrc
  let g:vimrc = "~/.vimrc"
  " let g:vim = "~/.vim/plugged/vim-advantages"
  let g:vim = $VIMRUNTIME
  let g:vim_advantages = split(&runtimepath, ",")[0]..'/plugged/vim-advantages/autoload/vim-advantages'
  let g:b_environment_set=1
endfunction
" call EnsureEnvironment()
call SetEnvironment()
let runtimepath=split(&runtimepath, ",")[0]
let g:vim_advantages=runtimepath..'/plugged/vim-advantages/autoload/vim-advantages'
let g:vim_advantages=runtimepath..'/plugged/vim-advantages/src'
let g:vim_advantages=runtimepath..'/plugged/vim-advantages/src'
let mapleader=","
exec 'source '.g:vim_advantages.'/Commands.vim'
exec 'source '.g:vim_advantages.'/Utilize.vim'
exec 'source '.g:vim_advantages.'/Map.vim'
let unreleased=g:vim_advantages.'/Functions.vim.unreleased'
try | if filereadable(unreleased) | exec 'source '..unreleased | endif | endtry

" General Variables
if !exists("g:__pattern") | let g:__pattern={} | endif
if !exists("g:allowChan") | let allowChan=0 | endif
if !empty("g:target") | let target="release" | endif
if !exists('g:date') | let g:date='~0' | endif
if !exists('g:vertical') | let g:vertical=1 | endif
if !exists("focus") | let focus=0 | endif
let g:wholepath=0
let term="bash"
let debugexec=1
let debugvars=0
let RunCommandsPrefix="./nvim.studio"
let lastRunCommand="run.sh"
let commands=[]
let old_fkeys=[ "<F1>", "<F2>", "<F3>", "<F4>", "<F5>", "<F6>", "<F7>", "<F8>", "<F9>", "<F10>", "<F11>", "<F12>", "<F13>", "<F14>", "<F15>", "<F16>", "<F17>", "<F18>", "<F19>", "<F20>", "<F21>", "<F22>", "<F23>", "<F24>", "<F25>", "<F26>", "<F27>", "<F28>", "<F29>", "<F30>", "<F31>", "<F32>", "<F33>", "<F34>", "<F35>", "<F36>", "<F37>", "<F38>", "<F39>", "<F40>", "<F41>", "<F42>", "<F43>", "<F44>", "<F45>", "<F46>", "<F47>", "<F48>", "<F49>", "<F50>", "<F51>", "<F52>", "<F53>", "<F54>", "<F55>", "<F56>", "<F57>", "<F58>", "<F59>", "<F60>", "<F61>", "<F62>", "<F63>", "<F64>", "<F65>", "<F66>", "<F67>", "<F68>", "<F69>", "<F70>", "<F71>", "<F72>", ]
let s:comment_map = {    "c": '\/\/',   "cpp": '\/\/',   "go": '\/\/',   "java": '\/\/',   "javascript": '\/\/',   "lua": '--',   "scala": '\/\/',   "php": '\/\/',   "python": '#',   "ruby": '#',   "rust": '\/\/',   "sh": '#',   "desktop": '#',   "fstab": '#',   "conf": '#',   "profile": '#',   "bashrc": '#',   "bash_profile": '#',   "mail": '>',   "eml": '>',   "bat": 'REM',   "ahk": ';',   "vim": '"',   "tex": '%', }
let new_fkeys=[ "<F1>", "<F2>", "<F3>", "<F4>", "<F5>", "<F6>", "<F7>", "<F8>", "<F9>", "<F10>", "<F11>", "<F12>", "<S-F1>", "<S-F2>", "<S-F3>", "<S-F4>", "<S-F5>", "<S-F6>", "<S-F7>", "<S-F8>", "<S-F9>", "<S-F10>", "<S-F11>", "<S-F12>", "<C-F1>", "<C-F2>", "<C-F3>", "<C-F4>", "<C-F5>", "<C-F6>", "<C-F7>", "<C-F8>", "<C-F9>", "<C-F10>", "<C-F11>", "<C-F12>", "<C-S-F1>", "<C-S-F2>", "<C-S-F3>", "<C-S-F4>", "<C-S-F5>", "<C-S-F6>", "<C-S-F7>", "<C-S-F8>", "<C-S-F9>", "<C-S-F10>", "<C-S-F11>", "<C-S-F12>", "<M-F1>", "<M-F2>", "<M-F3>", "<M-F4>", "<M-F5>", "<M-F6>", "<M-F7>", "<M-F8>", "<M-F9>", "<M-F10>", "<M-F11>", "<M-F12>", "<M-S-F1>", "<M-S-F2>", "<M-S-F3>", "<M-S-F4>", "<M-S-F5>", "<M-S-F6>", "<M-S-F7>", "<M-S-F8>", "<M-S-F9>", "<M-S-F10>", "<M-S-F11>", "<M-S-F12>", ]
let _toggle={}
let toggleHistory=[]
let g:WindowChanged=0
let __pressedKey=""
let __pressedControl=""
let g:FileFinder_verbose=1
let f1 = [ g:vim_advantages."/Functions.vim", g:main_repo."/.bashrc"]
let projects=[ g:source_dir, g:main_repo ]
let g:executor_list={    "executor_list": {        "bash": "bash",        "bash external": "bash",        "python3": "python3",        "python3 external": "python3",    },    "machines_settings": g:vim.."/machines.settings"}
let g:RecursiveCounter=0
let g:clipboard_last=""
let g:clipboard_poll=""
let vlcb = 0
let vlce = 0
let s:wrapenabled = 0
let g:firstSearchOpenFile=1
let tFp=expand('%:p')
let g:tp=expand('%:h')
let g:user=system("whoami")
let g:user=substitute(g:user, "\n", '', '')
let g:bashset_save=["set | sed -E '/^_.*\(\)/,/^}$/d' | sed -E '/^(BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID)=/d' > "..g:source_dir.."/.bashset"]
let g:bashset_source=[g:bashrc_source.."; source "..g:source_dir..".bashset;"]
let g:bashset_restore=["cp "..g:source_dir.."/.bashset.1 > "..g:source_dir.."/.bashset"]
let g:pb=[]
let g:pe=[]
let x=[ "a", "b",  "a", "a", "b",  "a", "a", "b",  "a", "b" ]
let _PreviousCurrentFunction=""
let _CurrentFunction=""
let bufferNumber=-1
if !exists("MCommands") | let MCommands=[] | endif
if !exists("g:autosave_timer") | endif
if !empty("g:exec_type") | let exec_type=0 | endif
if !exists("g:modechanged") | let modechanged="Normal" | endif
let exec_types=[ "Default", "Vim", "Bash", "Python", "Rust" ]

exec 'source '.g:vim_advantages.'/Statusline.vim'
" exec 'source '.g:vim_advantages.'/Utilize.vim'
exec 'source '.g:vim_advantages.'/TextActions.vim'
exec 'source '.g:vim_advantages.'/Autocommands.vim'
syntax on
set tabpagemax=50
" set tabstop=2
" filetype on
" set nu
" set ruler
" set mouse=a
" set list
" set number
" set expandtab
" set autoindent
" set softtabstop=2
" set shiftwidth=2
" set tabstop=2
" "Enable mouse click for nvim
" set mouse=a
" "Fix cursor replacement after closing nvim
" set guicursor=
" "Shift + Tab does inverse tab
" inoremap <S-Tab> <C-d>
" set whichwrap+=<,>,[,]

" TODO avoid overlapping
function! PathCompletion()
  " Avoid These In A Function Call?
  " ---> Compact WILDMENU --: set wildmode=longest:list,full
  " ---> Compact WILDMENU --: set wildmode=longest:full,full
  " ---> Compact WILDMENU --: set wildignore=*.o,*.pyc,*/.git/*,*/node_modules/*
  " ---> Compact WILDMENU --: set completeopt=menuone,preview
  set wildmenu
  set wildoptions=pum
  set wildmode=longest,full
  set wildignorecase
  " set wildmode=
  " set wildignore=
  " set suffixes=
  " set suffixes-=@
  inoremap <silent> <expr> / pumvisible() ? "\<C-r>=<SID>avoid_double_slash()<CR>" : "/\<C-x>\<C-f>"
  inoremap <silent> <expr> <Space> pumvisible() ? "\<C-x>\<C-f>" : " "
  function! s:avoid_double_slash() abort
    if getline('.')[col('.')-2] ==# '/'
      return ''
    endif
    return "/\<C-x>\<C-f>"
  endfunction
  " lacks integrity
  function! LastPath()
    let last_path=""
    let line=getline('.')
    let last_slash=stridx(line,'/')
    if last_slash==-1
      let last_path=line
    else
      let last_path=line[last_slash :]
    endif
    return last_path
  endfunction
  function! IsLastPath()
    return 1
  endfunction
  inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : IsLastPath() ? "\<C-x>\<C-f>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <CR>    pumvisible() ? "\<C-y>\<C-r>=<SID>my_path_complete()<CR>" : "\<CR>\<C-r>=<SID>my_path_complete()<CR>"
  inoremap <expr> <C-e>   pumvisible() ? "\<C-e>" : "\<C-e>"
  function! s:my_path_complete() abort
    if getline('.')[col('.')-2] ==# '/'
      return "\<C-x>\<C-f>"
    endif
    return "\<C-c>"
  endfunction
endfunction
" call PathCompletion()
" PathCompletion Built In
set wildmenu

set noswapfile
set verbose=0 " 0-9?
set encoding=utf-8
set fileencoding=utf-8
set termencoding=
set ttyfast
filetype on
filetype indent on
filetype plugin indent on
filetype plugin indent on
syntax on
syntax enable
set nocompatible
set incsearch
" consider if this makes sense
set ignorecase
set smartcase
set showcmd
set showmode
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set noautoindent
set nosmartindent
set omnifunc=syntaxcomplete#Complete
set nolist
set splitright
set splitbelow
set clipboard=unnamed
set clipboard=unnamedplus
set backspace=indent,eol,start
set mouse=a
set backspace=2
set virtualedit=all
set virtualedit=block
set tags=./tags;,tags
set timeout timeoutlen=700 ttimeoutlen=0
set ttimeoutlen=700
set laststatus=2
" set guioptions+=m  "menu bar
" set guioptions+=T  "toolbar
" set guioptions+=r  "scrollbar
set dir=~/tmp
set textwidth=0
" set completeopt=menu,preview

" Visual Selection

function! VS() range
  call CommandInfo()
  let [l:start_line, l:start_col]=getpos("'<")[1:2]
  let [l:end_line, l:end_col]=getpos("'>")[1:2]

  let [g:start_line, g:start_col]=getpos("'<")[1:2]
  let [g:end_line, g:end_col]=getpos("'>")[1:2]

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
  if IsNormal()
    return [getline('.')]
  elseif IsVisual()
    return _prep_visual()
  elseif IsVisualLine()
    return lines
  elseif IsVisualBlock()
    return _prep_visualblock()
  elseif IsInsert()
    return [getline('.')]
  endif
endfunction

function! RS()
  if IsAnyVisual()
    call setpos("'>", [g:start_line, g:start_col])
    call setpos("'<", [g:end_line, g:end_col])
    norm gv
  endif
endfunction

function! CommandInfo(flag='')
  let g:CI=[mode(0), mode(1), visualmode(1), a:flag=='c'?1:0, a:flag=='t'?1:0]
endfunction

function! IsTerminalInsert()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return terminalinsert && modee=="nt"
endfunction

function! IsTerminalNormal()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return !IsAnyVisual() && !terminalinsert && modee=="nt"
endfunction

function! IsTerminalVisual()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return !terminalinsert && modee=="nt"
endfunction

function! IsNormal()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return !IsAnyVisual() && modee=="n" || IsTerminalNormal()
endfunction

function! IsAnyVisual()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual=~#"[vV]"
endfunction

function! IsVisual()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual==#"v"
endfunction

function! IsVisualLine()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual==#"V"
endfunction

function! IsVisualBlock()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return visual!="" && visual==""
endfunction

function! IsInsert()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return modee=~?".*i.*"||IsTerminalInsert()
endfunction

function! IsCommand()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return command
endfunction

function! IsTerminal()
  let [mode, modee, visual, command, terminalinsert] = g:CI
  return modee =~?".*t"
endfunction

" Build

function! BuildPath(a, b)
  if a:a=~#".*/$"
    return a:a..a:b
  else
    return a:a.'/'.a:b
  endif
endfunction

function! RunThis()
  " call Open("l", "terminal", "new")<cr>
  call SendCustomCommandToTerm("l", [ './build/'..expand('%:t:r') ])
endfunction

function! CTagsProject()
  exec "!ctags -R --exclude=.git--exclude=vendor --exclude=node_modules --exclude=db --exclude=log "..CWD()
endfunction

function! BuildProject()
  exec "!gcc -o "
        \ CWD()."/build/".expand('%:t:r')
        \ " "
        \ expand('%')
endfunction

function! CTags()
  let filetype=expand('%:e')
  let map={
        \ 'cpp': "C++",
        \ 'html': "HTML",
        \ 'htm': "HTML",
        \ 'haml': "Haml",
        \ 'sass': "Sass",
        \ 'js': "Javascript",
        \ 'vim': "Vim",
        \ 'py': "Python",
        \ 'rs': "Rust",
        \ 'sh': "+Sh",
        \ }
  function! GetLanguages() closure
    let lang=GetDictValueCaseInsensitive(map, filetype)
    return '--languages='..lang
  endfunction
  echo 'ctags -R '..CWD()
  let x=systemlist('ctags -R '..CWD())
endfunction

function! BuildThis()
  exec "!gcc -o "
        \ expand('%:r')
        \ " "
        \ expand('%:p')
endfunction

" Git Integration

function! GetBranch()
  if exists("b:branch") && strlen(b:branch)<20
    return b:branch
  endif
  return "-"
endfunction

" Project Manager

function! JumpFile(path)
  let path=a:path
  let node = input('Open File:  ['..path..']  ', path, 'file')
  call _openfile_andCD(node)
  return
  if isdirectory(node)
    let dir=node
    " maybe take the next two lines out
    " exec "e "..file
    " return
  endif
  if filereadable(node)
    let file=node
    let parent=GetParentDir(file)
    if isdirectory(parent)
    endif
      exec "e "..file
      return
  else
    let unreadable=node
    let parent=GetParentDir(unreadable)
    if isdirectory(parent)
    endif
      exec "e "..unreadable
      return
  endif
endfunction

function! JumpProject()
  let path=CWD()
  let dir = input('Open Project:  ['..path..']  ', path, 'file')
  if isdirectory(dir)
    " call SetProject(dir)
  endif
endfunction

function! JumpProjectIn()
  call JumpProject()
endfunction

function! JumpProjectSetProjectOrigin(origin)
  call SetProjectOrigin(a:origin)
endfunction

function! JumpProjectBackup()
  let haystack=GetCWDOrigin()
  let needle=CWD()
  " update the project origin, when the needle path does differ at some point
  if stridx(haystack, needle) == -1
    call JumpProjectSetProjectOrigin(needle)
  endif
endfunction

function! JumpProjectUp()
  let path=CWD()
  " call SetProject(GetParentDir(path))
  call Statusline()
  call JumpProjectBackup()
endfunction

function! JumpProjectR()
  let a=split(CWD(), "/")
  let b=split(GetCWDOrigin(), "/")
  let la=len(a)
  let lb=len(b)
  if la<lb
    let p=BuildPath(CWD(), b[la])
    " call SetProject(p)
  endif
endfunction

function! JumpProjectDump()
  echo CWD()
  echo GetCWDOrigin()
endfunction

function! GetParentDir(path)
    let l:parent = fnamemodify(a:path, ':h')
    return l:parent
endfunction

function! Currentmain_repoRegister()
  if exists("w:main_repo")
    return 'window'
  " elseif exists("b:main_repo")
  "   return 'buffer'
  " elseif exists("t:main_repo")
  "   return 'tab'
  " elseif exists("g:main_repo")
  "   return 'global'
  endif
  return "/"
endfunction

function! GetCWD_Statusline()
  if Currentmain_repoRegister()[0] =~ "[wbgt]"
    " let x=Currentmain_repoRegister()[0]
    " let x.=" "..GetCWD_short()
    let x=GetCWD_short()
    return x
  else
    return '/'
  endif
endfunction

function! GetCWD_short(register="")
  return PathCharwise(CWD())
endfunction

function! GetDir(register="")
  return expand('%:p:h')
endfunction

function! SetProjectOrigin(path)
  let w:main_repo_origin=a:path
endfunction

function! GetCWDOrigin()
  if exists("w:main_repo_origin")
    return w:main_repo_origin
  else
    let w:main_repo_origin=CWD()
    return w:main_repo_origin
    " return '/'
  endif
endfunction

" function SetProject(path)
"   " if a:register[0] =~? "[w]"
"   " endif
"   let w:main_repo=a:path
"   let w:lastmain_repo=a:path
"   call JumpProjectBackup()
"   " if a:register == "buffer"
"   "   let b:main_repo=a:path
"   " endif
"   " if a:register == "tab"
"   "   let t:main_repo=a:path
"   " endif
"   " if a:register == "global"
"   "   let g:main_repo=a:path
"   " endif
"   call Statusline()
"   exec "cd "..w:main_repo
" endfunction

function! Basename(path)
  return ""
endfunction

function! POINTER()
  return w:pointer
endfunction

" Eating Lobster 🦞
function! ABSOLUTE()
  let r=expand('%:p')
  if r!=""
    return r
  else
    return getcwd()
  endif
endfunction

function! ABSOLUTE_DIR()
  if filereadable(ABSOLUTE())
    return GetParentDir(ABSOLUTE())
  elseif isdirectory(ABSOLUTE())
    return ABSOLUTE()
  endif
endfunction

function! RELATIVE_DIR()
  " KEEP IT POINTER, OTHERWISE FILE IS NOT READABLE ANYWAYS
  if filereadable(POINTER())
    return GetParentDir(RELATIVE())
  else
    return RELATIVE()
  endif
endfunction

function! RELATIVE()
  let g:cwd=CWD()
  let g:y=len(split(CWD(),'/'))
  let x=join(split(POINTER(),'/')[g:y:-1],'/')
  return x
endfunction

" echo POINTER()
" echo $cwd $y x POINTER()
" return substitute(POINTER(), $cwd, "", "")

" function RELATIVE()
"     " if isdirectory(a:path)
"     "   let w:relative=expand('%')
"     " elseif filereadable(a:path)
"     "   let w:relative=expand('%')
"     " else
"     "   let w:relative=RELATIVE()
"     " endif
"   " echo CWD()
"   " echo RELATIVE()
"
"   " let path=w:relative
"
"   if isdirectory(path)
"     " let path=expand('%')
"     return join(split(path,'/'),'/')
"   elseif filereadable(path)
"     " let path=expand('%')
"     return join(split(path,'/')[0:-1],'/')
"   else
"     " let path=w:relative
"     let aa=split(CWD(),'/')
"     let $a=len(aa)
"     let bb=split(w:relative,'/')
"     let $b=len(bb)
"     return join(split(CWD(),'/')[$a:-1],'/')
"     " join(split(CWD(),'/')[-1],'/')..
"     " return w:relative
"   endif
" endfunction

function! GetBasename()
  return expand('%:t')
endfunction

function! GetFilenameNoExt()
  return substitute(GetBasename(), ".rs", "", "")
endfunction

function! GetPath_Statusline()
  if g:wholepath==0
    return PathCharwise(expand('%:p'))
  elseif g:wholepath==1
    return expand('%:p')
  elseif g:wholepath==2
    return expand('%:t')
  endif
endfunction

function! GetPath()
  return expand('%:p:h')
endfunction

function! GetDirname()
  return expand('%:p:h')
endfunction

function! GetDirnameFromFile(path)
  let x=system("dirname ".a:path)
  return x
endfunction

function! GetFileName()
  return expand('%')
endfunction

function! GetLastsaved()
  if !exists("b:lastsaved")
    let b:lastsaved=0
  else
    return b:lastsaved
  endif
endfunction

function! IsPossibileDirectory(path)
  if a:path =~# ".*/\ *$"
    return 1
  endif
  return 0
endfunction

function! s:stepFile_completefunc(step)
  let path=expand('%:h')
  let l=systemlist('find '.path.' -maxdepth 1 -type f')
  let file=expand('%:t')
  let g:matches=l
endfunction

function! KeyToArray(key)
  " echo len(a:key)
  let out=[]
  for a in a:key
    call extend(out,[char2nr(a)])
  endfor
  return out
endfunction

" if !exists('*s:close_often')
function! s:close_often(winid, key) abort
  let k = KeyToArray(a:key)

  let ct = { '<C-Tab>': [ 128, 252, 4, 9 ],
        \ '<C-S-Tab>': [ 128, 252, 4, 128, 107, 66 ],
        \ '<C-p>': [ 16 ],
        \ '<S-Tab>': [ 128, 107, 66 ],
        \ '<Tab>': [ 9 ],
        \ '<Up>': [ 128, 107, 117 ],
        \ '<Down>': [ 128, 107, 100 ],
        \ '<Enter>': [ 13 ],
        \ '<C-,>': [ 128, 252, 4, 44 ],
        \ '<C-.>': [ 128, 252, 4, 46 ],
        \ 'j': [ 106 ],
        \ 'k': [ 107 ],
        \ }
  " if a:key ==# "<C-Tab>" || a:key ==# "<80><fc>"
  " if a:key ==# "<C-Tab>" || a:key ==# "\<80>\<fc>\<04>"
  if k == ct['<C-Tab>'] || k == ct['<Tab>']
    call s:stepFile_index(1)
    " call popup_close(a:winid)
    " call NextFile_popup(1)
    call s:stepFile_open()
    call win_execute(a:winid, printf('call cursor(%d,1)', g:temp_files_index+1))
    return 1
  " elseif a:key ==# "<C-S-Tab>" || a:key ==# "\<80>\<fc>\\<80>kB"
  elseif k == ct['<Down>'] || k == ct['j']
    call s:stepFile_index(1)
    " call popup_close(a:winid)
    " call NextFile_popup(0)
    " call popup_setoptions(a:winid, #{line: 'cursor-1'})
    call win_execute(a:winid, printf('call cursor(%d,1)', g:temp_files_index+1))
    return 1
  elseif k == ct['<C-S-Tab>'] || k == ct['<S-Tab>']
      call s:stepFile_index(-1)
      " call popup_close(a:winid)
      " call PreviousFile_popup(1)
      call s:stepFile_open()
      call win_execute(a:winid, printf('call cursor(%d,1)', g:temp_files_index+1))
    return 1
  elseif k == ct['<Up>'] || k == ct['k']
    call s:stepFile_index(-1)
    " call popup_close(a:winid)
    " call PreviousFile_popup(0)
    " call popup_setoptions(a:winid, #{firstline: 'cursor+2'})
    call win_execute(a:winid, printf('call cursor(%d,1)', g:temp_files_index+1))
    return 1
  " else
  "   call popup_close(a:winid)
  "   return 1
  " elseif index(['j','<Down>'], a:key)>=0
  "   call popup_close(a:winid)
  "   call NextFile_popup()
  "   return 0
  " elseif index(['k','<Up>'], a:key)>=0
  "   call popup_close(a:winid)
  "   call PreviousFile_popup()
  "   return 0
  " "   return 0
  elseif k == ct['<C-,>']
    " call CD('..')
    " exec bufnr('$') bufdo CD(WFilePrev())
    " call CD(g:stepFile_cwd)
    " call CD(WFilePrev())
    " let g:stepFile_cwd=CWD()
    " exec 'cd '..getcwd()
    " echo getcwd()
    " call chdir('..')
    " echo CWD() bufnr()
    " return 1
    " call CD(WFilePrev())

    " call CD(GetParentDir(g:path))
    " exec 'cd '..g:path
    " call CD(WFilePrev())
    " call chdir(s:path..'/..')
    call s:stepFile_repopup(a:winid, WFilePrev())
    return 1
  elseif k == ct['<C-.>']
    " call CD(WFileNext())
    " let entry=g:temp_files_list[g:temp_files_index]
    " if isdirectory(entry)
    " call CD(entry)
    call s:stepFile_repopup(a:winid, WFileNext())
    return 1
    " endif
  elseif k == ct['<C-p>']
    call popup_close(a:winid)
    call OpenFileFZFProject()
  elseif k == ct['<Enter>']
    let entry=g:temp_files_list[g:temp_files_index]
    if isdirectory(entry)
      call s:stepFile_repopup(a:winid, entry)
      return 1
    elseif filereadable(entry)
      exec "e! "..entry
      unlet g:temp_files_list
    endif
    call popup_close(a:winid)
    " let entry=g:temp_files_list[g:temp_files_index]
    " exec "e! "..entry
  else
    echom a:key
    echom k
    return 0
  endif

  call popup_close(a:winid)
  return 0
  return 1 " Eat All

endfunction
" endif

function! s:stepFile_index(step)
  if !exists('g:temp_files_list')
    call s:stepFile_init_index()
  endif
  let length=len(g:temp_files_list)
  let length=Length(g:temp_files_list)
  " let index=indexof(l, { i,v-> v:val =~ file })
  let g:temp_files_index=g:temp_files_index+(a:step)
  let g:temp_files_index=Mod(g:temp_files_index, length)
endfunction

function! s:stepFile_init_index()
  let g:temp_files_list=readdir('.')
  let file=expand('%:t')
  let g:temp_files_index=index(g:temp_files_list, "./".file)
endfunction

function! s:stepFile_repopup(winid, path='')
  call popup_close(a:winid)
  if a:path=='..'
    call CD(WFilePrev())
    call s:stepFile_init_index()
  elseif a:path==''
  else
    call CD(a:path)
    call s:stepFile_init_index()
  endif
  call StepFile_popup(0, 0)
endfunction


function! s:stepFile_open(winid=-1)
  let entry=g:temp_files_list[g:temp_files_index]
  if isdirectory(entry)
    " echo "is dir"
    " call CD(entry)
    " call s:stepFile_popup_repopup(a:winid)
  elseif filereadable(entry)
    exec "e! "..entry
  endif
endfunction

function! s:stepFile_popup(step=0, performFileOpening=0)
  " let x=0
  " for i in l
  "   let l[x]=path.."/"..i
  "   let x=x+1
  " endfor
  " if !exists(g:temp_files_index)
  "   let g:temp_files_index=0
  " endif

  call s:stepFile_index(a:step)

  " let g:stepFile_cwd=CWD()

  if a:performFileOpening
    call s:stepFile_open()
  endif

  let winid=popup_create(g:temp_files_list, #{
        \ pos: 'center',
        \ title: '  '.CWD().' ',
        \ zindex: 200,
        \ maxheight: 20,
        \ minwidth: 40,
        \ maxwidth: 80,
        \ border: [1,1,1,1],
        \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
        \ padding: [0,1,0,1],
        \ cursorline: 1,
        \ filter: function('s:close_often'),
        \ mapping: 0
        \ })
        " \ filtermode: 'n',
  " if index>=0 && index<=len(l)
  call win_execute(winid, printf('call cursor(%d,1)', g:temp_files_index+1))
  " endif
  " optional
  " call win_execute(winid, 'setlocal cursorlineopt=line')
endfunction

" function ListDirFiles(findstart, base) abort
"   if a:findstart
"     let line=getline('.')
"     let start=col('.')-1
"     while start > 0 && line[start -1 ] =~ '\f'
"       let start -= 1
"     endwhile
"     return start
"   else
"     let matches = []
"     for fname in s:files
"       if fname =~? '^' .. escape(a:base, '\')
"         call add(matches, fname)
"       endif
"     endfor
"     let cur=expand('%:t')
"     call sort(matches, {a,b -> a == cur ? -1 : b == cur ? 1 : a > b})
"     return matches
"   endif
" endfunction

function! MyCustomComplete(findstart, base)
  if a:findstart
  else
    return filter(copy(g:matches), 'v:val =~ "^'. a:base .'"')
  endif
endfunction

function! ShowMyCustomComplete()
  " let col=col('.') -1
  " call complete(col, g:matches)
  call feedkeys("i\<C-x>\<C-u>\<Esc>", 'in')
  " function ShowListNow()
  "   let col=col('.') -1
  "   call complete(col, g:matches)
  " endfunction
  " call feedkeys('i", 'n')
  " call feedkeys('\<C-r>=ShowListNow()\<CR>", 'n')
endfunction

" command! -nargs=* -complete=customlist,MyCmdComplete MyCmd echo "done"
" function MyCmdComplete(ArgLead, CmdLine, CursorPos)
"   return ['A', 'B', 'C']
" endfunction

function! s:stepFile(step)
  let path=expand('%:h')
  let l=systemlist('find '.path.' -maxdepth 1 -type f')
  let file=expand('%:t')
  " echo file
  let x=0
  " for i in l
  "   let l[x]=path.."/"..i
  "   let x=x+1
  " endfor
  let length=len(l)
  let length=Length(l)
  " let index=indexof(l, { i,v-> v:val =~ file })
  let index=index(l, "./".file)
  let index=index+(a:step)
  let index=Mod(index, length)
  exec "e! "..l[index]
  " echo file
  " echo path
  " echo newindex length
  " echo l
endfunction

function! NextFile_completefunc()
  setlocal completefunc=MyCustomComplete
  call s:stepFile_completefunc(1)
  call ShowMyCustomComplete()
endfunction

function! PreviousFile_completefunc()
  setlocal completefunc=MyCustomComplete
  call s:stepFile_completefunc(-1)
  call ShowMyCustomComplete()
endfunction

" function InitFile_popup()
"   " Todo
"   " Carefully
"   " Critical
"   " let path=expand('%:h')
"   let g:path=CWD()
"   " let g:temp_files_list=systemlist('find '.path.' -maxdepth 1 -type f')
"   " if !exists('g:temp_files_list')
"   "   " let g:temp_files_list=systemlist('find '.path.' -maxdepth 1')
"   "   " let files=readdir('.', 'v:val !~# "^\."')
"   "   let items=readdir('.', {v->{
"   "         \ 'name': v,
"   "         \ 'dir': isdirecotry(v),
"   "         \ 'link': gettype(v) == 'link'
"   "         \ }})
"   "   let items=readdir('.')
"   "   " let g:temp_files_list=sort(items, {a,b -> a.dir ? -1 : b.dir ? 1 : a.name > # b.name})
"   "   let g:temp_files_list=items
"   " endif
" endfunction

function! StepFile_popup(step, performFileOpening)
  call s:stepFile_popup(a:step, a:performFileOpening)
endfunction

function! NextFile()
  call s:stepFile(1)
endfunction

function! PreviousFile()
  call s:stepFile(-1)
endfunction

function! MkDir(path)
    " silent exec "!mkdir -p "..path
    call mkdir(a:path, 'p')
endfunction

function! _newfile_andCD(path)
  call _openfile_andCD(a:path)
endfunction

function! _openfile_andCD(path)
  let path=a:path
  if exists("path") && filereadable(path)
    call _openfile(path)
    " call CD(GetParentDir(path))
  elseif exists("path") && isdirectory(path)
    call MkDir(path)
    call CD(path)
    exec "e "..path
  elseif exists("path") && IsPossibileDirectory(path)
    call MkDir(path)
    call CD(path)
    exec "e "..path
  else
    call MkDir(GetParentDir(path))
    " call CD(GetParentDir(path))
    exec "hide e "..path
  endif
endfunction

function! _openfile_orCD(path)
  let path=a:path
  if exists("path") && filereadable(path)
    call _openfile(path)
  elseif exists("path") && isdirectory(path)
    call CD(path)
  else
    call MkDir(GetParentDir(path))
    call CD(GetParentDir(path))
    exec "e "..path
  endif
endfunction

function! _openfile(file)
  let file=a:file
  if exists("file") && filereadable(file)
    exec "e "..file
  endif
endfunction

function! Rewindmain_repo()
  let temp=w:main_repo
  call CD(w:lastmain_repo)
  let w:lastmain_repo=temp
endfunction

" function CD(path)
"   if exists('w:main_repo')
"     let w:lastmain_repo=w:main_repo
"   else
"     let w:lastmain_repo='/'
"   endif
"   let path=a:path
"   if exists("path") && isdirectory(path)
"     call SetProject(path)
"   else
"     echo "no file selected"
"   endif
" endfunction

function! OpenFileSetProject_callback(id, code, register)
  let path=GetTempfileLine()
  call CD(GetParentDir(path))
  unlet b:popup_tempfile
  " call _openfile(path)
  call _openfile_andCD(path)
endfunction

function! OpenFile_callback(id, code, register)
  let path=GetTempfileLine()
  unlet b:popup_tempfile
  if path=='0' || path==0
    " echo path"exit"
    if filereadable(path)
      call _openfile_andCD(path)
    endif
    return
  else
    call _openfile_andCD(path)
  endif
endfunction

function! MakeDirCurrentCWD()
  let [n, y, x, n, n]=getcurpos()
  " let w:cwd=expand("%:p:h")
  " let w:pointer=expand('%')
  call CD(expand("%:p:h"))
  call SetPointer(expand('%:p'))
  " call SetProject(expand("%:p:h"))
  call cursor(y, x)
endfunction

function! MakeDirCurrent(path)
  let [n, y, x, n, n]=getcurpos()
  call CD(a:path)
  call SetPointer(a:path)
  call cursor(y, x)
endfunction

" function MakeDirCurrentProject()
"   let [n, y, x, n, n]=getcurpos()
"   " let CWD()=expand("%:p:h")
"   " call SetProject(expand("%:p:h"))
"   call cursor(y, x)
" endfunction

function! SetProject_callback(register, id, code)
  let path=GetTempfileLine()
  call CD(path)
  unlet b:popup_tempfile
endfunction

function! AgFile(title, register, path)
  echo "AG"
endfunction

function! OpenFile(title, register, path)
  if a:register =~ 'window\|buffer\|tab\|global'
    let title=a:title.." ["..a:register.."]"
  else
    let title=a:title
  endif
  let path=a:path
  let type=type(path)
  if type==1
    let paths=[path]
  else
    let paths=path
  endif
  call Find_Popup(
        \ title,
        \ paths,
        \ function('OpenFile_callback', [a:register]),
        \ "file",
        \)
endfunction

function! Changemain_repo(title, register, path)
  if a:register =~ 'window\|buffer\|tab\|global'
    let title="Set ["..a:register[0].."]"
  else
    let title=a:title
  endif
  let path=a:path
  let type=type(path)
  if type==1
    let paths=[path]
  else
    let paths=path
  endif
  call Find_Popup(
        \ title,
        \ paths,
        \ function('SetProject_callback', [a:register]),
        \ "directory",
        \)
endfunction

function! CB_OpenFileInBuffer(m)
  let m = a:m
  if Length(m)==0 | return "" | endif
  if Length(m)>0
    let m=m[0]
    if !empty(m)
      if isdirectory(m)
        call CD(m)
      else
        exec "e ".m
        call CD(GetDirname())
      endif
    endif
  endif
  call Redraw()
endfunction

function! Files(path)
  " echo a:path
  exec ":Files" a:path
  " call Redraw()
endfunction

function! CommandLineFiles(path)
  " echo a:path
  " exec ":Files" a:path
  " call Redraw()
  call JumpFile(a:path..'/')
  call MakeDirCurrent(a:path..'/')
endfunction

function! Redraw()
  redraw!
endfunction

function! CtrlShiftP()
  let m=system('( find / -maxdepth 10 2>/dev/null && find '.g:ftp.' -maxdepth 10 2>/dev/null ) | fzf')
  call Redraw()
  if !empty(m)
    if isdirectory(m)
      call CD(m)
    else
      exec "e ".m
      call CD(GetDirname())
    endif
  endif
endfunction

function! NERDTreeM_Shift(focus)
    try | NERDTreeFind | catch | try | call NERDTreeCWD() | catch | try | NERDTree  | endtry | endtry | endtry
endfunction

function! SelectFolder()
  let m=system('find '..g:user_dir..' -type d -maxdepth 10 2>/dev/null | fzf')
  echo m
endfunction

function! SelectFile()
  let m=system('find '.g:vim.' -maxdepth 7 | fzf')
  exec "e ".m
endfunction

function! GetDirs(path, maxdepth)
  let out=[]
  let j = system("find \"".a:path."\" -maxdepth ".a:maxdepth." -type d")
  for line in filter(split(j, "\n")[1:], "v:val!=''")
    call extend(out,[line])
  endfor
  return out
endfunction

function! GetFiles(path, name, maxdepth)
  let out=[]
  let j=system("find \"".a:path."\" -name \"".a:name."\" -maxdepth ".a:maxdepth." -type f")
  for line in filter(split(j, "\n")[1:], "v:val!=''")
    call extend(out,[line])
  endfor
  return out
endfunction

function! GetFilesAndDirs(path, name, maxdepth)
  let out=[]
  let j=system("find \"".a:path."\" -name \"".a:name."\" -maxdepth ".a:maxdepth)
  for line in filter(split(j, "\n")[1:], "v:val!=''")
    call extend(out,[line])
  endfor
  return out
endfunction

function! SearchOpenFile(...)
  let file=a:000[0]
  " echo file
  " echo a:000
  " echo expand(file)
  " let $v=get(a:,1,0)
  " e $v
  exec "hide e! ".file
  call CD(GetDirname())
endfunction

func! FindFiles(path, pattern, maxdepth)
  let files=[]
  let maxdepth=""
  if a:maxdepth>0
    let maxdepth="-maxdepth ".a:maxdepth
  redir =>j
  silent exec '!find '.a:path.' '.maxdepth.' -type f -name "'.a:pattern.'"'
  redir END
  for line in filter(split(j, "\n")[1:], "v:val!=''")
    call extend(files,[line])
  endfor
  return files
endfunc

function! LineNumberOnOff()
  set number!
  set norelativenumber
endfunction

" function CWD()
"   return getcwd()
"   " try
"   "   let m=systemlist('pwd')
"   "   return m
"   " catch
"   " endtry
" endfunction

function! GitName()
  let b=split(w:git, "/")
  return b[-1]
endfunction

function! GitName_Statusline()
  if w:git==-1
    return ''
  endif
  return '  '..GitName()..' '
endfunction

function! SetProject(dir)
  call system("curl http://localhost:8000/SetProject?project="..a:dir)
endfunction

function! FindGit(path)
  let b=split(a:path, "/")
  for i in range(1,len(b))
    let dir='/'..join(b[:len(b)-i], '/')
    let git=dir..'/.git'
    if isdirectory(git)
      call SetProject(dir)
      return dir
    elseif filereadable(git)
      call SetProject(dir)
      return dir
    endif
  endfor
  let dir = '/'
  if isdirectory(dir..'/.git')
    call SetProject(dir)
    return dir
  endif
  return -1
  " let parent=GetParentDir(a:path)
endfunction

function! CWD_Statusline()
  if w:cwd=='/'
    return '/'
  else
    return w:cwd
  endif
endfunction

function! CWD()
  if !exists("w:cwd")
    call MakeDirCurrentCWD()
  endif
  return w:cwd
endfunction

function! WFilePrev()
  return '..'
endfunction

function! WFileNext()
  let split=split(RELATIVE(),'/')
  let len=len(split)
  if len>0
    let next=split(RELATIVE(),'/')[0]
    return next
  else
    return ''
  endif
endfunction

function! CD(path)
  if isdirectory(a:path)
    silent exec "cd ".a:path
  else
    silent exec "cd ".GetParentDir(a:path)
  endif
  let w:cwd=getcwd()
  let w:git=FindGit(w:cwd)
  " echo "Not A Directory"
endfunction

function! SetPointer(path='')
  if a:path==''
    let p=expand("%:p")
  else
    let p = a:path
  endif
  if p==""
    let w:pointer=CWD()
  else
    let w:pointer=p
  endif
endfunction

function! REFRESH_CWD()
  try
    silent exec "cd ".CWD()
  catch
  endtry
endfunction

function! PathLast(path)
  let parts = split(a:path, '/')
    if len(parts) > 3
      let x = '...'
    endif
  let x = x . '/' . join(parts[-3:], '/')
  return x
endfunction

function! FavoriteFile()
endfunction

function! FavoritePath()
endfunction

function! Favorite()
  let list=systemlist("ls -al")
  call Find_Popup(
        \ "Favorites",
        \ list,
        \ "file",
        \)
endfunction


if !exists("g:shortenpath")
  let shortenpath=0
endif

if !exists("g:shortenpath_file")
  let shortenpath_file=1
endif

function! ToggleShortenPath()
  if g:shortenpath==0
    let g:shortenpath=-1
  else
    let g:shortenpath=0
  endif
  if g:shortenpath_file==1
    let g:shortenpath_file=-1
  else
    let g:shortenpath_file=1
  endif
  call Statusline()
endfunction

function! PathCharwise_All(path, except=0, prependSlash=v:false, appendSlash=v:false)
  let except=a:except
  if filereadable(a:path)
    let except=a:except
  elseif isdirectory(a:path)
    let except=a:except
    let except=0
  endif
  if except==-1
    if a:appendSlash
      return a:path..'/'
    else
      return a:path
    endif
  endif
  let parts=split(a:path,'/')
  let out=''
  if a:path=='/'||a:prependSlash
    let out='/'
  else
    let out=''
  endif
  for i in range(0, len(parts)-1)
    if i>=len(parts)-except
      let out.=parts[i]
    else
      let out.=parts[i][0]
    endif
    if i <= len(parts)-2
      let out.='/'
    endif
    if i==len(parts)-1 && a:appendSlash
      let out.='/'
    endif
  endfor
  return out
endfunction

function! PathCharwise(path, except=0)
    let except=a:except
    let parts = split(a:path, '/')
    if len(parts) <= 3
        if len(parts) > 1
          let x = '/'
        else
          let x = ''
        endif
        return x.join(map(parts[:-2], 'v:val[0]'), '/') . '/' . join(parts[-1:], '/')
    else
        if len(parts) > 3
            let x = '...'
        else
            let x = join(map(parts[:-4], 'v:val[0]'), '/')
        endif
        let x = x . '/' . join(parts[-3:], '/')
        return x
    endif
endfunction

function! SelectCommandPopup(title, list, callback)
  call Execution_Popup(
        \ a:title,
        \ a:list,
        \ a:callback,
        \)
endfunction

function! FZFPopup(title, type, path, callback)
  let path=a:path
  let type=type(path)
  if type==1
    let paths=[path]
  else
    let paths=path
  endif
  " echo type(function('SetProject_callback', ['w']))
  " echo type(a:callback)
  " if function('SetProject_callback', ['w']) == a:callback
  "   echo "TEST Bestandend"
  " endif
  " return
  call Find_Popup(
        \ a:title,
        \ paths,
        \ a:callback,
        \ a:type,
        \)
endfunction

function! OpenFileCommandLineProject()
  call JumpFile(expand("%:h"))
endfunction

function! OpenFileCommandLineSameDir()
  " call JumpFile(CWD())
  call JumpFile(ABSOLUTE_DIR()..'/')
  call MakeDirCurrentCWD()
endfunction

function! OpenFileCommandLineCWD()
  " call JumpFile(CWD())
  call JumpFile(CWD()..'/')
  call MakeDirCurrentCWD()
endfunction

function! OpenFileCommandLineSystem()
  call JumpFile('/')
endfunction

function! OpenFileFZFRepo(backwards=0)
  let Callback=function('OpenFile_callback', ["window"])
  let file=Folder_Repo(a:backwards)
  call FZFPopup("Open file: ", "file", file, Callback)
endfunction

function! OpenFileFZFProject()
  let Callback=function('OpenFile_callback', ["window"])

  call FZFPopup("Open file: ", "file", CWD(), Callback)
endfunction

function! OpenFileFZFSystem()
  let Callback=function('OpenFile_callback', ["window"])
  call FZFPopup("Open file: ", "file", g:system_folders, Callback)
endfunction

function! FindInFileFZFRepo(backwards=0)
  let Callback=function('OpenFile_callback', ["window"])
  if a:backwards==0
    let file=w:git
  elseif a:backwards==1
    let file=FindGit(GetParentDir(w:git))
  elseif a:backwards==2
    let file=FindGit(GetParentDir(FindGit(GetParentDir(w:git))))
  endif
  if file == -1
    " getcwd is not userfriendly
    " consider throwing a message
    let file=getcwd()
    echo "No higher Repo"
    return
  endif
  call FZFPopup("Open file: ", "file", file, Callback)
endfunction

function! FindInFileFZFProject()
  let Callback=function('OpenFile_callback', ["window"])
  call FZFPopup("Open file: ", "file", CWD(), Callback)
  map <S-F3> :call AG()<CR>
  map <C-F3> :GFiles<CR>
endfunction

function! FindInFileFZFSystem()
  let Callback=function('OpenFile_callback', ["window"])
  call FZFPopup("Open file: ", "file", g:system_folders, Callback)
endfunction


function! SetProjectCommandLineProject()
  call JumpProject(CWD())
endfunction

function! SetProjectCommandLineSystem()
  call JumpProject('/')
endfunction

function! SetProjectFZFProject()
  let Callback=function('SetProject_callback', ["window"])
  call FZFPopup("Set Project: ", "directory", CWD(), Callback)
endfunction

function! SetProjectFZFSystem()
  let Callback=function('SetProject_callback', ["window"])
  call FZFPopup("Set Project: ", "directory", [ '/etc' ], Callback)
endfunction

function! SetProjectFZFProjectAndFile()
  let Callback=function('OpenFileSetProject_callback', ["w"])
  call FZFPopup("Set Project And File: ", "file", CWD(), Callback)
endfunction

function! SetProjectFZFSystemAndFile()
  let Callback=function('OpenFileSetProject_callback', ["w"])
  call FZFPopup("Set Project And File: ", "file", '/', Callback)
endfunction

" Window Manager

function! s:_term_nvim(p, commands)
  let chan=getbufvar(a:p, "terminal_job_id")
  let c=extend(a:commands, [""])
  call chansend(chan, c)
endfunction

function! s:_term_vim(p, commands)
  for c in a:commands
    call term_sendkeys(a:p, c)
    call term_sendkeys(a:p, '')
  endfor
endfunction

function! TERM(p, commands)
  if has('nvim')
    call s:_term_nvim(a:p, a:commands)
  else
    call s:_term_vim(a:p, a:commands)
  endif
endfunction

function! ClearTermOnWinLeave(bufnr)
  if bufname('%') == 'Find'
    call timer_start(50, {->execute('bwipeout! '..a:bufnr)})
  endif
endfunction

function! Open(direction, type="buffer", mode="copy", file="")
  let file=""
  " call WinSwapBuf_Prep()
  let projectpath=CWD()
  let previous_bufname = bufname('%')
  let previous_win = winnr('$')
  let h=0 | let j=0 | let k=0 | let l=0
  if a:direction==?"h"
    let h=1
  elseif a:direction==?"l"
    let l=1
  elseif a:direction==?"j"
    let j=1
  elseif a:direction==?"k"
    let k=1
  endif
  if a:type=="buffer"
    let buffer=1
    let terminal=0
  elseif a:type=="terminal"
    let buffer=0
    let terminal=1
  endif
  if terminal
    let arg=g:term
  elseif buffer
    let arg=buffer
  endif
  if h || l
    let vertical=1
  elseif j || k
    let vertical=0
  endif
  let swap=0
  if h || k
    let swap=1
  endif
  let insert=0
  if terminal
    let insert=1
    " let b:termpid=system('echo $$')
  endif
  let post=""
  if vertical && buffer
    let pre="vsplit \|"
  elseif vertical && terminal
   let pre="vertical "
  elseif !vertical && buffer
    let pre="split \|"
  elseif !vertical && terminal
    let pre=""
  endif
  if terminal
    let arg = "terminal"
    let file=g:term
  elseif buffer && exists("file") && file != ""
    let file = a:file
    let file=GetCwordIfReadableFile()
    let arg="e ".file
  elseif buffer
    let arg="enew"
  endif
  exec pre arg file
  exec post
  let win = winnr()
  " exec previous_win "wincmd w"
  " if buffer
  "   let exec=""..arg
  "   exec arg
  " elseif terminal
  "   let exec="terminal"
  "
  "   if a:type=="buffer"
  "   elseif a:type=="terminal"
  "     if has('nvim')
  "       split
  "     endif
  "     exec "terminal" arg
  "   else
  "     execute "split | ".arg
  "   endif
  " endif
  if !HasState()
    call BufferSetup()
  endif
  call SetTerms(b:state.uuid, GetKey())
  let s:callbacks = { 'on_stdout': function('s:OnEvent'), 'on_stderr': function('s:OnEvent'), 'on_exit': function('s:OnEvent') }
  let uuid=NewUUID()
  " if a:direction=~"[HJKL]"
  "   " echo a:direction
  "   exec "wincmd "..a:direction
  " endif
  if a:mode=="file"
    " exec "b ".a:file
  elseif a:mode=="copy"
  elseif a:mode=="new" && a:type != "terminal"
    " enew
  endif
  if terminal && h
    exec "wincmd h"
  elseif h
    exec "wincmd h"
  elseif k
    exec "wincmd k"
  endif
  if swap
    wincmd x
  else
    " exec previous_win"wincmd w"
  endif
  " call WinSwapBuf_Back()
  if !terminal
    call CD(projectpath)
  endif
  if !insert && terminal
    startinsert
  endif
endfunction

function! TabH()
  let nr=tabpagenr()
  let len=tabpagenr('$')
  if nr==1
    tabnew
    0tabmove
  else
    tabprev
  endif
endfunction

function! TabL()
  let nr=tabpagenr()
  let len=tabpagenr('$')
  if len==nr
    tabnew
  else
    tabnext
  endif
endfunction

function! SwapWin(direction)
  let l:current_win=winnr()
  let l:current_buf=winbufnr(l:current_win)
  let l:neighbor_win=winnr(a:direction)
  if l:neighbor_win==l:current_win
    echo "no neighbor"
    return
  endif
  let l:neighbor_buf=winbufnr(l:neighbor_win)
  echo l:current_win l:current_buf l:neighbor_win l:neighbor_buf
  execute l:current_win "windo b" l:neighbor_buf
  execute l:neighbor_win "windo b" l:current_buf
endfunction

function! WinBufSwap_Back()
  let thiswin = winnr()
  let thisbuf = bufnr("%")
  let lastwin = winnr("#")
  let lastbuf = winbufnr(lastwin)
  exec  lastwin . " wincmd w" ."|". "buffer ". thisbuf ."|". thiswin ." wincmd w" ."|". "buffer ". lastbuf
endfunction

function! Cursor_Prep()
  let g:cursorpos=getcurpos()
endfunction

function! Cursor_Back()
  call cursor(g:cursorpos[1], g:cursorpos[2])
endfunction

function! TabSwap_Prep()
  let g:lasttab=tabpagenr()
endfunction

function! TabSwap_Back()
  execute "norm" g:lasttab "gt"
endfunction

function! WinSwap_Prep()
  let g:lastwin= winnr()
endfunction

function! WinSwap_Back()
  exec g:lastwin . " wincmd w"
endfunction

function! WinSwapBuf_Prep()
  let g:lastwin= winnr()
  let g:lastbuf= bufnr()
endfunction

function! WinSwapBuf_Back()
  let g:thiswin= winnr()
  let g:thisbuf= bufnr()
    exec  g:lastwin . " wincmd w" ."|". "buffer ". g:thisbuf ."|". g:thiswin ." wincmd w" ."|". "buffer ". g:lastbuf ."|". g:lastwin . " wincmd w"
endfunction

function! WinFocus_Prep()
  let g:focusUUID=GetUUID()
endfunction

function! WinFocus_Back()
  if GetKeyH() || GetKeyK() || GetKeyJ() || GetKeyL()
    exec GetWinByUUID(g:focusUUID) "wincmd w"
  endif
endfunction

function! WinFocusBack()
  echo winnr("$")
endfunction

function! GetCurrentNeighborActive()
  let active=-1
  return
  if !has_key(g:hideToggles, bufnr())
    let g:hideToggles[bufnr()]={}
  endif
  if has_key(g:hideToggles[bufnr()], GetKey())
    let active= ! g:hideToggles[bufnr()][GetKey()]
    call remove(g:hideToggles[bufnr()], GetKey())
  else
    let active=0
  endif
  call extend(g:hideToggles[bufnr()], {GetKey(): active })
  return g:hideToggles[bufnr()][GetKey()]
endfunction

function! ToggleCurrentNeighbors()
endfunction

function! SwitchBackIfIsTerm()
  echo "switchback"
  let bufname = bufname('%')
  let bufnr = bufnr('%')
  let buftype = getbufvar(g:bufferNumber, "&buftype")
  if buftype!="terminal"
     let g:bufferNumber=GetBuf()
     let g:windowNumber=GetWin()
     echo "no term"
  endif
  echo g:bufferNumber
endfunction

function! GetCwordIfReadableFile()
  let cword=""
  let cword=expand('<cword>')
  let cword=expand('<cWORD>')
  let path=substitute(cword, '\n', "", 'g')
  if !filereadable(path)
    let path=""
  endif
  return path
endfunction

function! HideTerminal()
  if 1
    if IsTerminalVisibile()
      if IsTerminalFocus()
        if GetKey()=="b"
          execute 'b#'
        elseif GetKey()=="h"
          hide
        elseif GetKey()=="j"
          hide
        elseif GetKey()=="k"
          hide
        elseif GetKey()=="l"
          hide
        endif
      else
        let g:terminalBuffer=GetBufByUUID(AimTermName())
        let b=bufwinnr(g:terminalBuffer)
        exec b"hide"
      endif
    endif
  else
    if IsTerminalVisibile()
      let g:terminalBuffer=GetBufByUUID(AimTermName())
      let b=bufwinnr(g:terminalBuffer)
      exec b"hide"
    endif
  endif
endfunction

function! IsTerminalExists()
  return Length(GetTerms(AimTermNameWoId()))
endfunction

function! IsTerminalExistsX()
  let g:terminalBuffer=BufSell(AimTermName())
  if g:terminalBuffer > 0
    return 1
    return bufexists(g:terminalBuffer)
  else
    return 0
  endif
endfunction

function! IsTerminalFocus()
  let bufnr = bufnr("%")
  let g:terminalBuffer=GetBufByUUID(AimTermName())
  if bufnr == g:terminalBuffer
    return 1
  else
    return 0
  endif
endfunction

function! IsTerminalVisibile()
  let visible = {}
  for t in range(1, tabpagenr('$'))
      for b in tabpagebuflist(t)
          let visible[b] = 1
      endfor
  endfor
  let g:terminalBuffer=BufSell(AimTermName())
  return bufexists(g:terminalBuffer) && has_key(visible, g:terminalBuffer)
endfunction

function! ScrollTerminalDown()
  let termwin=winnr()
  let b=GetWin()
  exec b" wincmd w"
  norm <c-\><c-n><End>i
  exec termwin" wincmd w"
endfunction

function! FocusTerminal()
  let win=winnr()
  let b=bufwinnr(g:terminalBuffer)
  exec b" wincmd w"
  norm <c-\><c-n><PageDown><PageDown>i
endfunction

function! TermClosed()
  if exists("t:exec_targets")
    for i in range(0,len(t:exec_targets)-1)
      if HasState()
        if t:exec_targets[i][1] == b:state.uuid
          let t:exec_targets[i][1]=-1
        endif
      endif
    endfor
  endif
endfunction

function! UnsetTerms(uuid)
endfunction

function! ExitTerminal()
  let i=GetBufByUUID(g:termname)
  if i>0
    execute "bd!" i
  endif
endfunction

function! SetTerms(uuid, k)
  if HasState()
    if IsTermWin() || IsVash()
      call Statusline()
    endif
  endif
endfunction

function! InsertIfTerminal()
  try
  if IsTermWin()
    if has('nvim')
      startinsert
    else
      if ! exists("modifiable")
        norm i
      endif
    endif
  endif
  catch
  endtry
endfunction

function! SigTermToTerm(direction)
  let x=['']
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, x)
endfunction

function! SendCustomCommandToTerm(direction, command)
  let x=a:command
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, x)
endfunction

function! SendCommandToTerm(direction) range
  " Bug (VS in normalmode sometimes results in the last selected line)
  let vs=VS()
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, vs)
endfunction

function! SendCommandToThisTerm(command) range
  let buf=bufnr()
  call TERM(buf, a:command)
endfunction

function! RedoCommandToTermWithSigTerm(direction)
  let x=['','[A']
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, x)
endfunction

function! RedoCommandToTerm(direction)
  let x=[ '[A' ]
  let buf=winbufnr(winnr(a:direction))
  call TERM(buf, x)
endfunction

function! SigTermToTerm_win(win)
  let x=['']
  call TERM(a:win, x)
endfunction

function! SendCustomCommandToTerm_win(win, command)
  let x=a:command
  call TERM(a:win, x)
endfunction

function! SendCommandToTerm_win(win) range
  call TERM(a:win, vs)
endfunction

function! RedoCommandToTermWithSigTerm_win(win)
  let x=['','[A']
  call TERM(a:win, x)
endfunction

function! RedoCommandToTerm_win(win)
  let x=[ '[A' ]
  call TERM(a:win, x)
endfunction


function! CheckVS() abort
  if mode() =~# '[vV\<C-v>]'
    let [l:start_line, l:start_col]=getpos("'<")[1:2]
    let [l:end_line, l:end_col]=getpos("'>")[1:2]
    if l:start_line == l:end_line
      let l:selected_text=getline(l:start_line)[l:start_col-1:l:end_col-1]
      return l:selected_text
    else
      echo "Multiple-line slection detected."
      return 0
    endif
  else
    let [l:start_line, l:start_col]=getpos("'<")[1:2]
    let [l:end_line, l:end_col]=getpos("'>")[1:2]
    if l:start_line==0 || l:end_line==0
      echo "No visual selection available."
      return 0
    endif
    echo "Not in visual mode, but previous selection exits."
    return 0
  endif
endfunction

function! CWindow(focus=0)
  let leaveUnfocused=""
  if !a:focus
    let leaveUnfocused=" | wincmd p"
  endif
  if g:vertical
    let size=50
  else
    let size=15
  endif
  " exec GetVertical() "copen "..leaveUnfocused
  " copen | wincmd p
  exec GetVertical() "copen "..size.." "..leaveUnfocused
endfunction

function! ToggleVertical()
  if g:vertical==1
    let g:vertical=0
  else
    let g:vertical=1
  endif
  ToggleC
  " if IsQuickfixOpenAndFocused()
  "   cclose
  "   call CWindow()
  " elseif !IsQuickfixOpen1()
  "   call CWindow()
  " elseif IsQuickfixOpen1()
  "   call CWindow()
  " endif
endfunction

function! GetVertical()
  if g:vertical
    return "vertical"
  endif
  return ""
endfunction

function! IsQuickfixOpenAndFocused()
  if winnr('$') > 0 && getwinvar(winnr("$"), '&buftype') ==# 'quickfix'
    return 1
  else
    return 0
endfunction

function! IsQuickfixOpen1()
  for win in getwininfo()
    if win.quickfix
      return 1
    endif
  endfor
  return 0
endfunction

function! IsQuickfixOpen2()
  if !empty(filter(getwininfo(), 'v:val.quickfix && !v:val.loclist'))
    return 1
  else
    return 0
  endif
endfunction

function! ToggleC()
  if IsQuickfixOpen2()
    cclose
  else
    call CWindow()
  endif
endfunction

function! BashCWindow(cmd)
  exec "AsyncRun "..a:cmd
  call CWindow()
endfunction

function! SearchRight(switch)
  if a:switch=="<visual>"
    let input=CheckVS()
  elseif a:switch=="<cword>"
    let input=expand('<cword>')
  elseif a:switch=="<CWORD>"
    let input=expand('<CWORD>')
  elseif a:switch=="<input>"
    let input=input("search for: ")
  endif
  let cmd = g:bashrc_source..'; pwd; findd '..input
  exec "AsyncRun "..cmd
  call CWindow()
endfunction

function! AddInCommandLine()
endfunction

function! FloatTermTest(command)
  let cmd=call('BuildString', [g:main_repo, '~/Folder'])
  function! s:OnJobExit(Term_name, Exit_status) abort
    echo exit_code
  endfunction
  exec "FloatermNew --autoclose=2 "..cmd
endfunction

function! ExecuteRight_Scriptnames()
  redir=>m
    silent scriptnames
  redir END
  cgetexpr m
  call CWindow()
endfunction

function! LsRight(switch="")
  if a:switch==""
    let input=CWD()[0]
  elseif a:switch=="<visual>"
    let input=CheckVS()
  elseif a:switch=="<cword>"
    let input=expand('<cword>')
  elseif a:switch=="<CWORD>"
    let input=expand('<CWORD>')
  elseif a:switch=="<input>"
    let input=input("search for: ")
  endif
  let cmd = 'ls'
  let output=system(cmd)
  cgetexpr output
  call CWindow()
endfunction

function! _buildLayout(layout)
  function! _wincmd(operator)
    if a:operator=~'[HJKL]'
      if a:operator=="H"
        wincmd H
      elseif a:operator=="J"
        wincmd J
      elseif a:operator=="K"
        wincmd K
      elseif a:operator=="L"
        wincmd L
      endif
      let g:debug_layout.="\nwincmd "..a:operator
    endif
  endfunction
  function! _norm(norm)
    if a:norm != ""
      exec "norm "..a:norm
    endif
  endfunction
  let x=a:layout
  let c=0
  let g:debug_layout=""
  let operator="x"
  for a in x
    if c!=0
      let operator=x[c][1]
    endif
    let norm=""
    if len(a)>2
      let norm=x[c][2]
    endif
    if operator=="s"
      let spc="split"
    elseif operator=="v"
      let spc="vsplit"
    endif
    if c==0
      let pre="e "
    else
      let pre=spc.." "
    endif
    let file=x[c][0]
    if filereadable(file)
      silent exec pre..file
      let g:debug_layout.="\nexec "..pre..file
      call _wincmd(operator)
      call _norm(norm)
    else
      let filee=expand(file)
      if !filereadable(filee)
        let filee = g:vim_advantages.."/"..file
      endif
      if filereadable(filee)
        silent exec pre..filee
        let g:debug_layout.="\nexec "..pre.. filee
        call _wincmd(operator)
        call _norm(norm)
      else
        echo "file not found: "..file
      endif
    endif
    let c=c+1
  endfor
endfunction
" Utilities

function! ContainsAll(haystack, needle)
    for l:item in a:list2
        if index(a:list1, l:item) == -1
            return 0
        endif
    endfor
    return 1
endfunction

function! CheckList(args)
    let l:lists = split(a:args, '\s\+')
    if len(l:lists) != 2
        echoerr "Please provide two lists"
        return
    endif
    let l:list1 = split(l:lists[0], ',')
    let l:list2 = split(l:lists[1], ',')
    if ContainsAll(l:list1, l:list2)
        echo "List1 contains all elements of List2"
    else
        echo "List1 does NOT contain all elements of List2"
    endif
endfunction

function! ContainsString(haystack, needle)
  if stridx(a:haystack, a:needle) == -1
    return 0
  else
    return 1
  endif
endfunction

function! FindStringColumns(searchstr) range
  let line = getline('.')
  let cols = []
  let pos = 0
  let searchstr=input('string: ')
  while 1
    let pos = match(line, '\V' . escape(searchstr, '\'), pos)
    if pos == -1
      break
    endif
    call add(cols, pos + 1)  " 1-based column numbers
    let pos += 1
  endwhile
  return cols
endfunction

function! FindCharColumns(searchchar)
  let searchchar=input('char: ')
  let x = map(
        \ split(getline('.'), '\zs'),
        \ {i,v -> [i+1, match(v, searchchar) >= 0 ? i+1 : -1]})
        \->filter({_,v -> v[1] != -1})
        \->map({_,v -> v[0]})
  return x
endfunction

function! GotoMarker(marker) range
  execute "norm `".upper(a:marker)
endfunction

function! CreateMarker(marker) range
  execute "norm m".upper(a:marker)
endfunction

function! Length(arr)
  let x=a:arr
  let i= 0
  while i < len(x)
    let i=i+1
  endwhile
  return i
endfunction

function! SearchNext(keymap) range
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  call feedkeys('/')
endfunction

function! SearchPrev(keymap) range
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  call feedkeys('? "sy?<C-r>s<CR>gN')
endfunction

function! Mod(n,m)
  return ((a:n % a:m) + a:m) % a:m
endfunction

function! ClipboardYank()
  " silent try
  "   silent call system('wl-copy || xclip -i -selection clipboard', @@)
  " catch
  "   call setreg('*', @@)
  " endtry
  try
    call setreg('*', @@)
    " call setreg('*', @@, 'ac')
  catch
    call setreg('"', @@)
    " call setreg('"', @@, 'ac')
  endtry
endfunction

function! ClipboardPaste(mode)
  " put=getreg('*')
  " call getreg('*')
  " put=getreg('"')
  " if (GetMode() == "v")
  "   call cursor(g:vlcb[0], g:vlcb[1]) | execute "normal! v" | call cursor(g:vlce[0], g:vlce[1])
  " endif
  " silent try
  "   silent let @@ = system('wl-paste >/dev/null 2>/dev/null && wl-paste -n || xclip -o -selection clipboard')
  " catch
  "   let @@ = getreg('*')
  " endtry
endfunction

func! ListMonths()
  call complete(col('.'), ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'])
  return ''
endfunc

function! ToggleLineStateGlobal()
  Implement
endfunction

function! ToggleLineState()
  let g:linestate = g:linestate+1
  let g:linestate = g:linestate % 3
  call SetLineState(g:linestate)
endfunction

function! StashAndFree(file)
  !clear && git stash save "my saved stash"
  exec "!git checkout ".a:file
  !git stash list
  !git stash pop
  !git stash push -p
  !git stash apply
  !git stash branch add-sidebar
endfunction

function! SwitchHeaderCode()
  let e=@%
  let f=split(e, "/")[-1]
  let name=system('cut -d. -f 1', f)
  let ext=system('cut -d. -f 2', f)
  let newext = ext
  let ext=substitute(ext, '\%x00', "", 'g')
  let newext=substitute(newext, '\%x00', "", 'g')
  let name=substitute(name, '\%x00', "", 'g')
  if ext=="cpp"
    let newext = "h"
  elseif ext=="h"
    let newext = "cpp"
  endif
  let p = expand('%:h')
  let g:out=p."/".name.".".newext
  e g:out
endfunction

function! Keys(tuple)
  let keys=[]
  let len=Length(a:tuple)
  for c in range(0,len-1)
    let key = a:tuple[c][0]
    call extend(keys , [key])
  endfor
  return keys
endfunction

function! Values(tuple)
  let values=[]
  let len=Length(a:tuple)
  for c in range(0,len-1)
    if Length(a:tuple[c]) > 2
      let value = a:tuple[c][1:]
    else
      let value = a:tuple[c][1]
    endif
    call extend(values, [value])
  endfor
  return values
endfunction

function! Items(t)
  let output=[]
  for iv in range(0, len(a:t[0])-1)
    let temp=[]
    for i in range(0, len(a:t)-1)
      call extend(temp, [a:t[i][iv]])
    endfor
    call extend(output, [ temp ])
  endfor
  return output
endfunction

command! -range -nargs=0 Tidy <line1>,<line2>call Tidy()
" function Tidy() range
"   call TidyHTML()
"   " norm gv
"   " call DeleteEmptyLines()
"   " norm gv
"   " norm =
" endfunction

function! TidyHTML2()
  let vs="'<,'>"
  let pattern="s/<[^>]*>/\r&\r/g"
  silent exec vs..pattern
endfunction

command! -range -nargs=+ REGEX <line1>,<line2>call REGEX(<q-args>)
function! REGEX(pattern)
  let vs="'<,'>"
  try | silent exec vs..a:pattern | catch | finally | endtry
  " silent exec vs..a:pattern
endfunction

function! Tidy() range
  REGEX s:<tr>:<tr>:g
  REGEX s:</tr>:</tr>:g
  REGEX s:<td>:<td>:g
  REGEX s:</td>:</td>:g
  norm gv=
  silent '<,'>DeleteEmptyLines
endfunction


function! CountRegex() range
  let pattern="s/^\\s*\\\"/&/gen"
  let m = 0
  try
    silent redir=>m
      silent exec "'<,'>".pattern
    silent redir END
  catch
    silent redir=>m
      silent exec pattern
    silent redir END
  endtry
  echo m
endfunction

function! AppendToClipboard()
    let @+ = @+ . getline(".") . "\n"
endfunction

function! StartsWith(longer, shorter) abort
  return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

function! EndsWith(longer, shorter) abort
  return a:longer[len(a:longer)-len(a:shorter):] ==# a:shorter
endfunction

function! Contains(longer, shorter) abort
  return stridx(a:longer, a:shorter) >= 0
endfunction

function! __util(c)
  let cmd = a:c
  execute "Imap ".cmd
  execute "Nmap ".cmd
  execute "Tmap ".cmd
  execute "Vmap ".cmd
endfunction

function! GetDictValueCaseInsensitive(dict, key_pattern)
  for [k, v] in items(a:dict)
    if tolower(k)==# tolower(a:key_pattern)
      return v
    endif
  endfor
  return v:null
endfunction

function! SubstGtoDollar()
  let [n, y, x, n]=getpos(".")
  let word=expand('<cword>')
  exec "%s/g:"..word.."/$"..word.."/g"
  call cursor(y,x)
endfunction

function! Hex_codes()
  redir=>M
    silent g/.*\(#\x*\)/s//\1/p
  redir END
  call setreg('*', M)
  call setreg('+', M)
endfunction

function! ListInQuickfix(dir)
  let dir = empty(a:dir) ? '.' : a:dir
  let files = systemlist('ls -1 ' . dir)
  call setqflist(map(files, {_, f -> {'filename': dir . '/' . f, 'lnum': 1}}))
  copen
endfunction

function! CopyFileNameToClipboard()
  let path=expand('%:p')
  call setreg('+', path)
endfunction

function! CopyWholePathToClipboard()
  let path=expand('%:p')
  call setreg('+', path)
endfunction

function! InsertFilename()
   let cmd=["call expand('%')",
         \ expand('%:p'),
         \ expand('%:h'),
         \ expand('%:f'),
         \ expand('%:p:r')
         \]
  call appendbufline(bufnr(), line('.'), cmd)
endfunction

function! RepeatLastCommand()
  norm :[A
endfunction

" Vim General

function! Reloadfile()
  :e!
endfunction

function! Implement()
  echo "Needs Implementation"
endfunction

function! ToggleZoom(zoom=1)
  if exists("t:restore_zoom") && (a:zoom == v:true || t:restore_zoom.win != winnr())
      exec t:restore_zoom.cmd
      unlet t:restore_zoom
  elseif a:zoom
      let t:restore_zoom = { 'win': winnr(), 'cmd': winrestcmd() }
      exec "normal \<C-W>\|\<C-W>_"
  endif
endfunction

function! Resize(keymap)
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  let vim_height = &lines
  let vim_width = &columns
  let buf_height = winheight(winnr())
  let buf_width = winwidth(winnr())
  let interval=5
  if IsShift()
    let new_height = buf_height-interval
    let new_width = buf_width-interval
  else
    let new_height = buf_height+interval
    let new_width= buf_width+interval
  endif
  echo key
  if IsControl()
    exec "resize ".new_height
  else
    exec "vertical resize ".new_width
  endif
  call DebugKeys()
endfunction

function! ShrinkH()
  horizontal resize -25
endfunction

function! ShrinkV()
  exec GetVertical() "resize -65"
endfunction

function! ExpandH()
  horizontal resize +25
endfunction

function! ExpandV()
  exec GetVertical() "resize +65"
endfunction
let redefine_SaveFile= 1
if g:redefine_SaveFile || !exists('*SaveFile')
  function! SaveFile()
    call Cursor_Prep()
    try
      w!
    catch
      silent call SaveAsRoot()
    endtry
    call Cursor_Back()
    " echo "File was saved"
  endfunction
endif

if !exists('*SourceVim')
  function SourceVim()
    exec "so "..expand('%:p')
    call Statusline()
  endfunction
endif

function! ToggleRelativeNumber()
  if v:version > 703
    set relativenumber!
  endif
endfunction

" set nowrap
" set textwidth=0
" set wrapmargin=0

function! ToggleWrap()
  if s:wrapenabled
    set nowrap nolist nolinebreak
    unmap j
    unmap k
    unmap 0
    unmap ^
    unmap $
    let s:wrapenabled = 0
  else
    set nowrap nolist nolinebreak
    nnoremap j gj
    nnoremap k gk
    nnoremap 0 g0
    nnoremap ^ g^
    nnoremap $ g$
    vnoremap j gj
    vnoremap k gk
    vnoremap 0 g0
    vnoremap ^ g^
    vnoremap $ g$
    let s:wrapenabled = 1
  endif
endfunction

function! SetLineState(n)
  if a:n== 0
    set nonumber
    set norelativenumber
  elseif a:n== 1
    set number
    set relativenumber
  elseif a:n== 2
    set number
    set norelativenumber
  endif
endfunction

function! SaveAsRoot()
  try
    :silent w !clear; sudo tee %
    :e! %
    :o
    :u
  catch
    echo "File was not saved."
  endtry
endfunction

function! SaveVars(file, prefix)
  let b=json_encode(copy(g:)->filter('v:key =~# "^'.a:prefix.'"'))
  call system("python -m json.tool > ".a:file, b)
endfunction

function! LoadVars(file)
  try
    let b:data = json_decode(readfile(a:file))
  catch
  finally
  call extend(g:, b:data)
  endtry
endfunction

function! HasState()
  if exists("b:state")
    return 1
  else
    return 0
  endif
endfunction

function! BufferSetup()
  let g:RecursiveCounter=g:RecursiveCounter+1
  let uuid=NewUUID()
  let type=""
  if !HasState()
    if exists('b:NERDTree') && b:NERDTree.isTabTree()
      let b:TermOpened=1
      let type="NERDTree"
    elseif &buftype == 'terminal'
    let b:state={  'file': expand('%'),  'uuid': uuid,  'type': 'terminal',  'exec_keys': [],  'color': 'User2',  'term_title': "Terminal-".uuid,  'leftinvisualstate': 0, }
        if exists("g:previous_parent")
          unlet g:previous_parent
        endif
    else
       let b:state={  'file': expand('%'),  'uuid': uuid,  'type': 'buffer',  'exec_keys': [],  'color': 'User2',  'leftinvisualstate': 0, }
    endif
    if !exists("g:buffer_vars")
      let g:buffer_vars={}
      let g:buffer_vars[bufname()]={}
      let n="g:buffer_vars[".bufname()."]"
    elseif !has_key(g:buffer_vars, bufname())
        let g:buffer_vars[bufname()]={}
    endif
    let b:isGitRepo=system("echo -n `git rev-parse --is-inside-work-tree 2>/dev/null || echo -n false`")
    let b:lastMasterBranch=system("if $isGitRepo; then echo -n `git log master --oneline | head -n 0 | awk '{print $1}'`; else echo -n '...'; fi")
    let b:branch=system("if $isGitRepo; then echo -n `git rev-parse --abbrev-ref HEAD`; else echo -n 'not a git repo'; fi")
    let b:commitstatus=system("echo -n 'got commited (to be done)'")
    let b:datetime=system("echo -n `date`")
  endif
endfunction

function! NewUUID()
  let g:seed = srand()
  let min=00000000000000000000
  let nr=rand(g:seed) %  99999999999999999999  " to echo a random number between 0-99
  let out=min+nr
  return out
endfunction

function! IsVash()
  if HasState()
    if b:state.type=='vash'
      return 1
    else
      return 0
    endif
  else
    return 0
  endif
endfunction

function! s:OnEvent(job_id, data, event) dict
endfunction

function! GetType()
  if IsTermWin()
    return 'Terminal'
  elseif IsBufWin()
    return 'Buffer'
  endif
endfunction

" Autocommands

function! BufferSetupAutoCMD()
endfunction

function! UpdateAutoCMD()
endfunction

function! BufReadPost()
endfunction

function! BufWinEnter()
  " call REFRESH_CWD()
  call MakeDirCurrentCWD()
  " call CD(expand('%:p:h'))
  " call InitLineState()
  " echo "BufReadPost"
endfunction

function! BufNew()
  " if exists("g:lastmain_repo")
  "   call CD(g:lastmain_repo)
  " endif
  call BufferSetup()
endfunction

function! TabNew()
  " if exists("g:lastmain_repo")
  "   call CD(g:lastmain_repo)
  " endif
endfunction

function! InitLineState()
  " Implement " LineState Global And BufferWise
  if IsTermWin()
    call InsertIfTerminal()
  endif
endfunction

function! VimLeave()
  redraw!
endfunction

function! FocusLost()
endfunction

function! TermLeave()
endfunction

function! VimEnter()
  " if &buftype == 'terminal'
  "   set wrap
  " elseif &buftype == 'buffer'
  "   set nowrap
  " endif
  call InitLineState()
  " call system("bash", g:bashset_restore)
  call Statusline()
  " call SetProject(getcwd())
  " call Layout_Vim()
  " redraw!
  call AutoInstallPlug()
  call InitPlug()
endfunction

function! BufEnter()
  call CD(expand('%:p'))
  " call DebugPaths()
  " call Statusline()
endfunction

function! TabClose()
  try
    tabclose
  catch
    qa!
  finally
  endtry
endfunction

function! WinEnter()
  " if getbufvar(bufnr(), '&buftype') == 'terminal'
  " if win_gettype(winnr()) == ""
  "     endif
  " exec "set tags="..CWD().."/tags"
  " echo "set tags="..CWD().."/tags"
  " if HasState()
  " endif
  call Statusline()
  call SetLineState(g:linestate)
  " exec "cd "..CWD()
  call REFRESH_CWD()
  " Simpliest solution for now.
  " Visual Selection gets losts
  call InsertIfTerminal()
  " if BufIsTerminal()
  "   startinsert
  " endif
  " call InitLineState()
  " let parent=CWD()
  " if isdirectory(parent)
  "   exec "cd "..parent
  " endif
endfunction

function! WinLeave()
  let g:lastmain_repo=CWD()
endfunction

function! BufLeave()
	let last_buffer = bufnr("$")
  let last_winid = bufwinid(last_buffer)
  let g:lastmain_repo=getwinvar(last_winid, "main_repo")
  " if IsTermWin()
  " endif
  call SetLineState(0)
endfunction

" Execute In File

function! PyExec(keymap) range
  echo "Python"
endfunction

function! BashExec(keymap) range
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  let m=expand(g:bashrc_source)
  for x in vs
    let m=m."\n".x
  endfor
  let ccout=systemlist(m)
  let cout=""
  for c in ccout
    if cout==""
      let cout=c
    else
      let cout=cout."\n".c
    endif
  endfor
  redir @*>
    silent echon cout
  redir END
  if key[0]=='c' || key[0]=='C'
    exec "norm gv".key[0].'*'
  elseif key[0]=='o'
    let e = getpos("'>")
    call cursor(e[1], e[2])
    exec "norm ".key[0].'*'
  elseif key[0]=='a'
    let e = getpos("'>")
    call cursor(e[1], e[2])
    exec "norm ".key[0].'*'
  else
    exec "norm ".key[0].'*'
  endif
  if IsVisual()
    norm gv
  endif
endfunction

function! BashPaste(keymap) range
  let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  put=a
endfunction

function! BashCommandLine()
  let input=input('!')
  " let list=systemlist(input)
  exec "r ! source ".g:bashrc_source."; "..input
endfunction

function! RUST(arg='') range
  let vs = a:arg
endfunction

function! VIM(arg='') range
  let vs = a:arg
  redir=>v
    for c in vs | silent exec c | endfor
  redir END
  " let length=len(split(m,'\n'))
  " if length>0
  "   put=m
  " endif
  call PUTT(v)
endfunction

function! BASH(cmd='', mode='exec_vs') range
  let vs=VS()
  let cmd = EnsureArr(a:cmd)
  let c = join(cmd, '\n')
  if a:mode == 'exec_vs'
    let m = systemlist(g:bashrc_source.";".c)
  elseif a:mode == 'exec_input_vs'
    let m = systemlist(g:bashrc_source.";".c, vs)
  endif
  call PUTT(m)
endfunction

function! PYTHON(arg='')
  let c = a:arg
  try
    let m = system(g:bashrc_source."; cat | python3", c)
  catch
    try
      let m = system(g:bashrc_source."; cat | python3", c)
    endtry
  endtry
  call PUTT(m)
endfunction

function! TIN(...)
  let b = bufnr()
  call TERM(b, a:000)
  exec "wincmd w"
  call Win(b)
endfunction

function! Sys(...)
  let x = system(join(a:000))
  put=x
endfunction

function! Bash(args)
  let vs=a:args
  let c = join(vs, '\n')
  " let m = systemlist(g:bashrc_source.";".c)
  let m = system(g:bashrc_source.";".c)
  put=m
endfunction

function! Vim(args)
  " echo "len" len(a:args)
  " echo "a:args" a:args
  " echo "empty" empty(a:args)
  " echo "exists" exists(a:args)
  " echo "a:args[0]" a:args[0]
  " echo "type" type(a:000)
  " echo VS()
  if !empty(a:args)
    let command=a:args
  else
    let command=VS()
  endif
  redir=>m
    silent exec join(command)
  redir END
  put=trim(m)
endfunction

" Customizable FZF Integration

function! BuildString(options, paths, tempfile="")
  let fzf="fzf --multi -i --no-sort --tiebreak=length,begin,index"
  let fzf="fzf --multi -i --tiebreak=begin,length"
  let m = a:paths
  let len=len(m)-1
  let string=""
  let prefix='bash -c " ( '
  if a:tempfile!=""
    let suffix=' ) | '.fzf.' > '.a:tempfile.'"'
  else
    let suffix=' ) | '.fzf.' > "'
  endif
  for x in range(0, len)
    let string=string.."find ".m[x]." ".a:options." -not -path '*/.git/*' -not -path '*/.git.off/*' 2>/dev/null "
    if x < len
      let string=string.."; "
    endif
  endfor
  let string=prefix..string..suffix
  return string
endfunction

function! Find_Popup(title, paths, callback, type="file", maxdepth=10, register="")
  let tempfile="/tmp/tempfile_fzf"
  let b:popup_tempfile=tempfile
  if a:type=="directory"
    let type="d"
  else
    let type="f"
  endif
  let cmd=call('BuildString', [ "-maxdepth "..a:maxdepth.." -type "..type,  a:paths, tempfile])
  let title=' '..a:title..": "..join(a:paths, ' ')..' '
  let g:FileFinder_result=""
  function! OnStdout(channel, msg)
  endfunction
  function! OnError(...)
  endfunction
  function! OnExitTerm(bufname, job, code)
  endfunction
  let opts={
        \ 'hidden': 1,
        \ 'err_cb': 'OnError',
        \ 'term_name': 'Find',
        \ 'term_finish': 'close',
        \ }
  let tnr=term_start(cmd, opts)
  let g:tnr=tnr
  function! MyFilter(wnid, key)
    if a:key=='q'
      call popup_close(a:winid)
      call OnPopupClose(a:winid, 'User pressed q')
      return 1
    endif
    return 0
  endfunction
  try
  let g:pnr=popup_create(tnr, #{
    \ title: title,
    \ pos: 'center',
    \ minwidth: 80,
    \ minheight: 20,
    \ maxheight: 80,
    \ border: [1, 1, 1, 1],
    \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    \ highlight: 'Pmenu',
    \ term_cols: 40,
    \ cursorline: 1,
    \ zindex: 200,
    \ callback: a:callback,
    \ })
  catch
  finally
  endtry
endfunction

function! Execution_Popup(title, list, callback)
  let title=' '..a:title..' '
  function! OnStdout(channel, msg)
  endfunction
  function! OnError(...)
  endfunction
  function! OnExitTerm(bufname, job, code)
  endfunction
  let opts={
        \ 'hidden': 1,
        \ 'err_cb': 'OnError',
        \ 'term_name': 'Find',
        \ 'term_finish': 'close',
        \ }
  function! MyFilter(wnid, key)
    if a:key=='q'
      call popup_close(a:winid)
      call OnPopupClose(a:winid, 'User pressed q')
      return 1
    endif
    return 0
  endfunction
  let g:pnr=popup_create(0, #{
    \ title: title,
    \ pos: 'center',
    \ minwidth: 80,
    \ minheight: 20,
    \ maxheight: 80,
    \ border: [1, 1, 1, 1],
    \ borderchars: ['─', '│', '─', '│', '╭', '╮', '╯', '╰'],
    \ highlight: 'Pmenu',
    \ term_cols: 40,
    \ cursorline: 1,
    \ zindex: 200,
    \ callback: a:callback,
    \ })
endfunction

function! GetTempfileLine()
  let tempfile=get(b:, 'popup_tempfile', '')
  if !filereadable(tempfile)
    return
  endif
  let result = readfile(tempfile)
  if exists("result")
    if len(result)>0
      let result=result[0]
    endif
    if empty(result)
      return
    endif
    call delete(tempfile)
    if filereadable(result) || isdirectory(result)
      return result
    endif
    return
  endif
  return
endfunction

" Plugins
function Has_Plug_Vim()
  let x=execute('scriptnames')->split("\\n")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})
  " echo x
  " for xi in x
  "   echo xi
  " endfor
  if len(filter(copy(x), "v:val=~'plug.vim'")) > 0
    return 1
  else
    return 0
  endif
endfunction

function! Sourced_Plug_Vim()
  if Has_Plug_Vim()
    return 1
  endif
  if !exists('g:Sourced_Plug_Vim') || g:Sourced_Plug_Vim==0
    if !Has_Plug_Vim()
      if filereadable(g:plugfile)
        exec "source "..g:plugfile
      endif
    endif
    if Has_Plug_Vim()
      let g:Sourced_Plug_Vim=1
    else
      let g:Sourced_Plug_Vim=0
    endif
  endif
  return g:Sourced_Plug_Vim
endfunction

function Update()
  :PlugInstall
  :PlugUpdate
endfunction
command! -bar -range -nargs=0 Update call Update()

" Happens On Vim Enter
function! AutoInstallPlug()
  if Has_Plug_Vim() && !Sourced_Plug_Vim()
    let x=execute('scriptnames')->split("\\n")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})
    let f=filter(copy(x), "v:val=~'plug.vim'")
    if len(f) > 0
      exec "source" f[0]
    endif
  elseif !Has_Plug_Vim() && !Sourced_Plug_Vim()
    let httpplug="https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim"
    " exec "!wget -q "..httpplug.." "..g:plugfile
    if !filereadable(expand(g:plugfile))
      exec "!wget "..httpplug.." "..g:plugfile
    endif
  endif
endfunction

let g:plugfile="~/.vim/autoload/plug.vim"

function InitPlug()
  call plug#begin()
    " Plug 'dense-analysis/ale'
    " Plug 'junegunn/fzf'
    " Plug 'junegunn/fzf.vim'
    " Plug 'skywind3000/asyncrun.vim'
    " Plug 'tpope/vim-dispatch'
    " Plug 'prabirshrestha/vim-lsp'
    " Plug 'mattn/vim-lsp-settings'
    " Plug 'prabirshrestha/asyncomplete.vim'
    " Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'vi0lin/vim-advantages'
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'
  call plug#end()
endfunction

if executable('clangd')
  au User lsp_setup call lsp#register_server({
    \ 'name': 'clangd',
    \ 'cmd': {server_info->['clangd']},
    \ 'whitelist': ['c', 'cpp'],
    \ })
endif

set rtp+=/usr/bin/fzf

" Extend Visual Selection
let g:b=[]
let g:e=[]

function! PopSelection() range
  if len(g:pb) > 0
    norm 
    call setpos("'<", g:pb[-1])
    call setpos("'>", g:pe[-1])
    let g:pb=g:pb[0:-2]
    let g:pe=g:pe[0:-2]
    norm gv
  endif
endfunction

function! PushSelection() range
  let b = getpos("'<")
  let e = getpos("'>")
  call extend(g:pb, [b])
  call extend(g:pe, [e])
  norm gv
endfunction

function! BackupSelection()
  let b = getpos("'<")
  let e = getpos("'>")
  call extend(g:b, [b])
  call extend(g:e, [e])
endfunction

function! RestoreSelection()
  call setpos("'<", g:b)
  call setpos("'>", g:e)
  let g:b=[]
  let g:e=[]
endfunction

function! ResetVS()
  call setpos("'<", [0,0,0,0])
  call setpos("'>", [0,0,0,0])
  let g:b=[]
  let g:e=[]
  let g:pb=[]
  let g:pe=[]
endfunction

function! RightmostVirtualColumn()
  let reg_v = @v
  silent normal! gv"vy
  let max = 0
  for line in split(getreg('v'), '\n')
    let len = strlen(line)
    let max = max([len, max])
  endfor
  let @v = reg_v
  let max += min([virtcol("'<"), virtcol("'>")]) - 1
  return max
endfunction

function! VSPerLine()
  norm gv
  let X=[getpos("'<"), getpos("'>"), getpos("v"), getpos("."), getpos("$"), getpos("#"), getpos("*")]
  let from=X[0][2]
  let to=X[3][2]
  let [line_start,   v_column_start] = getpos("v")[1:2]
  let [line_end,     v_column_end] = getpos(".")[1:2]
  let lines=[]
  let lines = getline(line_start, line_end)
  let linesOut=[]
  for line in lines
    let to=RightmostVirtualColumn()
    call extend(linesOut, [line[from-1:to-1]])
  endfor
  return linesOut
endfunction

" function VS_Reselect()
"   if IsVisual()
"     norm gv
"     return VS()
"   else
"     return VS()
"   endif
" endfunction

function! VS_DebugKeys()
  if IsVisual()
    return VS()
  else
    return VS()
  endif
endfunction

function! KeepPointer()
  norm `Y
endfunction

function! SetKey(key)
  let g:__pressedKey=a:key
endfunction

function! GetKey()
  return g:__pressedKey
endfunction

function! CountString(string, pattern)
  let oc=0
  let result=0
  let index=0
  while result > -1
    let result=stridx(a:string, a:pattern, index)
    let index=result+1
    if result > -1
      let oc=oc+1
    endif
  endwhile
  return oc
endfunction

function! SplitA(k)
  let i4=CountString(a:k, "<leader>")
  let pos=i4*8
  let leaders=""
  if pos>0
    let leaders=a:k[0:pos-1]
  endif
  let key=a:k[pos:]
  let a=stridx(key, "F")
  let b=stridx(key, ">")
  let fkey=""
  if b==-1
  elseif a>-1 && key=~#"F"
    exec "let fkey='<'.key[".a.":".b."]"
  endif
  return [ key, leaders, fkey ]
endfunction

function! SetKeymap(key)
  let g:__pressedKeymap=a:key
endfunction

function! UtilHelper(keymap)
  let vs = VS()
  call SetKeymap(a:keymap)
  let [ key, leaders, fkey ] = SplitA(a:keymap)
  if ! empty(fkey)
    call SetKey(fkey)
  else
    call SetKey(key)
  endif
  return [ key, leaders, fkey, vs ]
endfunction

function! SetModeChanged(modechanged)
  let g:modechanged=a:modechanged
endfunction

function! GetModeChanged() range
  return g:modechanged
endfunction

function! SetMode(keymap, mode)
  let g:mode=a:mode
  if a:keymap!=""
    let [ key, leaders, fkey, vs ] = UtilHelper(a:keymap)
  endif
endfunction

function! GetMode()
  return g:mode
endfunction

" Statusline

function! SETCOLOR(m)
  set statusline+=%#User2%{(g:linestate)}
endfunction

function! COLOR(...)
  if HasState()
    if IsBuffer()
      call SETCOLOR(a:1)
    elseif IsTermWin()
      call SETCOLOR(a:1)
    endif
  endif
endfunction

function! HasStatuslineInitialized()
  if exists("b:statusline_initialized")
    return 1
  else
    return 0
  endif
endfunction

function! IsBufWin()
  return exists('b:state')&&b:state.type=='buffer'
endfunction

function! IsTermWin()
  return exists('b:state')&&b:state.type=='terminal'
endfunction

function! Statusline_TogglePath()
  let g:wholepath=Mod(g:wholepath+1, 2)
  call Statusline()
endfunction

" Layouts
function! Layout_Bash()
  call _tabnew_if_not_empty_buffer()
  " Filename, [hjklHJKLvs], normalcommand
  let layout=[
    \ [ g:bashrc, "H"],
    \ [ g:bashrc..'.unreleased', "H"],
    \ [ g:vimrc, "v"],
    \]
  call _buildLayout(layout)
  exe 1 .. "wincmd w"
endfunction

function! IsBuffersAreEmpty()
  function! _isEmpty(winnr)
    let bufnr=winbufnr(a:winnr)
    let lines=getbufline(bufnr, 1, '$')
    return len(lines) == 0 || (len(lines) == 1 && lines[0] =~ '^\s*$')
  endfunction
  let w=1
  while w<=winnr('$')
    if !_isEmpty(w)
      return 1
      break
    endif
    let w+=1
  endwhile
  return 0
endfunction

function! _tabnew_if_not_empty_buffer()
  exec IsBuffersAreEmpty() ? "tabnew" : ""
endfunction

function! LayoutVim()
  call _tabnew_if_not_empty_buffer()
  " Filename, [hjklHJKLvs], normalcommand
    " \ [ "Statusline.vim", "v"],
    " \ [ "Utilize.vim", "s"],
    " \ [ g:vimrc, "v"],
  let layout=[
    \ [ g:vim_advantages."/Functions.vim", "H"],
    \ [ g:vim_advantages."/Map.vim", "v"],
    \ [ g:vim_advantages."/Commands.vim", "v"],
    \ [ g:vim_advantages."/../install.sh", "v"],
    \ [ g:vim_advantages."/../.gitignore", "v"],
    \ [ g:vim_advantages."/../plugin/vim-advantages.vim", "v"],
    \ [ g:vim_advantages."/../readme.md", "v"],
    \ [ g:vim_advantages."/Autocommands.vim", "J"],
    \ [ g:vim_advantages."/Functions.vim9", "v"],
    \ [ g:vim_advantages."/Statusline.vim", "v"],
    \]
    " \ [ g:bashrc, "v", "G"],
    " \ [ "/usr/local/share/vim/vim91/plugin/vim-advantages.vim", "v"],
    " \ [ g:source_dir.."/notes.md", "s"],
  call _buildLayout(layout)
  exe 1 .. "wincmd w"
endfunction
if !exists("g:linestate") | let g:linestate=0 | call SetLineState(g:linestate) | endif
if !exists("g:mode") | call SetMode("", "Normal") | endif

" What is this <expr>?
command! -range -nargs=0 KeyHandler <line1>,<line2>:call KeyHandler(getchar())
function! KeyHandler(key)
  echo a:key
  return
  let l:keystr=n2char(a:key)
  if l:keystr ==# 'j'
    return 'j'
  elseif l:keystr ==# 'k'
    return 'k'
  else
    return ''
  endif
endfunction
nnoremap <expr> <leader>F KeyHandler(getchar())

" ---- grep settings -------------------------------------------------
" set grepprg=grep\ -nH\ --\ -r\ -w\ $*
" set grepprg=grep -nrw -- $*

function! OpenFileUnderCursor()
  hide e <cfile>
  " exec 'e '..expand("<cfile>")
  " exec ':call SearchOpenFile(expand("<cfile>"))'
  " let w:cwd=getcwd()
  " call CD(expand('%:p'))
  " call SetPointer(expand('%:p'))
  call MakeDirCurrentCWD()
endfunction

function! DebugReplacements()
  echo expand("<cWORD>")
  echo expand("<cword>")
  echo expand("<cexpr>")
  echo expand("<cfile>")
  echo expand("<afile>")
  echo expand("<abuf>")
  echo expand("<amatch>")
  echo expand("<sfile>")
  echo expand("<stack>")
  echo expand("<script>")
  echo expand("<slnum>")
  echo expand("<sflnum>")
  echo expand("<client>")
endfunction

endif

let g:vim_advantages_got_sourced='true'
