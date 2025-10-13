" Keymaps.vim

nnoremap <C-s> <Nop>
inoremap <C-s> <Nop>
vnoremap <C-s> <Nop>

if !exists("g:currentMapping")
  let currentMapping=0
endif
let mapping={
  \ "global": 1,
  \ "executor": 0,
  \ "navigator": 0,
  \ "diary": 0,
  \ }

map <F3> :call Files(expand($main_repo))<CR>
map <S-F3> :call AG()<CR>
" map <S-F3>  :exec "cd "..GetProject().." | Ag"<CR>
map <C-F3> :GFiles<CR>

cmap <F9> <C-R>I
cmap <F10> <C-R>O
cmap <F11> <C-R>P

cmap <C-k> <C-e><C-u>

noremap <leader>q :q<CR>
noremap <M-q> :q<CR>
tnoremap <M-q> <c-\><c-n>:q<CR>

vnoremap <S-F5> :<C-u>call SendCommandToTerm("h")<cr>
vnoremap <S-F6> :<C-u>call SendCommandToTerm("j")<cr>
vnoremap <S-F7> :<C-u>call SendCommandToTerm("k")<cr>
vnoremap <S-F8> :<C-u>call SendCommandToTerm("l")<cr>
nnoremap <S-F5> :call SendCommandToTerm("h")<cr>
nnoremap <S-F6> :call SendCommandToTerm("j")<cr>
nnoremap <S-F7> :call SendCommandToTerm("k")<cr>
nnoremap <S-F8> :call SendCommandToTerm("l")<cr>
inoremap <S-F5> <C-o>:call SendCommandToTerm("h")<cr>
inoremap <S-F6> <C-o>:call SendCommandToTerm("j")<cr>
inoremap <S-F7> <C-o>:call SendCommandToTerm("k")<cr>
inoremap <S-F8> <C-o>:call SendCommandToTerm("l")<cr>
cnoremap <S-F5> :call SendCommandToTerm("h", 1)<cr>
cnoremap <S-F6> :call SendCommandToTerm("j", 1)<cr>
cnoremap <S-F7> :call SendCommandToTerm("k", 1)<cr>
cnoremap <S-F8> :call SendCommandToTerm("l", 1)<cr>
tnoremap <S-F5> <C-\><C-n>:call SendCommandToTerm("h")<cr>
tnoremap <S-F6> <C-\><C-n>:call SendCommandToTerm("j")<cr>
tnoremap <S-F7> <C-\><C-n>:call SendCommandToTerm("k")<cr>
tnoremap <S-F8> <C-\><C-n>:call SendCommandToTerm("l")<cr>

" map <F5> :call RedoCommandToTerm("h")<cr>
" map <F6> :call RedoCommandToTerm("j")<cr>
" map <F7> :call RedoCommandToTerm("k")<cr>
map <F8> :w!<cr>:call RedoCommandToTerm("l")<cr>

map <C-F5> :call SigTermToTerm("h")<cr>
map <C-F6> :call SigTermToTerm("j")<cr>
map <C-F7> :call SigTermToTerm("k")<cr>
map <C-F8> :call SigTermToTerm("l")<cr>

map <C-S-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
map <C-S-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
map <C-S-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
map <C-S-F8> :w!<cr>:call RedoCommandToTermWithSigTerm("l")<cr>

vnoremap <F11> :<C-u>call Move('h')<cr>
nnoremap <F11> :call Move('h')<cr>
inoremap <F11> <C-o>:call Move('h')<cr>
cnoremap <F11> :call Move('h''c')<cr>
tnoremap <F11> <C-\><C-n>:call Move('h''t')<cr>

vnoremap <S-F11> :<C-u>call Move('l')<cr>
nnoremap <S-F11> :call Move('l')<cr>
inoremap <S-F11> <C-o>:call Move('l')<cr>
cnoremap <S-F11> :call Move('l', 'c')<cr>
tnoremap <S-F11> <C-\><C-n>:call Move('l', 't')<cr>

" noremap <F12> :call BulkMove("cword")<cr>
" vnoremap <F12> :call BulkMove("visual")<cr>

" nmap <F1>m :%    g/^\s*"/GlobalMove<cr>
" xmap <F1>m :g/^\s*"/GlobalMove<cr>

" Amap <F2> :NERDTreeFind<cr>
Amap <leader><leader>h     :call Open("h", "terminal", "new")<cr> 
Amap <leader><leader>j     :call Open("j", "terminal", "new")<cr>
Amap <leader><leader>k     :call Open("k", "terminal", "new")<cr>
Amap <leader><leader>l     :call Open("l", "terminal", "new")<cr>
Amap <leader><leader>H     :call Open("H", "terminal", "new")<cr> 
Amap <leader><leader>J     :call Open("J", "terminal", "new")<cr>
Amap <leader><leader>K     :call Open("K", "terminal", "new")<cr>
Amap <leader><leader>L     :call Open("L", "terminal", "new")<cr>
Amap <leader>h     :call Open("h", "buffer", "new")<cr> 
Amap <leader>j     :call Open("j", "buffer", "new")<cr>
Amap <leader>k     :call Open("k", "buffer", "new")<cr>
Amap <leader>l     :call Open("l", "buffer", "new")<cr>
Amap <leader>H     :call Open("H", "buffer", "new")<cr> 
Amap <leader>J     :call Open("J", "buffer", "new")<cr>
Amap <leader>K     :call Open("K", "buffer", "new")<cr>
Amap <leader>L     :call Open("L", "buffer", "new")<cr>
Amap <leader><C-h> :call Open("h", "buffer", "copy")<cr> 
Amap <leader><C-j> :call Open("j", "buffer", "copy")<cr>
Amap <leader><C-k> :call Open("k", "buffer", "copy")<cr>
Amap <leader><C-l> :call Open("l", "buffer", "copy")<cr>
Amap <leader><C-S-h> :call Open("H", "buffer", "copy")<cr> 
Amap <leader><C-S-j> :call Open("J", "buffer", "copy")<cr>
Amap <leader><C-S-k> :call Open("K", "buffer", "copy")<cr>
Amap <leader><C-S-l> :call Open("L", "buffer", "copy")<cr>

Amap <C-q> :q!<CR>
Amap <A-q> :qa!<CR>
map <C-S-q> :call TabClose()<cr>
Amap <leader><leader>r :redraw!<cr>
Amap <leader>ser  :call ServiceMenu()<cr>
Amap <S-F2> :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
Amap <leader>c call CountRegex()<cr>
" Amap <leader>c :call COP('P')<cr>
" Amap <leader>x :call CUT('P')<cr>
Amap <leader>z :call CreateMarker('P')<cr>
" Amap <leader>m :call LeaderDot("'<,'>")<cr>
" Amap <leader><leader>m :call LeaderDot("%")<cr>
" Nmap <leader>m :call LeaderDot("")<cr>
Nmap <C-S-A> :call IncRange()<cr>
Nmap <C-S-X> :call DecRange()<cr>
Vmap af :call Vaf()<cr>
Vmap if :call Vif()<cr>
Vmap <C-S-A> :call IncRange()<cr>
Vmap <C-S-X> :call DecRange()<cr>
Tmap <leader>X :TIN tail -f $receiver<cr>

map <M-h> :call TabH()<cr>
map <M-l> :call TabL()<cr>

map <C-S-M-h> :wincmd H<cr>
map <C-S-M-j> :wincmd J<cr>
map <C-S-M-k> :wincmd K<cr>
map <C-S-M-l> :wincmd L<cr>

map <leader><leader>a :call VSP()<cr>
map <C-S-h> :call SwapWin("h")<cr> 
map <C-S-j> :call SwapWin("j")<cr> 
map <C-S-k> :call SwapWin("k")<cr> 
map <C-S-l> :call SwapWin("l")<cr> 
tnoremap <C-S-h> <c-\><c-n>:call SwapWin("h")<cr> 
tnoremap <C-S-j> <c-\><c-n>:call SwapWin("j")<cr> 
tnoremap <C-S-k> <c-\><c-n>:call SwapWin("k")<cr> 
tnoremap <C-S-l> <c-\><c-n>:call SwapWin("l")<cr> 

map <m-;> :call ToggleOverviewRight()<cr>
map <leader><leader><F4> :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
map <C-S-F9> :call PreviewBuffer()<CR>
" map <M-F12> :call Info()<CR>
map <C-F2> :call ToggleWrap()<CR>
map <leader>in :call Intend()<cr>
map <leader><leader><leader><space> :IntelligentSelecting<cr>
map <leader>. @q
map <leader>s :call NvimStudioSubstitution("selection")<cr>
map <leader>S :call NvimStudioSubstitution("file")<cr>
vmap <C-l> <C-w>l
vmap <C-h> <C-w>h
vmap <C-k> <C-w>k
vmap <C-j> <C-w>j
vmap <BS> :call backspace()<CR>
vmap & :&<CR>
vmap <leader>F :echo VS()<cr>
vmap <leader><leader>g :call AppendToEndRange()<CR>
vmap <leader>G :AppendAll<CR>
vmap <leader>u :!uniq<CR>
vmap <M-v> :call VPaste("Visual")<CR>
vmap <M-c> :call VCopy("Visual")<CR>
vmap <M-x> :call VCut("Visual")<CR>
vmap <c-c> "*y
tmap <c-o> <c-\><c-n><c-o>
tnoremap <C-l> <C-\><C-n>:wincmd l<cr>
tnoremap <C-h> <C-\><C-n>:wincmd h<cr>
tnoremap <C-k> <C-\><C-n>:wincmd k<cr>
tnoremap <C-j> <C-\><C-n>:wincmd j<cr>
imap <C-l> <C-w>li
imap <C-h> <C-w>hi
" bring back in? umlaute auf c-k
" imap <C-k> <C-w>ki
imap <C-j> <C-w>ji
tmap <C-l> <C-w>l
tmap <C-h> <C-w>h
tmap <C-k> <C-w>k
tmap <C-j> <C-w>j
imap <c-w><c-w> <c-w><c-w>
tmap  :call ExitTerminal()<CR>
imap <A-'> ä
imap <A-"> Ä
imap <A-;> ö
imap <A-:> Ö
imap <A-[> ü
imap <A-{> Ü
imap <A--> ß
tmap <ScrollWheelUp> <C-\><C-n> 
tmap <S-ScrollWheelUp> <C-\><C-n>
tmap <ScrollWheelDown> <C-\><C-n>
tmap <S-ScrollWheelDown> <C-\><C-n>
tmap <Esc> i
tmap <LeftMouse> <C-\><C-n>

map <leader><leader><leader>l :call ToggleLineState()<CR>
map <leader><leader><leader>L :call ToggleLineStateGlobal()<CR>
map <leader><leader>p :call Statusline_TogglePath()<cr>

map <leader><leader>d :echo g:debug_layout<cr>
map <leader><leader>B :call Boilerplate_Test()<cr>
vmap <C-Space> :call LineUp()<cr>
map <leader><Space> :call GetCCWD()<cr>

" map <F9>  :BuildProject<cr>
" map <F10> :RunProject<cr>
" map <F11> :MakeProject<cr>
" map <F12> :CTagsProject<cr> 

map <leader><F9>   :ToggleVertical<cr>
map <F9>   :Build<cr>
map <S-F9> :ToggleC<cr>
map <C-F9> :AsyncStop<cr>
map <F10> :Run<cr>
map <S-F10> :cclose<cr>
map <C-F10> :AsyncStop<cr>

" map <F11> :Implement<cr>
" map <F12> :Implement<cr>


" nnoremap <silent> <localleader> :<c-u>WhichKey '.'<cr>

set timeoutlen=300

" colorscheme delek

nnoremap <leader><leader>eb :LayoutBash<cr>
nnoremap <leader><leader>ev :LayoutVim<cr>

nmap <F1> :RepeatLastCommand<cr>

nmap <leader>a :AddFunctionUserInput<cr>
vmap <leader>a :AddFunctionVisualSplit<cr>

" nmap <silent> <C-s> :w!<CR>
" vmap <silent> <C-s> :w!<CR>
" imap <silent> <C-s> :w!<CR>l

nmap <silent> <C-s> :SaveFile<cr>
vmap <silent> <C-s> :SaveFile<cr>
imap <silent> <C-s> :SaveFile<CR>l

nnoremap <localleader>f :InsertFunction<CR>
nnoremap <space>f :InsertFilename<CR>

map <leader>c :call CTags()<cr>

" map <F2> :call ToggleZoom()<cr>
map <C-Space> :call ToggleZoom()<cr>

map <silent> <S-F1> :SearchCword<cr>

map <F1> :call EXEC()<cr>
map <S-F1> :EXECINPUT<cr>
map <leader><F1> :EXECTOGGLE<cr>
map <leader><leader><F1> :INTERPRETERTOGGLE<cr>

map <leader>v :call VIM(VS())<cr>
map <leader>b :call BASH(VS())<cr>
map <leader>p :call PYTHON(VS())<cr>
map <leader>r :call RUST(VS())<cr>

map <localleader>iv :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
map <localleader>ib :call BASH(input("bash: "), 'exec_input_vs')<cr>
map <localleader>ip :call PYTHON(input("python: "), 'exec_input_vs')<cr>
map <localleader>ir :call RUST(input("rust: "), 'exec_input_vs')<cr>


nnoremap <space>p :CopyFileNameToClipboard<CR>
nnoremap <space>P :CopyWholePathToClipboard<CR>
nnoremap <space>r :InsertReceiver<CR>
nnoremap <leader>dd :call Rewindworkdir()<cr>

nnoremap <C-p>              :OpenFileFZFProject<CR>
nnoremap <C-S-p>            :OpenFileFZFRepo<CR>
nnoremap <C-A-p>            :OpenFileFZFSystem<CR>

nnoremap <C-g>              :OpenFileCommandLineProject<CR>
nnoremap <C-S-g>            :OpenFileCommandLineRepo<CR>
nnoremap <C-A-g>            :OpenFileCommandLineSystem<CR>

nnoremap <leader>f              :OpenFileCommandLineSameDir<CR>
nnoremap <C-i> <C-i>
nnoremap <Tab>                  :OpenFileCommandLineSameDir<CR>
nnoremap <C-S-Tab> :call PreviousFile()<cr>
nnoremap <C-Tab> :call NextFile()<cr>

nnoremap <leader>cd :call MakeDirCurrentCWD()<cr>
" :MakeDirCurrentProject<cr>
" nnoremap <leader>.. :call CD('..')<cr>
nnoremap <leader><leader> :call CD('..')<cr>
nnoremap .. :call CD(split(w:file,'/')[0])<cr>

nnoremap <C-Left> :call CD('..')<cr>
nnoremap <C-Right> :call CD(split(w:file,'/')[0])<cr>

" nnoremap <leader><leader>         :JumpProjectUp<cr>
" nnoremap <>>  :JumpProjectStepwise<cr>
" nnoremap <localleader><localleader>   :JumpProjectUp<cr>
" nnoremap <localleader><leader>        :JumpProjectR<cr>
" nnoremap <leader><localleader>        :JumpProjectR<cr>
" nnoremap <C-Up>                       :JumpProjectDump<cr>

nnoremap <leader><Tab>      :JumpProjectIn<cr>
nnoremap <localleader><Tab> :JumpProjectIn<cr>

vnoremap <F14> :<C-u>call VS()<cr>
nnoremap <F13> :call VS()<cr>
inoremap <F13> <C-o>:call VS()<cr>
cnoremap <F13> :call VS('c')<cr>
tnoremap <F13> <C-\><C-n>:call VS('t')<cr>

nmap <M-v> :call FuncPaste("Normal")<CR>
nmap <M-c> :call FuncCopy("Normal")<CR>
nmap <M-x> :call FuncCut("Normal")<CR>
noremap <leader><leader><leader>j :IntelligentJumping<cr>

" exec "nmap <leader>R :!bash ".g:lastRunCommand." -e ".$workdir."/.bashrc<cr>"
" exec "nmap <leader>r :!bash ".g:lastRunCommand." -e ".$workdir."/.bashrc<cr>"
menu Run.Show :call ToggleRun() 
menu Projects.Show :call ToggleProjects() 
nmap <silent> <c-h> :wincmd h<cr>
nmap <silent> <c-j> :wincmd j<cr>
nmap <silent> <c-k> :wincmd k<cr>
nmap <silent> <c-l> :wincmd l<cr>
menu Actions.SED :call NvimStudioSubstitution()<cr>
" noremap <leader>v :normal viW"ay<cr>:echo <c-r>a<cr>
vnoremap <silent> p "_dP
vnoremap <silent> y y:call ClipboardYank()<CR>
vnoremap <silent> d d:call ClipboardYank()<CR>
nnoremap <silent> dd dd:call ClipboardYank()<CR>
nnoremap <silent> p :call ClipboardPaste("n")<CR>p
vnoremap p :<C-U>let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<CR>p
nmap <BS> :call backspaceN()<CR>
cmap <A-'> ä
cmap <A-"> Ä
cmap <A-;> ö
cmap <A-:> Ö
cmap <A-[> ü
cmap <A-{> Ü
cmap <A--> ß
nmap <leader>F :echo VS()<cr>
nmap <leader>g :call AppendToEndNormal()<CR>
nmap <leader>G :AppendAll<CR>
nnoremap YY :call AppendToClipboard()<CR>
vnoremap Y :<C-u>let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<CR>
noremap <expr> <leader><leader>s ShowMode()

" Move Lines
nnoremap <silent> <A-k> :m-2<cr>
nnoremap <silent> <A-j> :m+1<cr>
vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
vnoremap <silent> <A-j> :m '>+1<CR>gv=gv

noremap < <<
noremap > >>

vnoremap < <gv
vnoremap > >gv

map <leader>dt :diffthis<cr>
map <leader>do :diffoff<cr>

map <leader>0 :wincmd =<cr>

inoremap <C-Space> <C-x><C-f>
noremap <leader>ga :!git add .<cr>
noremap <leader>gs :!git status %<cr>

function Ut(...)
  " strpart({src}, {start} [, {len} [, {chars}]])
  " strcharpart({src}, {start} [, {len} [, {skipcc}]])		*strcharpart()*
  " byteidx({expr}, {nr} [, {utf16}])			*byteidx()*
  " stridx(haystack, needle)
  let a=stridx(a:3, '(')
  let b=stridx(a:3, ')')
  let function_name=strpart(a:3, 0, a)
  " echo function_name
  let args=strpart(a:3, a+1, b-a-1)
  " echo args
  exec "vnoremap"a:1":<C-u>call"function_name."(".args.")<cr>"
  exec "nnoremap"a:1":call"function_name."(".args.")<cr>"
  exec "inoremap"a:1"<C-o>:call"function_name."(".args.")<cr>"
  let seperator=len(args)>0?', ':''
  exec "cnoremap"a:1":call"function_name."(".args.seperator."'c')<cr>"
  exec "tnoremap"a:1"<C-\><C-n>:call"function_name."(".args.seperator."'t')<cr>"
endfunction
command -range -nargs=+ Ut call Ut(<f-args>)

Ut <F12> :call QuickYank()<cr>
Ut <S-F12> :call QuickYank('paste')<cr>
Ut <C-F12> :call QuickYank('init')<cr>

" vnoremap <C-S-v> :<C-u><cr>
nnoremap <C-S-v> :norm "+p
inoremap <C-S-v> <c-r>+
" nnoremap <C-v> :norm "+p
" inoremap <C-v> <c-r>+
" nnoremap <C-v>
" inoremap <C-v>
map <leader>v :visualblock<cr>
" inoremap <C-S-v> <C-o>:<cr>
" cnoremap <C-S-v> :<cr>
" tnoremap <C-S-v> <C-\><C-n>:<cr>
" let seperator=len(args)>0?', ':''

map <F12> :call setreg('*', CWD()[0]..'/'..expand('%')..':'..line('.'))<cr>
map <S-F12> i<c-r>*

" map <leader><F5> :call RegisterTerminal()<cr>
" map <leader><F6> :call RegisterTerminal()<cr>
" map <leader><F7> :call RegisterTerminal()<cr>
" map <leader><F8> :call RegisterTerminal()<cr>
map <leader><F5> :call FixTargetTerm('F5')<cr>
map <leader><F6> :call FixTargetTerm('F6')<cr>
map <leader><F7> :call FixTargetTerm('F7')<cr>
map <leader><F8> :call FixTargetTerm('F8')<cr>

map <F5> :call ExecuteN('n', 'F5')<cr>
map <F6> :call ExecuteN('n', 'F6')<cr>
map <F7> :call ExecuteN('n', 'F7')<cr>
map <F8> :call ExecuteN('n', 'F8')<cr>
map <S-F5> :call ExecuteN('s', 'F5')<cr>
map <S-F6> :call ExecuteN('s', 'F6')<cr>
map <S-F7> :call ExecuteN('s', 'F7')<cr>
map <S-F8> :call ExecuteN('s', 'F8')<cr>
