import autoload "./Functions.vim9" as F

function! NewMap(...)
  let args=split(a:000[0], ' ')
  let map = join(args[0:], ' ')
  " :call F.Map.new(name, map)
  try
    exec map
  endtry
  " let name = a:000[:0][0]
  " let arg = a:000[1:]
  " call F.NewAssignment(name, arg)
endfunction
command! -range -nargs=+ NewMap call NewMap(<q-args>)

" Keymaps.vim
NewMap nnoremap <C-s> <Nop>
NewMap inoremap <C-s> <Nop>
NewMap vnoremap <C-s> <Nop>

NewMap map <leader><leader>f :call FavoriteFile()<CR>
NewMap map <leader><leader>f :call FavoriteFile()<CR>
NewMap map <leader><leader>p :call FavoritePath()<CR>
NewMap map <C-8> :call Favorite()<CR>

NewMap map <leader>= :Equal<cr>

NewMap map <leader>w :call ToggleZoom()<cr>
" map <C-Space> :call ToggleZoom()<cr>
NewMap nnoremap ,s :so %<cr>
"
NewMap map <C-Space> :call SelectCommand()<cr>


NewMap map <leader>t :Tidy<cr>

if !exists("g:currentMapping")
  let currentMapping=0
endif
let mapping={
  \ "global": 1,
  \ "executor": 0,
  \ "navigator": 0,
  \ "diary": 0,
  \ }

" cmap <F9> <C-R>I
" cmap <F10> <C-R>O
" cmap <F11> <C-R>P

NewMap noremap <leader>q :q<CR>
NewMap noremap <M-q> :q<CR>
NewMap tnoremap <M-q> <c-\><c-n>:q<CR>

NewMap vnoremap <A-C-h> :<C-u>call SendCommandToTerm("h")<cr>
NewMap vnoremap <A-C-j> :<C-u>call SendCommandToTerm("j")<cr>
NewMap vnoremap <A-C-k> :<C-u>call SendCommandToTerm("k")<cr>
NewMap vnoremap <A-C-l> :<C-u>call SendCommandToTerm("l")<cr>
NewMap nnoremap <A-C-h> :call SendCommandToTerm("h")<cr>
NewMap nnoremap <A-C-j> :call SendCommandToTerm("j")<cr>
NewMap nnoremap <A-C-k> :call SendCommandToTerm("k")<cr>
NewMap nnoremap <A-C-l> :call SendCommandToTerm("l")<cr>
NewMap inoremap <A-C-h> <C-o>:call SendCommandToTerm("h")<cr>
NewMap inoremap <A-C-j> <C-o>:call SendCommandToTerm("j")<cr>
NewMap inoremap <A-C-k> <C-o>:call SendCommandToTerm("k")<cr>
NewMap inoremap <A-C-l> <C-o>:call SendCommandToTerm("l")<cr>
NewMap cnoremap <A-C-h> :call SendCommandToTerm("h", 1)<cr>
NewMap cnoremap <A-C-j> :call SendCommandToTerm("j", 1)<cr>
NewMap cnoremap <A-C-k> :call SendCommandToTerm("k", 1)<cr>
NewMap cnoremap <A-C-l> :call SendCommandToTerm("l", 1)<cr>
NewMap tnoremap <A-C-h> <C-\><C-n>:call SendCommandToTerm("h")<cr>
NewMap tnoremap <A-C-j> <C-\><C-n>:call SendCommandToTerm("j")<cr>
NewMap tnoremap <A-C-k> <C-\><C-n>:call SendCommandToTerm("k")<cr>
NewMap tnoremap <A-C-l> <C-\><C-n>:call SendCommandToTerm("l")<cr>

" map <F5> :call RedoCommandToTerm("h")<cr>
" map <F6> :call RedoCommandToTerm("j")<cr>
" map <F7> :call RedoCommandToTerm("k")<cr>
NewMap map <F8> :w!<cr>:call RedoCommandToTerm("l")<cr>

NewMap map <C-F5> :call SigTermToTerm("h")<cr>
NewMap map <C-F6> :call SigTermToTerm("j")<cr>
NewMap map <C-F7> :call SigTermToTerm("k")<cr>
NewMap map <C-F8> :call SigTermToTerm("l")<cr>

NewMap map <C-S-F5> :call RedoCommandToTermWithSigTerm("h")<cr>
NewMap map <C-S-F6> :call RedoCommandToTermWithSigTerm("j")<cr>
NewMap map <C-S-F7> :call RedoCommandToTermWithSigTerm("k")<cr>
NewMap map <C-S-F8> :w!<cr>:call RedoCommandToTermWithSigTerm("l")<cr>

NewMap vnoremap <F11> :<C-u>call Move('h')<cr>
NewMap nnoremap <F11> :call Move('h')<cr>
NewMap inoremap <F11> <C-o>:call Move('h')<cr>
NewMap cnoremap <F11> :call Move('h''c')<cr>
NewMap tnoremap <F11> <C-\><C-n>:call Move('h''t')<cr>

NewMap vnoremap <S-F11> :<C-u>call Move('l')<cr>
NewMap nnoremap <S-F11> :call Move('l')<cr>
NewMap inoremap <S-F11> <C-o>:call Move('l')<cr>
NewMap cnoremap <S-F11> :call Move('l', 'c')<cr>
NewMap tnoremap <S-F11> <C-\><C-n>:call Move('l', 't')<cr>

" noremap <F12> :call BulkMove("cword")<cr>
" vnoremap <F12> :call BulkMove("visual")<cr>

" nmap <F1>m :%    g/^\s*"/GlobalMove<cr>
" xmap <F1>m :g/^\s*"/GlobalMove<cr>

" Amap <F2> :NERDTreeFind<cr>
"
"
NewMap Amap <leader>h     :call Open("h", "buffer", "new")<cr>
NewMap Amap <leader>j     :call Open("j", "buffer", "new")<cr>
NewMap Amap <leader>k     :call Open("k", "buffer", "new")<cr>
NewMap Amap <leader>l     :call Open("l", "buffer", "new")<cr>
NewMap Amap <leader>H     :call Open("H", "buffer", "new")<cr>
NewMap Amap <leader>J     :call Open("J", "buffer", "new")<cr>
NewMap Amap <leader>K     :call Open("K", "buffer", "new")<cr>
NewMap Amap <leader>L     :call Open("L", "buffer", "new")<cr>
NewMap Amap <leader><leader>h     :call Open("h", "terminal", "new")<cr>
NewMap Amap <leader><leader>j     :call Open("j", "terminal", "new")<cr>
NewMap Amap <leader><leader>k     :call Open("k", "terminal", "new")<cr>
NewMap Amap <leader><leader>l     :call Open("l", "terminal", "new")<cr>
NewMap Amap <leader><leader>H     :call Open("H", "terminal", "new")<cr>
NewMap Amap <leader><leader>J     :call Open("J", "terminal", "new")<cr>
NewMap Amap <leader><leader>K     :call Open("K", "terminal", "new")<cr>
NewMap Amap <leader><leader>L     :call Open("L", "terminal", "new")<cr>
"
" Amap <A-h>     :call Open("h", "buffer", "new")<cr>
" Amap <A-j>     :call Open("j", "buffer", "new")<cr>
" Amap <A-k>     :call Open("k", "buffer", "new")<cr>
" Amap <A-l>     :call Open("l", "buffer", "new")<cr>
NewMap Amap <A-H>     :call Open("H", "buffer", "new")<cr> 
NewMap Amap <A-J>     :call Open("J", "buffer", "new")<cr>
NewMap Amap <A-K>     :call Open("K", "buffer", "new")<cr>
NewMap Amap <A-L>     :call Open("L", "buffer", "new")<cr>
NewMap Amap <A-S-h>     :call Open("h", "terminal", "new")<cr> 
NewMap Amap <A-S-j>     :call Open("j", "terminal", "new")<cr>
NewMap Amap <A-S-k>     :call Open("k", "terminal", "new")<cr>
NewMap Amap <A-S-l>     :call Open("l", "terminal", "new")<cr>
NewMap Amap <A-S-H>     :call Open("H", "terminal", "new")<cr> 
NewMap Amap <A-S-J>     :call Open("J", "terminal", "new")<cr>
NewMap Amap <A-S-K>     :call Open("K", "terminal", "new")<cr>
NewMap Amap <A-S-L>     :call Open("L", "terminal", "new")<cr>
" Amap <leader><C-h> :call Open("h", "buffer", "copy")<cr> 
" Amap <leader><C-j> :call Open("j", "buffer", "copy")<cr>
" Amap <leader><C-k> :call Open("k", "buffer", "copy")<cr>
" Amap <leader><C-l> :call Open("l", "buffer", "copy")<cr>
" Amap <leader><C-S-h> :call Open("H", "buffer", "copy")<cr> 
" Amap <leader><C-S-j> :call Open("J", "buffer", "copy")<cr>
" Amap <leader><C-S-k> :call Open("K", "buffer", "copy")<cr>
" Amap <leader><C-S-l> :call Open("L", "buffer", "copy")<cr>

NewMap Amap <A-S-Left>     :call Open("h", "terminal", "new")<cr> 
NewMap Amap <A-S-Down>     :call Open("j", "terminal", "new")<cr>
NewMap Amap <A-S-Up>       :call Open("k", "terminal", "new")<cr>
NewMap Amap <A-S-Right>    :call Open("l", "terminal", "new")<cr>
NewMap Amap <A-S-Left>     :call Open("H", "terminal", "new")<cr> 
NewMap Amap <A-S-Down>     :call Open("J", "terminal", "new")<cr>
NewMap Amap <A-S-Up>       :call Open("K", "terminal", "new")<cr>
NewMap Amap <A-S-Right>    :call Open("L", "terminal", "new")<cr>
NewMap Amap <A-Left>       :call Open("h", "buffer", "new")<cr>
NewMap Amap <A-Down>       :call Open("j", "buffer", "new")<cr>
NewMap Amap <A-Up>         :call Open("k", "buffer", "new")<cr>
NewMap Amap <A-Right>      :call Open("l", "buffer", "new")<cr>
NewMap Amap <A-Left>       :call Open("H", "buffer", "new")<cr>
NewMap Amap <A-Down>       :call Open("J", "buffer", "new")<cr>
NewMap Amap <A-Up>         :call Open("K", "buffer", "new")<cr>
NewMap Amap <A-Right>      :call Open("L", "buffer", "new")<cr>
" Amap <A-<C-h>> :call Open("h", "buffer", "copy")<cr> 
" Amap <A-<C-j>> :call Open("j", "buffer", "copy")<cr>
" Amap <A-<C-k>> :call Open("k", "buffer", "copy")<cr>
" Amap <A-<C-l>> :call Open("l", "buffer", "copy")<cr>
" Amap <A-<C-S-h>> :call Open("H", "buffer", "copy")<cr> 
" Amap <A-<C-S-j>> :call Open("J", "buffer", "copy")<cr>
" Amap <A-<C-S-k>> :call Open("K", "buffer", "copy")<cr>
" Amap <A-<C-S-l>> :call Open("L", "buffer", "copy")<cr>

NewMap Amap <leader>q :q!<CR>
NewMap Amap <C-q> :bd!<CR>
NewMap Amap <C-A-q> :qa!<CR>
NewMap Amap <A-q> :call TabClose()<cr>
NewMap Amap <leader><leader>r :redraw!<cr>
" Amap <leader>ser  :call ServiceMenu()<cr>
NewMap Amap <S-F2> :let x=input("Find In Files: ") \| :echo system("grep ".expand('%')." -nrw -e \"".x."\"")<cr>
NewMap Amap <leader>c call CountRegex()<cr>
" Amap <leader>c :call COP('P')<cr>
" Amap <leader>x :call CUT('P')<cr>
NewMap Amap <leader>z :call CreateMarker('P')<cr>
" Amap <leader>m :call LeaderDot("'<,'>")<cr>
" Amap <leader><leader>m :call LeaderDot("%")<cr>
" Nmap <leader>m :call LeaderDot("")<cr>
NewMap Nmap <C-S-A> :call IncRange()<cr>
NewMap Nmap <C-S-X> :call DecRange()<cr>
NewMap vmap af :call Vaf()<cr>
NewMap vmap if :call Vif()<cr>
NewMap vmap <C-S-A> :call IncRange()<cr>
NewMap vmap <C-S-X> :call DecRange()<cr>
NewMap tmap <leader>X :TIN tail -f $receiver<cr>

" map <leader>h :call TabH()<cr>
" map <leader>t :call TabL()<cr>

" map <leader>g :call TabH()<cr>
" map <leader>h :call TabL()<cr>

NewMap map <A-h> :call TabH()<cr>
NewMap map <A-l> :call TabL()<cr>

NewMap map <C-S-M-h> :wincmd H<cr>
NewMap map <C-S-M-j> :wincmd J<cr>
NewMap map <C-S-M-k> :wincmd K<cr>
NewMap map <C-S-M-l> :wincmd L<cr>

NewMap map <leader><leader>a :call VSP()<cr>
NewMap map <C-S-h> :call SwapWin("h")<cr> 
NewMap map <C-S-j> :call SwapWin("j")<cr> 
NewMap map <C-S-k> :call SwapWin("k")<cr> 
NewMap map <C-S-l> :call SwapWin("l")<cr> 
NewMap tnoremap <C-S-h> <c-\><c-n>:call SwapWin("h")<cr> 
NewMap tnoremap <C-S-j> <c-\><c-n>:call SwapWin("j")<cr> 
NewMap tnoremap <C-S-k> <c-\><c-n>:call SwapWin("k")<cr> 
NewMap tnoremap <C-S-l> <c-\><c-n>:call SwapWin("l")<cr> 

NewMap nnoremap <leader>fuc :call OpenFileUnderCursor()<cr>
NewMap nnoremap <leader><leader>fb :LayoutBash<cr>
NewMap nnoremap <leader><leader>fv :LayoutVim<cr>

NewMap map <m-;> :call ToggleOverviewRight()<cr>
NewMap map <leader><leader><F4> :redraw \\| let c=input("Test: ")<cr>!source ".$workdir."/.bashrc; git_selector "TEST"
NewMap map <C-S-F9> :call PreviewBuffer()<CR>
" map <M-F12> :call Info()<CR>
NewMap map <C-F2> :call ToggleWrap()<CR>
NewMap map <leader><leader><leader>w :call ToggleWrap()<CR>
NewMap map <leader>in :call Intend()<cr>
NewMap map <leader><leader><leader><space> :IntelligentSelecting<cr>
NewMap map <leader>. @q
" map <leader>s :call NvimStudioSubstitution("selection")<cr>
" map <leader>S :call NvimStudioSubstitution("file")<cr>
NewMap vmap <C-l> <C-w>l
NewMap vmap <C-h> <C-w>h
NewMap vmap <C-k> <C-w>k
NewMap vmap <C-j> <C-w>j
NewMap vmap <BS> :call backspace()<CR>
NewMap vmap & :&<CR>
NewMap vmap <leader>F :echo VS()<cr>
NewMap vmap <leader><leader>g :call AppendToEndRange()<CR>
NewMap vmap <leader>G :AppendAll<CR>
NewMap vmap <leader>u :!uniq<CR>
NewMap vmap <M-v> :call VPaste("Visual")<CR>
NewMap vmap <M-c> :call VCopy("Visual")<CR>
NewMap vmap <M-x> :call VCut("Visual")<CR>
NewMap vmap <c-c> "*y
NewMap tmap <c-o> <c-\><c-n><c-o>
NewMap tnoremap <C-l> <C-\><C-n>:wincmd l<cr>
NewMap tnoremap <C-h> <C-\><C-n>:wincmd h<cr>
NewMap tnoremap <C-k> <C-\><C-n>:wincmd k<cr>
NewMap tnoremap <C-j> <C-\><C-n>:wincmd j<cr>
NewMap imap <C-l> <C-w>li
NewMap imap <C-h> <C-w>hi
" bring back in? umlaute auf c-k
" imap <C-k> <C-w>ki
NewMap imap <C-j> <C-w>ji
NewMap tmap <C-l> <C-w>l
NewMap tmap <C-h> <C-w>h
NewMap tmap <C-k> <C-w>k
NewMap tmap <C-j> <C-w>j
NewMap imap <c-w><c-w> <c-w><c-w>
NewMap tmap  :call ExitTerminal()<CR>
NewMap imap <A-'> ä
NewMap imap <A-"> Ä
NewMap imap <A-;> ö
NewMap imap <A-:> Ö
NewMap imap <A-[> ü
NewMap imap <A-{> Ü
NewMap imap <A--> ß
NewMap tmap <ScrollWheelUp> <C-\><C-n> 
NewMap tmap <S-ScrollWheelUp> <C-\><C-n>
NewMap tmap <ScrollWheelDown> <C-\><C-n>
NewMap tmap <S-ScrollWheelDown> <C-\><C-n>
NewMap tmap <Esc> i
NewMap tmap <LeftMouse> <C-\><C-n>

NewMap map <leader><leader><leader>m :call Toggle_Set_Last_Git_Message()<CR>
NewMap map <leader><leader><leader>l :call ToggleLineState()<CR>
NewMap map <leader><leader><leader>L :call ToggleLineStateGlobal()<CR>
NewMap map <leader><leader>s :call Statusline_TogglePath()<cr>

NewMap map <leader><leader>d :echo g:debug_layout<cr>
NewMap map <leader><leader>B :call Boilerplate_Test()<cr>
" vmap <C-Space> :call LineUp()<cr>
NewMap map <leader><Space> :call GetCCWD()<cr>

" map <F9>  :BuildProject<cr>
" map <F10> :RunProject<cr>
" map <F11> :MakeProject<cr>
" map <F12> :CTagsProject<cr> 

""" map <leader><F9>   :ToggleVertical<cr>
""" map <F9>   :Build<cr>
""" map <S-F9> :ToggleC<cr>
""" map <C-F9> :AsyncStop<cr>
""" map <F10> :Run<cr>
""" map <S-F10> :cclose<cr>
""" map <C-F10> :AsyncStop<cr>

" nnoremap <silent> <localleader> :<c-u>WhichKey '.'<cr>

" set timeoutlen=300

" colorscheme delek

" nmap <F1> :RepeatLastCommand<cr>

NewMap nmap <leader>a :AddFunctionUserInput<cr>
NewMap vmap <leader>a :AddFunctionVisualSplit<cr>

" nmap <silent> <C-s> :w!<CR>
" vmap <silent> <C-s> :w!<CR>
" imap <silent> <C-s> :w!<CR>l

NewMap nmap <silent> <C-s> :SaveFile<cr>
NewMap vmap <silent> <C-s> :SaveFile<cr>
NewMap imap <silent> <C-s> :SaveFile<CR>l

NewMap nnoremap <localleader>f :InsertFunction<CR>
NewMap nnoremap <space>f :InsertFilename<CR>

" map <leader>c :call CTags()<cr>

" map <F2> :call ToggleZoom()<cr>
NewMap map <C-Space> :call ToggleZoom()<cr>

NewMap map <silent> <S-F1> :SearchCword<cr>

" map <F1> :call EXEC()<cr>
" map <S-F1> :EXECINPUT<cr>
NewMap map <leader><F1> :EXECTOGGLE<cr>
NewMap map <leader><leader><F1> :INTERPRETERTOGGLE<cr>

" map <leader>v :call VIM(VS())<cr>
" map <leader>b :call BASH(VS())<cr>
" map <leader>p :call PYTHON(VS())<cr>
" map <leader>r :call RUST(VS())<cr>

NewMap map <localleader>iv :call VIM(input("vimscript: "), 'exec_input_vs')<cr>
NewMap map <localleader>ib :call BASH(input("bash: "), 'exec_input_vs')<cr>
NewMap map <localleader>ip :call PYTHON(input("python: "), 'exec_input_vs')<cr>
NewMap map <localleader>ir :call RUST(input("rust: "), 'exec_input_vs')<cr>

NewMap nnoremap <space>p :CopyFileNameToClipboard<CR>
NewMap nnoremap <space>P :CopyWholePathToClipboard<CR>
NewMap nnoremap <space>r :InsertReceiver<CR>
NewMap nnoremap <leader>dd :call Rewindworkdir()<cr>

"" nnoremap <C-p>              :OpenFileFZFProject<CR>
"" nnoremap <A-p>              :OpenFileFZFRepo<CR>
"" nnoremap <A-S-p>            :call OpenFileFZFRepo(1)<CR>
"" nnoremap <A-S-C-p>          :call OpenFileFZFRepo(2)<CR>
"" nnoremap <C-A-p>            :OpenFileFZFSystem<CR>
"" " nnoremap <C-S-p>            :OpenFileFZFRepo<CR>
"" nnoremap <C-->              :FindInFileFZFProject<CR>
"" nnoremap <A-->              :FindInFileFZFRepo<CR>
"" nnoremap <A-S-->            :call FindInFileFZFRepo(1)<CR>
"" nnoremap <A-S-C-->          :call FindInFileFZFRepo(2)<CR>
"" nnoremap <C-A-->            :FindInFileFZFSystem<CR>
"" " nnoremap <C-S-p>            :FindInFileFZFRepo<CR>

NewMap map <leader><C-p>                                         :call Files(Folder_Up(1))<cr>
NewMap map <leader><leader><C-p>                                 :call Files(Folder_Up(2))<cr>
NewMap map <leader><leader><leader><C-p>                         :call Files(Folder_Up(3))<cr>
NewMap map <leader><leader><leader><leader><C-p>                 :call Files(Folder_Up(4))<cr>
NewMap map <leader><leader><leader><leader><leader><C-p>         :call Files(Folder_Up(5))<cr>
NewMap map <leader><leader><leader><leader><leader><leader><C-p> :call Files(Folder_Up(6))<cr>
NewMap map <leader><C-g>                                         :call AgIn(Folder_Up(1))<cr>
NewMap map <leader><leader><C-g>                                 :call AgIn(Folder_Up(2))<cr>
NewMap map <leader><leader><leader><C-g>                         :call AgIn(Folder_Up(3))<cr>
NewMap map <leader><leader><leader><leader><C-g>                 :call AgIn(Folder_Up(4))<cr>
NewMap map <leader><leader><leader><leader><leader><C-g>         :call AgIn(Folder_Up(5))<cr>
NewMap map <leader><leader><leader><leader><leader><leader><C-g> :call AgIn(Folder_Up(6))<cr>

NewMap noremap <C-p>              :call Files(Folder_Project())<CR>
NewMap noremap <C-S-p>            :call Files(Folder_Repo())<CR>
NewMap noremap <A-p>              :call Files(Folder_Repo())<CR>
NewMap noremap <A-S-p>            :call Files(Folder_Repo(1))<CR>
NewMap noremap <A-C-p>            :call Files(Folder_Repo(1))<CR>
NewMap noremap <A-S-C-p>          :call Files('/')<CR>
" noremap <A-S-C-p>            :call Files(Folder_System())<CR>
" nnoremap <C-S-p>          :OpenFileFZFRepo<CR>
"
NewMap noremap <C-g>              :call AgIn(Folder_Project())<CR>
NewMap noremap <C-S-g>            :call AgIn(Folder_Repo())<CR>
NewMap noremap <A-g>              :call AgIn(Folder_Repo())<CR>
NewMap noremap <A-S-g>            :call AgIn(Folder_Repo(1))<CR>
NewMap noremap <A-C-g>            :call AgIn(Folder_Repo(1))<CR>
NewMap noremap <A-S-C-g>          :call AgIn('/'))<CR>
" noremap <A-S-C-g>            :call AgIn(Folder_System())<CR>
"  nnoremap <C-S-p>          :OpenFileFZFRepo<CR>


" map <F3> :call Files(expand($main_repo))<CR>
" map <S-F3>  :exec "cd "..GetProject().." | Ag"<CR>

" nnoremap <C-g>              :OpenFileCommandLineProject<CR>
" nnoremap <C-S-g>            :OpenFileCommandLineRepo<CR>
" nnoremap <C-A-g>            :OpenFileCommandLineSystem<CR>

NewMap nnoremap <leader>o              :OpenFileCommandLineSameDir<CR>
NewMap nnoremap <leader>.              :OpenFileCommandLineCWD<CR>
NewMap nnoremap <leader><leader>.      :OpenFileCommandLineSameDir<CR>
NewMap nnoremap <Tab>                  :OpenFileCommandLineCWD<CR>
NewMap nnoremap <S-Tab>                :OpenFileCommandLineCWD<CR>
NewMap nnoremap <C-i> <C-i>

NewMap nnoremap <C-S-Tab> :call PreviousFile()<cr>
NewMap nnoremap <C-Tab> :call NextFile()<cr>

NewMap nnoremap <C-S-Tab> :call PreviousFile_completefunc()<cr>
NewMap nnoremap <C-Tab> :call NextFile_completefunc()<cr>

NewMap nnoremap <C-S-Tab> :call StepFile_popup(0, 0)<cr>
NewMap nnoremap <C-Tab> :call StepFile_popup(0, 0)<cr>

" Add functionality, to delete the last dir
NewMap cnoremap <C-,> <Backspace>
NewMap cnoremap <C-.> <Backspace>

" nnoremap <S-Tab> :call StepFile_popup(0, 0)<cr>
" nnoremap <Tab> :call StepFile_popup(0, 0)<cr>

NewMap nnoremap <leader>cd :call MakeDirCurrentCWD()<cr>
" :MakeDirCurrentProject<cr>
" nnoremap <leader>.. :call CD('..')<cr>
" nnoremap <leader><leader> :call CD('..')<cr>
"" nnoremap .. :call CD(split(w:relative_path,'/')[0])<cr>
" unmap ..

NewMap nnoremap <C-Left> :call CD(WFilePrev())<cr>
NewMap nnoremap <C-Right> :call CD(WFileNext())<cr>

NewMap nnoremap <C-,> :call CD(WFilePrev())<cr>
NewMap nnoremap <C-.> :call CD(WFileNext())<cr>

" nnoremap <leader><leader>         :JumpProjectUp<cr>
" nnoremap <>>  :JumpProjectStepwise<cr>
" nnoremap <localleader><localleader>   :JumpProjectUp<cr>
" nnoremap <localleader><leader>        :JumpProjectR<cr>
" nnoremap <leader><localleader>        :JumpProjectR<cr>
" nnoremap <C-Up>                       :JumpProjectDump<cr>

NewMap nnoremap <leader><Tab>      :JumpProjectIn<cr>
NewMap nnoremap <localleader><Tab> :JumpProjectIn<cr>

NewMap vnoremap <F14> :<C-u>call VS()<cr>
NewMap nnoremap <F13> :call VS()<cr>
NewMap inoremap <F13> <C-o>:call VS()<cr>
NewMap cnoremap <F13> :call VS('c')<cr>
NewMap tnoremap <F13> <C-\><C-n>:call VS('t')<cr>

NewMap nmap <M-v> :call FuncPaste("Normal")<CR>
NewMap nmap <M-c> :call FuncCopy("Normal")<CR>
NewMap nmap <M-x> :call FuncCut("Normal")<CR>
NewMap noremap <leader><leader><leader>j :IntelligentJumping<cr>

" exec "nmap <leader>R :!bash ".g:lastRunCommand." -e ".$workdir."/.bashrc<cr>"
" exec "nmap <leader>r :!bash ".g:lastRunCommand." -e ".$workdir."/.bashrc<cr>"
menu Run.Show :call ToggleRun() 
menu Projects.Show :call ToggleProjects() 
NewMap nmap <silent> <c-h> :wincmd h<cr>
NewMap nmap <silent> <c-j> :wincmd j<cr>
NewMap nmap <silent> <c-k> :wincmd k<cr>
NewMap nmap <silent> <c-l> :wincmd l<cr>
" menu Actions.SED :call NvimStudioSubstitution()<cr>
" noremap <leader>v :normal viW"ay<cr>:echo <c-r>a<cr>
NewMap vnoremap <silent> p "_dP
NewMap vnoremap <silent> y y:call ClipboardYank()<CR>
NewMap vnoremap <silent> d d:call ClipboardYank()<CR>
NewMap nnoremap <silent> dd dd:call ClipboardYank()<CR>
NewMap nnoremap <silent> p :call ClipboardPaste("n")<CR>p
NewMap vnoremap p :<C-U>let vlcb = getpos("'<")[1:2] \| let vlce = getpos("'>")[1:2] \| call ClipboardPaste("v")<CR>p
NewMap nmap <BS> :call backspaceN()<CR>
NewMap cmap <A-'> ä
NewMap cmap <A-"> Ä
NewMap cmap <A-;> ö
NewMap cmap <A-:> Ö
NewMap cmap <A-[> ü
NewMap cmap <A-{> Ü
NewMap cmap <A--> ß
NewMap nmap <leader>F :echo VS()<cr>
NewMap nmap <leader>g :call AppendToEndNormal()<CR>
NewMap nmap <leader>G :AppendAll<CR>
NewMap nnoremap YY :call AppendToClipboard()<CR>
NewMap vnoremap Y :<C-u>let @+ = @+ . join(getline("'<", "'>"), "\n") . "\n"<CR>
" noremap <expr> <leader><leader>s ShowMode()

" Move Lines
NewMap nnoremap <silent> <A-k> :m-2<cr>
NewMap nnoremap <silent> <A-j> :m+1<cr>
NewMap vnoremap <silent> <A-k> :m '<-2<CR>gv=gv
NewMap vnoremap <silent> <A-j> :m '>+1<CR>gv=gv

NewMap noremap < <<
NewMap noremap > >>
NewMap vnoremap < <gv
NewMap vnoremap > >gv

NewMap map <leader>dt :diffthis<cr>
NewMap map <leader>do :diffoff<cr>

NewMap map <leader>0 :wincmd =<cr>

NewMap inoremap <C-Space> <C-x><C-f>
NewMap noremap <leader>ga :!git add .<cr>
NewMap noremap <leader>gs :!git status %<cr>

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

" Ut <F12> :call QuickYank()<cr>
" nnoremap <F12> :call QuickYank()<cr>
" Ut <S-F12> :call QuickYank('paste')<cr>
" Ut <C-F12> :call QuickYank('init')<cr>
" map <F12> :call setreg('*', CWD()[0]..'/'..expand('%')..':'..line('.'))<cr>
" map <S-F12> i<c-r>*


" vnoremap <C-S-v> :<C-u><cr>
NewMap nnoremap <C-S-v> :norm "+p
NewMap inoremap <C-S-v> <c-r>+
" nnoremap <C-v> :norm "+p
" inoremap <C-v> <c-r>+
" nnoremap <C-v>
" inoremap <C-v>
NewMap map <leader>v :visualblock<cr>
" inoremap <C-S-v> <C-o>:<cr>
" cnoremap <C-S-v> :<cr>
" tnoremap <C-S-v> <C-\><C-n>:<cr>
" let seperator=len(args)>0?', ':''

" map <leader><F5> :call RegisterTerminal()<cr>
" map <leader><F6> :call RegisterTerminal()<cr>
" map <leader><F7> :call RegisterTerminal()<cr>
" map <leader><F8> :call RegisterTerminal()<cr>
NewMap map <leader><F5> :call FixTargetTerm('F5')<cr>
NewMap map <leader><F6> :call FixTargetTerm('F6')<cr>
NewMap map <leader><F7> :call FixTargetTerm('F7')<cr>
NewMap map <leader><F8> :call FixTargetTerm('F8')<cr>

" Ut <F2> :call ToggleShortenPath()<cr>
" command :call ToggleShortenPath()<cr>
command! -nargs=0 ShortenPath call ToggleShortenPath()

function DBG()
  echo CWD()
  echo RELATIVE()
  echo ABSOLUTE()
endfunction

NewMap map <leader>a :y \| :let a=split(@", "\n")<cr>
NewMap map <leader>A =remove(a,0)<cr>
" qq
" f,f,a "
" <C-r>=remove(a,0)
" "
" <Esc>/<C-c>
" j0
" q

NewMap map <C-x> :call Assign()<cr>
NewMap map <leader><C-x> :call Deassign()<cr>

NewMap map ,p :call PutKey()<cr>

" exec 'map <80>k2 :echo "TEST"<cr>'

" map ,r :call EditRange()<cr>
" map ,a  :call AssignKey()<cr>
" map ,ec :call AssignKey()<cr>
" map ,ee :call EditExecution()<cr>


" map <F1> :call Execute("F1")<cr>
" map <F2> :call Execute("F2")<cr>
" map <F3> :call Execute("F3")<cr>
" map <F4> :call Execute("F4")<cr>
" map <F5> :call Execute("F5")<cr>
" map <F6> :call Execute("F6")<cr>
" map <F7> :call Execute("F7")<cr>
" map <F8> :call Execute("F8")<cr>

" map <S-F1> :call Execute("F1", 1)<cr>
" map <S-F2> :call Execute("F2", 1)<cr>
" map <S-F3> :call Execute("F3", 1)<cr>
" map <S-F4> :call Execute("F4", 1)<cr>
" map <S-F5> :call Execute("F5", 1)<cr>
" map <S-F6> :call Execute("F6", 1)<cr>
" map <S-F7> :call Execute("F7", 1)<cr>
" map <S-F8> :call Execute("F8", 1)<cr>

" map <C-F1> :call Execute("F1", 0, 1)<cr>
" map <C-F2> :call Execute("F2", 0, 1)<cr>
" map <C-F3> :call Execute("F3", 0, 1)<cr>
" map <C-F4> :call Execute("F4", 0, 1)<cr>
" map <C-F5> :call Execute("F5", 0, 1)<cr>
" map <C-F6> :call Execute("F6", 0, 1)<cr>
" map <C-F7> :call Execute("F7", 0, 1)<cr>
" map <C-F8> :call Execute("F8", 0, 1)<cr>

" map <S-C-F1> :call Execute("F1", 1, 1)<cr>
" map <S-C-F2> :call Execute("F2", 1, 1)<cr>
" map <S-C-F3> :call Execute("F3", 1, 1)<cr>
" map <S-C-F4> :call Execute("F4", 1, 1)<cr>
" map <S-C-F5> :call Execute("F5", 1, 1)<cr>
" map <S-C-F6> :call Execute("F6", 1, 1)<cr>
" map <S-C-F7> :call Execute("F7", 1, 1)<cr>
" map <S-C-F8> :call Execute("F8", 1, 1)<cr>

"" " map <F1> :echo DBG()<cr>
"" map <F9>  :silent Make<cr>
"" " \\| wincmd w \| redraw! \\| copen'<cr>
"" map <S-F9>  :AbortDispatch<cr>
"" map <F10> :!./%<<cr>
"" map <F11> :!./%<<cr>

" map <F11> :Implement<cr>
" map <F12> :Implement<cr>


NewMap map <leader>rm :call DeleteFile()<cr>
NewMap map <leader>n :call NewFile()<cr>

" map <leader>< :norm d\<C-w>lGopG\<C-w>h
" map <leader>< :execute 'normal! \<C-w>l'<cr>
" map <leader>< :execute 'normal! \<C-w>l'<cr>
" map <leader>< :execute 'normal! \<C-w>l'<cr>
NewMap nmap <leader>< :norm yy<cr>
  \:norm dd<cr>
  \:wincmd l<cr>
  \:norm gp<cr>
  \:wincmd h<cr>

NewMap vmap <leader>< :norm gvy<cr>
  \:norm gvd<cr>
  \:wincmd l<cr>
  \:norm gp<cr>
  \:wincmd h<cr>


  " \:norm gvd<cr>

" nnoremap . @@
" noremap . @:
" noremap . @a
" nnoremap . @:
" unmap .

NewMap nnoremap <C-S-M-h> :echo JoinSplits("h")<cr>
NewMap nnoremap <C-S-M-j> :echo JoinSplits("j")<cr>
NewMap nnoremap <C-S-M-k> :echo JoinSplits("k")<cr>
NewMap nnoremap <C-S-M-l> :echo JoinSplits("l")<cr>

NewMap nnoremap <leader><C-S-M-h> :echo MoveOutOfSplit("h")<cr>
NewMap nnoremap <leader><C-S-M-j> :echo MoveOutOfSplit("j")<cr>
NewMap nnoremap <leader><C-S-M-k> :echo MoveOutOfSplit("k")<cr>
NewMap nnoremap <leader><C-S-M-l> :echo MoveOutOfSplit("l")<cr>

" nnoremap <F1> :call Help()<cr>

NewMap map <C-;> zh
NewMap map <C-'> zl
NewMap map <C-S-;> 20zh
NewMap map <C-S-'> 20zl


" ---- quickfix navigation -------------------------------------------
NewMap nnoremap <silent> <leader>f  :copen<CR>
NewMap nnoremap <silent> <C-Down>   :cnext<CR>zz
NewMap nnoremap <silent> <C-Up>     :cprev<CR>zz
NewMap nnoremap <silent> <leader>N  :cfirst<CR>zz
NewMap nnoremap <silent> <leader>P  :clast<CR>zz
NewMap nnoremap <silent> <leader>c  :cclose<CR>

" " ---- location list navigation --------------------------------------
" nnoremap <silent> <leader>lq :lopen<CR>
" " nnoremap <silent> <C-Down>   :lnext<CR>zz
" " nnoremap <silent> <C-Up>     :lprev<CR>zz
" nnoremap <silent> <leader>lN :lfirst<CR>zz
" nnoremap <silent> <leader>lP :llast<CR>zz

NewMap vmap <leader>s :source<cr>
NewMap noremap <F6> :autocmd! BufAdd,BufCreate,BufDelete,BufWipeout,BufNew,BufEnter,BufLeave,WinEnter,BufWinEnter,BufUnload *<cr>
NewMap noremap <F7> :autocmd! BufEnter * :call F.Buffer.Find(bufnr()).Print()<cr>
NewMap noremap <F8> :call Display()<cr>

NewMap noremap ,c :call ToggleComment()<cr>

NewMap vnoremap <S-F11> :<C-u>call Move('l')<cr>
NewMap nnoremap <S-F11> :call Move('l')<cr>
NewMap inoremap <S-F11> <C-o>:call Move('l')<cr>
NewMap cnoremap <S-F11> :call Move('l', 'c')<cr>
NewMap tnoremap <S-F11> <C-\><C-n>:call Move('l', 't')<cr>

NewMap vmap <F1> J
NewMap map <F2> :call GetKeys()<cr>
NewMap map <F3> :call FindKeyPerform()<cr>
NewMap map <F4> :echo AllKeys()<cr>

NewMap tmap <C-v> <C-\><C-n>:call SendCommandToThisTerm([getreg('"')])<cr>i
" <C-S-v> works but be aware of copying the newline characters. they execute
" commands immedietly.


NewMap vmap <leader><leader>s :<C-u>silent redir=>output \| silent '<,'>source \| redir END \| put=output<cr>
