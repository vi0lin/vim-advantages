" Statusline.vim
function! Statusline()
  " let $timersCount=Length(timer_info())
  " if HasState()
    "!exists("b:state.parent")
      exe 'hi! StatusLineNC guibg=#222222 guifg=#885588'
      exe 'hi! StatusLine guibg=#55ff88 guifg=#005500'
      " buffer
      hi User1 guifg=#ffdad8  guibg=#880c0e ctermfg=88 ctermbg=236
      hi User2 guifg=#000000  guibg=#f80c0C ctermfg=238 ctermbg=233
      hi User3 guifg=#292b00  guibg=#F4505C ctermfg=88 ctermbg=236
      " hi User3 guifg=#000000  guibg=#f80c0C
      " term
      hi User4 guifg=#112605  guibg=#ae2e4B ctermfg=152 ctermbg=236
      hi User5 guifg=#051d00  guibg=#8d2c2d ctermfg=152 ctermbg=236
      hi User7 guifg=#ffffff  guibg=#880c0e ctermfg=152 ctermbg=236 gui=bold
      " other
      hi User8 guifg=#ffffff  guibg=#8b2f2b ctermfg=152 ctermbg=236
      hi User9 guifg=#ffffff  guibg=#F14025 ctermfg=152 ctermbg=236
      hi User0 guifg=#ffffff  guibg=#094afe ctermfg=152 ctermbg=236
    hi User0 guifg=#000000 guibg=#d3d3d3 ctermfg=152 ctermbg=233
    " if !exists("b:NERDTree")
      set statusline=
      " && b:NERDTree.isTabTree()
      " COLOR 0
      set statusline+=%#User2#\ %{(mode())}
      " WorkdirRegister
      " set statusline+=%#User2#\ %{(CurrentWorkdirRegister()[0])}
      " Git Status
      set statusline+=\ %#User2#%{GetBranch()}\ "Spellanguage & Highlight on?
      " set statusline+=\ %{GetLastsaved()}\ 
      " set statusline+=\ %{GetProject()}\ 
      " Path
      set statusline+=%#User0#\ \ \ %{GetPath_Statusline()}\ \ \  "Spellanguage & Highlight on?
      " COLOR 1
      " set statusline+=%#User7#*\ %{(1?'%1*':'%4*')}\ [%n]                                 "buffernr
      " CWD
      set statusline+=%#User0#\ %{GetProject_Statusline()} "Spellanguage & Highlight on?
      " COLOR 1
      " set statusline+=%#User7#*\ %{(1?'%1*':'%4*')}\ [%n]                                 "buffernr
      "
      " Buffer Number
      set statusline+=%#User2#%{(exists('b:state')&&b:state.type=='buffer'?''.bufnr().'\ ':'')}
      set statusline+=%#User4#%{(exists('b:state')&&b:state.type=='terminal'?''.bufnr().'\ ':'')}
      set statusline+=%#User7#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?''.bufnr().'\ ':'')}
      " Long Buffer Type
      set statusline+=%#User0#%=
      " Long Buffer Type
      " set statusline+=%#User0#%0a%{(GetType())}%=
      set statusline+=%#User2#%{(exists('b:state')&&b:state.type=='buffer'?'%=\ ':'')}
      set statusline+=%#User4#%{(exists('b:state')&&b:state.type=='terminal'?'%=\ ':'')}
      set statusline+=%#User7#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?'%=\ ':'')}
      set statusline+=%#User2#%{(exists('b:state')&&b:state.type=='buffer'?''.GetType().'\ ':'')}
      set statusline+=%#User4#%{(exists('b:state')&&b:state.type=='terminal'?''.GetType().'\ ':'')}
      set statusline+=%#User7#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?''.GetType().'\ ':'')}
      " Long Buffer Type Different Colors
      " set statusline+=%0*%=
      " set statusline+=%0a%{(GetType())}%=
      " set statusline+=%8*\%{exists('b:state')&&b:state.file}\  "Spellanguage & Highlight on?
      " set statusline+=%1*\ %<%F\                                "File+path
      " set statusline+=%2*\ %y\                                  "FileType
      " Encoding
      set statusline+=%#User2#%{(exists('b:state')&&b:state.type=='buffer'?''.&fenc.'\ ':'')}
      set statusline+=%#User5#%{(exists('b:state')&&b:state.type=='terminal'?''.&fenc.'\ ':'')}
      set statusline+=%#User8#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?''.&fenc.'\ ':'')}
      " COLOR 2
"      set statusline+=%#User3#%{(exists('b:state')&&b:state.type=='buffer'?'\ \ ['.(&bomb?\",BOM\":\"\").']\ ':'')}
"      set statusline+=%#User6#%{(exists('b:state')&&b:state.type=='terminal'?'\ \ ['.(&bomb?\",BOM\":\"\").']\ ':'')}
"      set statusline+=%#User9#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?'\ \ ['.(&bomb?\",BOM\":\"\").']\ ':'')}
      " COLOR 3
      " let x=g:date
      " set statusline+=%#User2#%{(exists('b:state')&&b:state.type=='buffer'?''.x.'\ ':'')}
      " set statusline+=%#User4#%{(exists('b:state')&&b:state.type=='terminal'?''.x.'\ ':'')}
      " set statusline+=%#User7#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?''.x.'\ ':'')}
      " Unix Or Win
      set statusline+=%#User2#%{(exists('b:state')&&b:state.type=='buffer'?''.&ff.'\ ':'')}
      set statusline+=%#User4#%{(exists('b:state')&&b:state.type=='terminal'?''.&ff.'\ ':'')}
      set statusline+=%#User7#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?''.&ff.'\ ':'')}
      " set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
      " COLOR 1
      let ab="\ %{$git_commit_feature_got_commited}\ "                        "Spellanguage & Highlight on?
      " set statusline+=%#User2#%{(exists('b:state')&&b:state.type=='buffer'?'\ \ '.$commitstatus.'\ ':'')}
      " set statusline+=%#User5#%{(exists('b:state')&&b:state.type=='terminal'?'\ \ '.$commitstatus.'\ ':'')}
      " set statusline+=%#User8#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?'\ \ '.$commitstatus.'\ ':'')}
      " COLOR 2
      " set statusline+=%#User3#%{(exists('b:state')&&b:state.type=='buffer'?'\ %=':'')}
      " set statusline+=%#User6#%{(exists('b:state')&&b:state.type=='terminal'?'\ %=':'')}
      " set statusline+=%#User9#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?'\ %=':'')}
      " function Spaces()
      "   return '%left asdfasdf'
      " endfunction
      " set statusline+=%-20000([%{LASDF}]%)
      " set statusline+=%#User3#%{(exists('b:state')&&b:state.type=='buffer'?Spaces():'')}
      " set statusline+=%#User6#%{(exists('b:state')&&b:state.type=='terminal'?Spaces():'')}
      " set statusline+=%#User9#%{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?Spaces():'')}
      "
      function! ChangeStatuslineColor(c)
        " if (mode() =~# '\v(n|no)')
        "   exe 'hi! StatusLine ctermfg=008'
        " elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
        "   exe 'hi! StatusLine ctermfg=005'
        " elseif (mode() ==# 'i')
        "   exe 'hi! StatusLine ctermfg=004'
        " else
        "   exe 'hi! StatusLine ctermfg=006'
        " exe 'hi! StatusLine guibg=#'.a:c
        " set statusline+=%#User2#
        " set statusline+=%#200200#
        " endif
        return ''
      endfunction
      " set statusline+=%{ChangeStatuslineColor()} 
      " set statusline+=%{(exists('b:state')&&b:state.type=='buffer'?'%#User1#':'asdf')}%=\ %{(exists('b:state')&&b:state.type=='buffer'?'asdf':'')}
      " set statusline+=%#User4#%=\ %{(exists('b:state')&&b:state.type=='terminal'?'asdf':'')}
      " set statusline+=%#User7#%=\ %{(exists('b:state')&&b:state.type!='buffer'&&b:state.type!='terminal'?'asdf':'')}
      " set statusline+=%{ChangeStatuslineColor('808208')}asdf%=sdfasdas
      " set statusline+=asdfasdf
      """" --> brb function ColorUser1ToGreen()
      """" --> brb         hi User1 guifg=#00ff00 guibg=#0a0a0a gui=bold
      """" --> brb endfunction
      """" --> brb function ColorUser1ToLightBlue()
      """" --> brb         hi User1 guifg=#9494ff  guibg=#0a0a0a gui=bold
      """" --> brb endfunction
      """" --> brb function ColorUser1ToYellow()
      """" --> brb         hi User1 guifg=#ffff00 guibg=#0a0a0a gui=bold
      """" --> brb endfunction
      """" --> brb function ColorUser1ToOrange()
      """" --> brb         hi User1 guifg=#ffa239 guibg=#0a0a0a gui=bold
      """" --> brb endfunction
      """" --> brb function ColorUser1ToPurple()
      """" --> brb         hi User1 guifg=#a683ff guibg=#0a0a0a gui=bold
      """" --> brb endfunction
      """" --> brb function GetStatusLineMode()
      """" --> brb     let ms=mode()
      """" --> brb     if ms == 'n'
      """" --> brb         call ColorUser1ToLightBlue()
      """" --> brb         return 'NORMAL  '
      """" --> brb     elseif ms == 'i'
      """" --> brb         call ColorUser1ToYellow()
      """" --> brb         return 'INSERT  '
      """" --> brb     elseif ms == 'v' || ms == 'V' 
      """" --> brb         call ColorUser1ToOrange()
      """" --> brb         return 'VISUAL  '
      """" --> brb     elseif ms == 's' || ms == 'S'
      """" --> brb         call ColorUser1ToOrange()
      """" --> brb         return 'SELECT  '
      """" --> brb     elseif ms == 'R' ||  ms == 'Rv'
      """" --> brb         call ColorUser1ToPurple()
      """" --> brb         return 'REPLACELACE '
      """" --> brb     elseif ms == '!'
      """" --> brb         call ColorUser1ToPurple()
      """" --> brb         return 'SHELL   '
      """" --> brb     else
      """" --> brb         call ColorUser1ToGreen()
      """" --> brb     endif
      """" --> brb endfunction
      """" --> brb :set laststatus=2
      """" --> brb :set statusline=%1*%{GetStatusLineMode()}%*\ %n\ %#StatusLineY#%m%*\%#StatusLineR#%r%*\ %t\ [%o\ %l/%L(%p%%)\ %c\ \]
      " COLOR 3
      set statusline+=%{(exists('b:state.exec_keys')&&b:state.type=='terminal'?b:state.exec_keys:'')}
      set statusline+=%{(exists('b:state.exec_keys')&&b:state.type=='vash'?b:state.exec_keys:'')}
      " set statusline+=%{b:state.exec_keys}
      " set statusline+=\ %{(exists('b:state')&&b:state.type=='terminal'?b:state.exec_keys.'':' ')}\              "Spellanguage & Highlight on?
      " set statusline+=%4*\ Timers:\ %{$timersCount}\              "Spellanguage & Highlight on?
      " set statusline+=%9*\%{b:tmpuuid}\                        "Spellanguage & Highlight on?
      " set statusline+=%3*\ %{$commitstatus}\                     "Spellanguage & Highlight on?
      " set statusline+=%4*\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
      set statusline+=%4*\ %l/%L            "Rownumber/total (%)
      " COLOR 1
      """ todo set statusline+=\ %l/%L\              "Rownumber/total (%)
      " set statusline+=%9*\ col:%03c\                            "Colnr
      """ todo set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
    " endif
    function! HighlightSearch()
      if &hls
        return 'H'
      else
        return ''
      endif
    endfunction
  " endif
  " if exists("g:WindowChanged")
  "   unlet g:WindowChanged
  " endif
  " if !exists("b:statusline_initialized")
  "   let b:statusline_initialized=1
  " endif
endfunction
