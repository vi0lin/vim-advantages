if !exists("g:autocommands_set") || g:autocommands_set==0
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
  augroup CursorLine
      au!
      autocmd! WinEnter,VimEnter,BufWinEnter * setlocal cursorline
      autocmd! WinLeave * setlocal nocursorline
  augroup END
  finish
endif
