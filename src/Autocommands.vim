if !exists("g:autocommands_set") || g:autocommands_set==0
  let g:autocommands_set=0
  let g:autocommands_set=1
  autocmd! BufWritePost *$vim/src/*.vim :call SourceVim()
  autocmd! BufWinEnter * :call BufWinEnter()
  autocmd! WinLeave * :call ClearTermOnWinLeave(expand('<abuf>'))
  autocmd! WinLeave * :call WinLeave()
  autocmd! BufLeave * :call BufLeave()
  autocmd! TabNew * :call TabNew()
  autocmd! BufWinEnter * :call BufWinEnter()
  autocmd! BufNew * :call BufNew()
  autocmd! VimEnter * :call VimEnter()
  autocmd! WinEnter * :call WinEnter()
  autocmd! BufEnter * :call Statusline()
  autocmd! VimLeave * :call VimLeave()
  autocmd! BufNew * :call BufNew()
  autocmd! BufEnter * :call BufEnter()
  augroup CursorLine
      au!
      autocmd! WinEnter,VimEnter,BufWinEnter * setlocal cursorline
      autocmd! WinLeave * setlocal nocursorline
  augroup END
  augroup quickfix_mapping
    autocmd!
    autocmd! FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>:call WinBufSwap_Back()<cr>
    autocmd! FileType qf nnoremap <C-q> :copen<CR>
    autocmd! FileType qf nnoremap <C-c> :cclose<CR>
    autocmd! FileType qf nnoremap <F9> :cclose<CR>
    autocmd! FileType qf nnoremap <F10> :cclose<CR>
    autocmd! FileType qf nnoremap <F11> :cclose<CR>
    autocmd! FileType qf nnoremap <F12> :cclose<CR>
  augroup END
  augroup ft 
    au!
    au FileType vim                    map <buffer> <F1> :VIM<cr>
    au FileType sh,.bashrc,.profile    map <buffer> <F1> :BASH<cr>
    au FileType python                 map <buffer> <F1> :PYTHON<cr>
    au FileType rs                     map <buffer> <F1> :RUST<cr>
    au FileType c                      map <buffer> <F1> :echo "test"<cr>
    au FileType md                     map <buffer> <F1> :echo "compile"<cr>
    au FileType rs                     map <buffer> <A-F5> :echo "rs"<cr>
    au FileType c                      map <buffer> <A-F5> :echo "c"<cr>
    au FileType haml,sass              map <buffer> <A-F5> :echo "compile"<cr>
  augroup END
  finish
endif
