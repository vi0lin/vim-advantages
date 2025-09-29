function WordsPerLine(n) range
  call CommandInfo()
  let text=VS()
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
function MoveCommentsToEnd() range
  exec a:firstline.",".a:lastline.'g/^\s*\"/m $'
endfunction
function PruneEmptyLines() range
  " exec a:firstline.",".a:lastline.'g/^\s*$/j'
  exec a:firstline.",".a:lastline.'s/\s*\n\s*\n\+/\r\r/g'
endfunction
function DeleteEmptyLines() range
  exec a:firstline.",".a:lastline.'g/^\s*$/d'
endfunction
function DeleteNumbersAtTheBeginning() range
  exec a:firstline.",".a:lastline.'s/^\d*\.\ //g'
endfunction
function RemoveCR() range
  execute a:firstline..","..a:lastline.."s///g"
endfunction
" Older
function AppendToMarkerRange() range
  let Out=getline(a:firstline, a:lastline)
  call deletebufline(bufname("%"), a:firstline, a:lastline)
  let [n, y, x, n]=getpos(".")
  let [n, y, x, n, n]=getcurpos()
  call cursor(y, x)
  let LineNum=getcurpos()[1]-1
  redir => o
    echo join(Out,"\n")
  redir END
  execute "norm `".g:__marker
  norm "op
endfunction
function AppendToMarkerNormal(marker)
  let Out=getline('.')
  let [n, y, x, n]=getpos(".")
  let [n, y, x, n, n]=getcurpos()
  call deletebufline(bufname("%"), a:firstline)
  execute "norm `".a:marker
  let LineNum=getcurpos()[1]
  call append(LineNum, Out)
  call CreateMarker(a:marker)
  call cursor(y, x)
endfunction
function AppendToEndRange() range
  let Out=getline(a:firstline, a:lastline)
  call deletebufline(bufname("%"), a:firstline, a:lastline)
  let [n, y, x, n]=getpos(".")
  let [n, y, x, n, n]=getcurpos()
  call cursor(y, x)
  execute "norm Go"
  let LineNum=getcurpos()[1]-1
  call append(LineNum, Out)
  call cursor(y, x)
endfunction
function AppendToEndNormal()
  let Out=getline('.')
  let [n, y, x, n]=getpos(".")
  let [n, y, x, n, n]=getcurpos()
  call deletebufline(bufname("%"), a:firstline)
  execute "norm G"
  let LineNum=getcurpos()[1]
  call append(LineNum, Out)
  call cursor(y, x)
endfunction
function AppendAllToEnd(commentsign)
  echo a:commentsign
  exec "% global /^ *".a:commentsign."/ call AppendToEndNormal()"
endfunction
function SortAndUniq() range
  let Test=getline(a:firstline, a:lastline)
  let Out=system('sort -f | uniq', Test)
  execute "'<,'> global /^.*$/ norm dd"
  execute "norm i".expand(Out)
endfunction
function REPLACE(...) range
  let x=""
  let y=""
  let x=GETREG(a:1)
  let y=GETREG(a:2)
  if IsVisual()
    exec ": '<,'>s/".x."/".y."/g"
  elseif IsShift() && IsControl()
    exec ":%s/".x."/".y."/g"
  else
    exec ":s/".x."/".y."/g"
  endif
endfunction
function CUT(...) range
  call CommandInfo()
  exec "norm mX"
  let marker="p"
  if exists("a:2")
    let marker=a:2
  endif
  if IsVisual()
    let x=VS(ci)
    norm gvx
  elseif IsNormal()
    let x=getline('.')
    norm dd
  endif
  slient call GotoMarker(a:marker)
  put=x
  silent call CreateMarker(a:marker)
  norm `X
endfunction
function COP(marker) range
  call CommandInfo()
  let Out=VS(ci)
  let [n, y, x, n]=getpos(".")
  let [n, y, x, n, n]=getcurpos()
  slient call GotoMarker(a:marker)
  put=Out
  silent call CreateMarker(a:marker)
  norm 
  if IsVisual()
    norm gv
  endif
endfunction
function Reselect(a)
  let b = getpos("'<")
  let e = getpos("'>")
  if IsAnyVisual()
    " norm gv
    norm v
    call setpos("'<", b)
    call setpos("'>", e)
  endif
endfunction
function Filter_DeleteEmptyLines()
  " exec a:firstline,a:lastline "g/\s*/d"
endfunction
function Filter_MergeEmptyLines() range
  " a:firstline.','.a:lastline g/^$/d
endfunction
function PrintAlignedTable(table)
    function! s:CellToString(cell)
        if type(a:cell) == v:t_list
            return join(a:cell, ',')
        endif
        return string(a:cell)
    endfunction
    let max_cols = 0
    for row in a:table
        let max_cols = max([max_cols, len(row)])
    endfor
    let col_widths = repeat([0], max_cols)
    for row in a:table
        for i in range(len(row))
            let cell_str = s:CellToString(row[i])
            let col_widths[i] = max([col_widths[i], len(cell_str)])
        endfor
    endfor
    for row in a:table
        let line = ''
        for i in range(max_cols)
            let cell = i < len(row) ? s:CellToString(row[i]) : ''
            let padding = repeat(' ', col_widths[i] - len(cell))
            let line .= cell . padding . ' | '
        endfor
        echo line
    endfor
endfunction
function FFormatPaths(...) range
  exec a:firstline.",".a:lastline." ! ".$bashrc."; cat | ffpaths"
endfunction
function FFormatTable(...) range
  exec a:firstline.",".a:lastline." ! ".$bashrc."; cat | fftable"
endfunction
function FFormatSubst(...) range
  exec a:firstline.",".a:lastline." ! ".$bashrc."; cat | ffsubst"
endfunction
function EE(...) range
  let c=join(a:000, '')
  let c=$bashrc."; ".c
  redir=>m
    let m = system(c)
  redir END
  enew
  put=m
endfunction
function EEE(...)
  let variant=0
  let x="!sed -E 's:^[0-9]*\. (http.*):\1:g'"
endfunction
function MakeLinks()
  %s/^\d*. //g
  %!sed /^$/d
  %!sort|uniq
  %!sed -E "s/(^(.+)\/(.+)\/?$)/\<a href=\"\1\"\>\3\<\/a\>/g"
  %!sed "1i <html><head><style>a {display: block;}</style></head><body>"
  %!sed -e '$a</body></html>'
endfunction
function DecToHex()
  :%s/\d\+/\=printf("0x%04x", submatch(0))
  :help printf()
  :help submatch()
  :help sub-replace-special
  :help :s
  :rubydo $_ = '0x%x' % $_
  :perldo $_ = sprintf '0x%x', $_
  :!awk '{printf "0x%x\n",$1}' file
  :!perl -ne 'printf "0x\%x\n", $_'
  :echo printf("%x", decimal)
  :echo printf("%x", 61444)
  vnoremap <leader>x "yy:r! printf "= 0x\%x" $((<C-r>y))<CR>kJ$
endfunction
function HexToDec()
:printf('%x',74565)
:echo str2nr('0a2f', 16)
:echo str2nr('0x0a2f', 16)
:echo str2nr('0012')
:echo '0012' + 0
:echo str2nr('^R^W', 16)
:echo printf('%x', 1234)
:echo printf('%04x', 1234)
:echo printf('%x', ^R^W)
:Dec2hex 496
:Dec2hex
:'<,'>Dec2hex
:%Dec2hex
:Hex2dec 0x1f0
:Hex2dec 1f0
:Hex2dec
:'<,'>Hex2dec
:%Hex2dec
https://vim.fandom.com/wiki/Convert_between_hex_and_decimal
endfunction
function AddC3(hex)
endfunction
function Hexadecimal(...)
  echo "type"type(a:000)
  echo "type"type(a:1)
  echo a:000
  echo a:1
  let color=GetColor(a:1)
  echo color
  return GetHex(color.r)."".GetHex(color.g)."".GetHex(color.b)
endfunction
function GetColor(...)
    if Length(a:000) == 1 && type(a:000) == 4
      return a:1
    elseif Length(a:000)==3
      return { 'r': GetComp(a:1), 'g': GetComp(a:2), 'b': GetComp(a:3) }
    elseif Length(a:000) == 1 && type(a:0)==1
      echo str2nr(a:1, 16)
    elseif Length(a:000) == 1 && Length(a:1) == 2
      let hex=a:1
      return str2nr(hex, 16)
    elseif Length(a:000) == 1 && Length(a:1) == 6
      let hex=a:1
      return { 'r': str2nr(hex[0:1], 16), 'g': str2nr(hex[2:3], 16), 'b': str2nr(hex[4:5], 16) }
    endif
endfunction
function GetHex(value)
  if a:value<=15
    return '0'."".printf("%x", a:value)
  else
    return printf("%x", a:value)
  endif
endfunction
function GetHexColor(r,g,b)
  return GetHex(a:r)."".GetHex(a:g)."".GetHex(a:b)
endfunction
function DeleteAllComments()
  execute "%g:%^\s*//.*:d"
endfunction
function VOpen()
endfunction
function VPaste(mode) range
  call CommandInfo()
  if GetMode()=="Visual"
    let b:Out=VS(ci)
    norm gvp
  else
    norm p
  endif
endfunction
function VCopy(mode) range
  if GetMode()=="Visual"
    norm gvy
    :"w !xclip
  else
    norm y
  endif
  silent '<,'>w !xclip -selection clipboard
  norm gv
endfunction
function VCut(mode) range
  call CommandInfo()
  if GetMode()=="Visual"
    norm gv
    call VS(ci) | silent '<,'>w !xclip -selection clipboard
    norm x
  else
    norm x
  endif
endfunction
function TrimWhiteSpaceWorks()
  '<,'>!sed "/^$/d"
endfunction
function TrimWhiteSpaceSed()
  let pattern='"/^\s*$/d"'
  try
    execute "'<,'>!sed ".pattern
  catch
    execute getcurpos()[1].pattern
  endtry
endfunction
function Sort(arg, x, colB)
  let g:n= g:n+1
  let loop=1
  let i = a:x
  let mutableArg=a:arg
  while i <= len(mutableArg)-2 && loop==1 && len(mutableArg) > 1
    let a = mutableArg[i]
    let b = mutableArg[i+1]
    if a[0] > b[0]
      let mutableArg=swap(mutableArg, i, i+1)
      echo join(mutableArg)
      if i != len(mutableArg)
        let mutableArg = sort(mutableArg, i-1, 0)
      endif
    endif
    let a = mutableArg[i]
    let b = mutableArg[i+1]
    if a[0] == b[0]
      if a[1] > b[1]
        let mutableArg=swap(mutableArg, i, i+1)
      endif
    endif
    let i = i+1
  endwhile
  return mutableArg
endfunction
function TrimWhiteSpace()
  let pattern="s/^$//g"
  try
    execute "'<,'>".pattern
  catch
    execute getcurpos()[1].pattern
  endtry
endfunction
function BulkCopy(mode="normal", marker='A') range
  if mode=="visual"
    let [l:start_line, l:start_col]=getpos("'<")[1:2]
    let [l:end_line, l:end_col]=getpos("'>")[1:2]
    if l:start_line == l:end_line
      let input=getline(l:start_line)[l:start_col-1:l:end_col-1]
    endif
  elseif mode=="cword"
    let input=expand('<cword>')
  endif
  let l:source_bufnr=bufnr('%')
  let pos=getpos("'"..a:marker)
  let buffer=pos[0]
  let l:target_bufnr = bufnr(buffer)
  let [n, y, x, n, n]=getcurpos()
  exec "%g/"..input.."/y A"
  norm gg
  exec "/"..input
  silent! undojoin
  norm VGd`ApmA
  silent! undojoin
  execute 'normal! "aP'
  exec "b "..l:source_bufnr
endfunction
function GlobalMove(mode='normal', marker='A') range
  call ColmmandInfo()
  if mode=="cword"
    let input=expand('<cword>')
  elseif IsAnyVisual()
    let input=VS()[0]
    " let [l:start_line, l:start_col]=getpos("'<")[1:2]
    " let [l:end_line, l:end_col]=getpos("'>")[1:2]
    " if l:start_line == l:end_line
    "   let input=getline(l:start_line)[l:start_col-1:l:end_col-1]
    " endif
  endif
  let l:source_bufnr=bufnr('%')
  let pos=getpos("'"..a:marker)
  let buffer=pos[0]
  let l:target_bufnr = bufnr(buffer)
  let [n, y, x, n, n]=getcurpos()
  exec "%g/"..input.."/m $"
  norm gg
  exec "/"..input
  silent! undojoin
  norm VGd`ApmA
  silent! undojoin
  execute 'normal! "aP'
  exec "b "..l:source_bufnr
endfunction
function _BulkMove(marker="A") range
  silent! undojoin
  d a
  let l:source_bufnr=bufnr('%')
  let pos=getpos("'"..a:marker)
  let buffer=pos[0]
  let l:target_bufnr = bufnr(buffer)
  execute 'buffer '. l:target_bufnr
  execute "normal! '".a:marker
  silent! undojoin
  execute 'normal! "aP'
  execute 'buffer '. l:source_bufnr
endfunction
function Move(direction='l', flag='') range
  let g:CI=[ mode(0), mode(1), visualmode(1) , a:flag=='c'?1:0, a:flag=='t'?1:0 ]
  let [mode, modee, visual, command, terminalinsert] = g:CI
  let lines=VS()
  if IsAnyVisual()
    execute "'<,'>d"
  else
    execute 'normal! dd'
  endif
  let [n, y, x, n]=getpos(".")
  if a:direction==?"h"
    let h=1
  elseif a:direction==?"l"
    let l=1
  elseif a:direction==?"j"
    let j=1
  elseif a:direction==?"k"
    let k=1
  endif
  let l:target_bufnr=winbufnr(winnr(a:direction))
  if l:target_bufnr == -1 |  return | endif
  exec "wincmd "..a:direction
  call append(line('.'), lines)
  call cursor(line('.')+len(lines), x)
  let opposite={ 'j': 'k', 'k': 'j', 'h': 'l', 'l': 'h' }
  exec "wincmd "..opposite[a:direction]
  if IsAnyVisual()
    exec "norm gv"
  endif
endfunction
function MoveLinesToMarkerReverse(marker="")
    if empty(a:marker)
        let marker="A"
    else
        let marker=a:marker
    endif
  let line=getline('.')
  let pos=getpos("'"..marker)
  norm mB
  exec "norm `"..marker
  put=line
  norm `B
endfunction

command -range -nargs=0 FunctionToCommands <line1>,<line2>:call FunctionToCommands()
function FunctionToCommands() range
  " exec a:firstline..","..a:lastline.."global/^function/norm 0wyeOp0icommand -range -nargs=0 pa <line1>,<line2>:call A()"
  '<,'>global/^function/norm 0wyeOp0icommand -range -nargs=0 pa <line1>,<line2>:call A()
endfunction
