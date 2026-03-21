if !exists("g:vim_advantages_got_sourced")

import autoload "./Functions.vim9" as F
if !exists("g:autocommands_set") || g:autocommands_set==0
  " VimInstance.Print("test")
  " importing vim9 does not autoname the import
  " exec "source ".g:vim."/src/Functions.vim9"
  " call F.VimInstance.Print("test")
  " finish
  let g:autocommands_set=1
  autocmd! BufWritePost *$vim/src/*.vim :call SourceVim()
  autocmd! WinLeave * :call ClearTermOnWinLeave(expand('<abuf>'))
  autocmd! VimEnter * :call VimEnter()
  autocmd! VimLeave * :call VimLeave()
  autocmd! TabNew * :call TabNew()
  autocmd! WinEnter * :call WinEnter()
  autocmd! WinLeave * :call WinLeave()
  autocmd! BufNew * :call BufNew()
  autocmd! BufEnter * :call BufEnter()
  autocmd! BufLeave * :call BufLeave()
  autocmd! BufWinEnter * :call BufWinEnter()
  autocmd! BufEnter * :call Statusline()

  " autocmd! BufAdd,BufCreate,BufDelete,BufWipeout,BufNew,BufEnter,BufLeave,WinEnter,BufWinEnter,BufUnload *
  " autocmd! BufEnter * :call F.Branch.Buffer.Find(bufnr()).Print()
  " autocmd! BufAdd * :call F.Branch.Buffer.Add(bufnr())
  """ autocmd! BufCreate * :call F.Buffer.Find(bufnr()).Print()
  """ autocmd! BufDelete * :call F.Buffer.Find(bufnr()).Print()
  """ autocmd! BufWipeout * :call F.Buffer.Find(bufnr()).Print()
  " autocmd! BufNew * :call F.New<Buffer>(bufnr())
  " autocmd! BufNew * :call F.New(F.buffers, F.Buffer.new(bufnr(), winnr(), tabpagenr()))
  " autocmd! BufNew * :call F.New(F.buffers, F.Buffer.new(0, 1, 2))
  """ autocmd! BufNew * :call F.BufNew()
  autocmd! TabNew * :call F.TabNew()
  autocmd! WinNew * :call F.WinNew()
  """ autocmd! VimEnter * :call F.VimEnter()
  """ autocmd! BufWinEnter * :call F.BufWinEnter()
  " autocmd! TabNew * :call F.New(F.tabs, F.Tab.new(tabnr()))
  """ autocmd! BufLeave * :call F.Buffer.Find(bufnr()).Print()
  """ " autocmd! WinEnter * :call F.Buffer.Find(bufnr()).Print()
  """ autocmd! BufWinEnter * :call F.Window.Find(winnr()).SetParent(bufnr()))
  """ autocmd! BufUnload * :call F.Buffer.Find(bufnr()).Print()
  """ " autocmd! BufWinLeave * :call F.Window.DeassociateBufWin()
  " autocmd! BufEnter * :call F.buffers.Find(bufnr()).Print()


  " augroup TerminalNoWrap
  "   autocmd!
  "   autocmd TerminalOpen * if &buftype == 'terminal' | setlocal termwinsize=0x9999 | endif
  " augroup END

  augroup CursorLine
      au!
      autocmd! WinEnter,VimEnter,BufWinEnter * setlocal cursorline
      autocmd! WinLeave * setlocal nocursorline
  augroup END
  function! OnModeChange(mode)
    if &buftype ==# 'terminal'
      if a:mode == "tn:t"
        echom a:mode "Never Gets In / Neovim / Terminal-Insert Mode"
      elseif a:mode == "nt:t"
       echom a:mode "Terminal-Insert Mode"
       setlocal wrap
       " setlocal termwinsize=
       " setlocal textwidth=1000
       " setlocal wrapmargin=0
      endif
      " if a:mode =~# 'nt\|t'
      "   " nt = terminal-mode, t= terminal-insert
      "   if a:mode ==# 't'
      "     echom "Terminal-Insert  Mode"
      "     echo a:mode
      "   else
      "     echom "Terminal-Normal Mode"
      "     echo a:mode
      "   endif
      " endif
    endif
  endfunction

  

  autocmd! ModeChanged * call OnModeChange(expand('<amatch>'))
  autocmd! TermChanged * call OnModeChange(expand('<amatch>'))
  " autocmd! TermLeave * call OnModeChange(expand('<amatch>'))
  tnoremap <C-\><C-n> <C-\><C-n>:call OnTerminalNormalMode()<CR>
  tnoremap <C-w>N <C-w>N:call OnTerminalNormalMode()<CR>
  " nnoremap <silent> :terminal-normal<CR> :terminal-normal<CR>:call OnTerminalNormalMode()<CR>
  function! OnTerminalNormalMode()
    if &buftype == 'terminal'
       " setlocal wrap linebreak nolist|
       echom "Terminal-Normal Mode"
       setlocal nowrap
       " setlocal termwinsize=0x9999
       " setlocal textwidth=0x9999
       " setlocal wrapmargin=0
    endif
  endfunction
  augroup TerminalNoWrap
    autocmd!

    " autocmd TermEnter *
    "       \ echo "TermEnter"
    " autocmd END

    " autocmd TermLeave *
    "       \ echo "TermLeave"
    " autocmd END

    " autocmd TerminalOpen *
    "       \ echo "TerminalOpen" |
    "       \ if &buftype == 'terminal' |
    "       \   set wrap |
    "       \   setlocal wrap linebreak nolist|
    "       \   setlocal termwinsize= |
    "       \   setlocal textwidth= |
    "       \   set nowrap |
    "       \   set textwidth= |
    "       \   set wrapmargin= |
    "       \ endif
    " autocmd InsertEnter *
    "       \ echo "InsertEnter" |
    "       \ if &buftype == 'terminal' |
    "       \   setlocal termwinsize=0x9999 |
    "       \   setlocal textwidth=0x9999 |
    "       \   set wrap |
    "       \   set textwidth=0 |
    "       \   set wrapmargin=0 |
    "       \ endif
    " autocmd InsertLeave *
    "       \ echo "InsertLeave" |
    "       \ if &buftype == 'terminal' |
    "       \   set wrap |
    "       \   setlocal wrap linebreak nolist|
    "       \   setlocal termwinsize= |
    "       \   setlocal textwidth= |
    "       \   set nowrap |
    "       \   set textwidth= |
    "       \   set wrapmargin= |
    "       \ endif
  augroup END
  " set termwinsize=0*0
  " set termwinscroll=10000
  " augroup TermFollow
  "   autocmd!
  "   autocmd TermOpen * startinsert
  "   autocmd BufEnter term://* startinsert
  " augroup END
  finish
endif

endif
