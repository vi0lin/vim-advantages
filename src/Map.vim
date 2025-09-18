function _nnoremap(...) range
  let key=a:1[0]
  let keyesc=escape(key, "<>")
  let mode=':call SetMode("'.keyesc.'", "Normal") \|'
  let cmd = join(a:1[1:])
  exec "nnoremap ".key mode cmd
endfunction
function _vnoremap(...) range
  let key=a:1[0]
  let keyesc=escape(key, "<>")
  " let keyesc=escape(keyesc, "<>")
  let mode=':call SetMode("'.keyesc.'", "Visual") \|'
  let cmd = "'<,'>".join(a:1[1:])
  exec "vnoremap ".key mode cmd
endfunction
function _inoremap(...) range
  let key=a:1[0]
  let keyesc=escape(key, "<>")
  " let keyesc=escape(keyesc, "<>")
  let mode='<Esc>:call SetMode("'.keyesc.'", "Insert") \|'
  let cmd = join(a:1[1:])
  exec "inoremap ".key mode cmd
endfunction
function _tnoremap(...) range
  let key=a:1[0]
  let keyesc=escape(key, "<>")
  " let keyesc=escape(keyesc, "<>")
  let mode='<C-\><C-n>:call SetMode("'.keyesc.'", "Terminal") \|'
  " <C-\><C-n>
  " let mode='<C-\><C-n>:echo "TEST"'
  let cmd = join(a:1[1:])
  exec "tnoremap ".key mode cmd
endfunction
function _cnoremap(...) range
  let key=a:1[0]
  let keyesc=escape(key, "<>")
  " let keyesc=escape(keyesc, "<>")
  let mode=':call SetMode("'.keyesc.'", "Console") \|'
  let cmd = join(a:1[1:])
  exec "cnoremap ".key mode cmd
endfunction
function Nmap(...) range
  " call _nnoremap(a:000)
  exec "call _nnoremap(a:000)"
endfunction
function Vmap(...) range
  " call _vnoremap(a:000)
  exec "call _vnoremap(a:000)"
  " echo "call _vnoremap(a:000)"
  " exec "<a:firstline>,<a:lastline> call _vnoremap(a:000)"
endfunction
function Imap(...) range
  " call _inoremap(a:000)
  exec "call _inoremap(a:000)"
endfunction
function Tmap(...) range
  " call _tnoremap(a:000)
  exec "call _tnoremap(a:000)"
endfunction
function Cmap(...) range
  " call _cnoremap(a:000)
  exec "call _cnoremap(a:000)"
endfunction
function Amap(...) range
  " echo a:lastline a:lastline
  " exec a:firstline.",".a:lastline."call _nnoremap(a:000)"
  " exec a:firstline.",".a:lastline."call _vnoremap(a:000)"
  " exec a:firstline.",".a:lastline."call _inoremap(a:000)"
  " exec a:firstline.",".a:lastline."call _tnoremap(a:000)"
  " exec a:firstline.",".a:lastline."call _cnoremap(a:000)"
" return
  " if key =~#"A" || key =~#"B" || key =~#"D" || key =~#"E" || key =~#"G" || key =~#"H" || key =~#"I" || key =~#"J" || key =~#"K" || key =~#"L" || key =~#"M" || key =~#"N" || key =~#"O" || key =~#"P" || key =~#"Q" || key =~#"R" || key =~#"S-" || key =~#"T" || key =~#"U" || key =~#"V" || key =~#"W" || key =~#"X" || key =~#"Y" || key =~#"Z"
  " echo a:000 a:000[0] =~#"<leader>"
  " return
  " echo a:000 a:000[0] =~#"<leader>"
  " exec a:firstline.",".a:lastline."call _nnoremap(a:000)"
  " exec a:firstline.",".a:lastline."call _vnoremap(a:000)"
  " if ! a:000[0] =~#"<leader>"
  "   exec a:firstline.",".a:lastline."call _inoremap(a:000)"
  " endif
  " exec a:firstline.",".a:lastline."call _tnoremap(a:000)"
  " exec a:firstline.",".a:lastline."call _cnoremap(a:000)"
  " return
  call _nnoremap(a:000)
  call _vnoremap(a:000)
  if ! a:000[0] =~#"<leader>"
" obviously not here to fix this issue because i commented it out and tested it.
"        \ && ! a:000[0] =~#"\\" 
    call _inoremap(a:000)
  endif
  call _tnoremap(a:000)
  call _cnoremap(a:000)
  return
  " call _nnoremap(a:000)
  " call _vnoremap(a:000)
  " call _inoremap(a:000)
  " call _tnoremap(a:000)
  " call _cnoremap(a:000)
endfunction
function UUNmap(...) range
  call _nnoremap(a:1)
endfunction
function UVmap(...) range
  call _vnoremap(a:1)
endfunction
function UImap(...) range
  call _inoremap(a:1)
endfunction
function UTmap(...) range
  call _tnoremap(a:1)
endfunction
function UCmap(...) range
  call _cnoremap(a:1)
endfunction
function UAmap(...) range
  call _nnoremap([a:1])
  call _vnoremap([a:1])
  call _inoremap([a:1])
  call _tnoremap([a:1])
  call _cnoremap([a:1])
endfunction
"Addon
"" function NImap(...) range
""   call _nnoremap(a:000)
""   call _inoremap(a:000)
"" endfunction
"" command -nargs=+ NImap :call NImap(<f-args>)
"" function NVmap(...) range
""   call _nnoremap(a:000)
""   call _vnoremap(a:000)
"" endfunction
"" command -range -nargs=+ NVmap :call NVmap(<f-args>)
"" function TVmap(...) range
""   call _tnoremap(a:000)
""   call _vnoremap(a:000)
"" endfunction
"" command -range -nargs=+ TVmap :call TVmap(<f-args>)
"" function NVImap(...) range
""   call _nnoremap(a:000)
""   call _vnoremap(a:000)
""   call _inoremap(a:000)
"" endfunction
"" command -range -nargs=+ NVImap :call NVImap(<f-args>)
"" function NITmap(...) range
""   call _nnoremap(a:000)
""   call _vnoremap(a:000)
""   call _tnoremap(a:000)
""   call _inoremap(a:000)
"" endfunction
"" command -range -nargs=+ NITmap :call NITmap(<f-args>)
function Utilize(...) range
  let verbose=0
  let force=0
  let normal=0
  let visual=0
  let insert=0
  let command=0
  let terminal=0
  let mapping=0
  let mapping_args=[]
  let onlyprekeys=0
  let leaders=0
  let leaderscount=0
  let leader_string=""
  let cmd=0
  let cmd_args=[]
  let keys=0
  let keys_args=[]
  let prekeys=0
  let prekeys_args=[]
  let g:text=""
  let arg=copy(a:000)
  let leader_loop=[]
  function! _initKeys(leaders, keys, verbose)
    if a:verbose
      echo "a:leaders" a:leaders
      echo "a:keys" a:keys
    endif
    if !a:leaders && a:keys
      let leader_loop= [""]
    else
      let leader_loop= []
    endif
    return leader_loop
  endfunction
  while Switch(arg)
    let x=g:lastswitch
    if IsOptionArgument(arg[0])
      let found=0
      if Case("verbose") | let verbose=1
      elseif Case('mapping') | let mapping=1
      elseif Case('force') | let force=1
      elseif Case('onlyprekeys') | let onlyprekeys=1
      elseif Case('leaders') | let leaders=1
      elseif Case('cmd') | let cmd=1
      elseif Case('keys') | let keys=1
      elseif Case('prekeys') | let prekeys=1
      elseif !found
        if CaseIn(arg[0], 'n') | let found=1 | let normal=1 | endif
        if CaseIn(arg[0], 'v') | let found=1 | let visual=1 | endif
        if CaseIn(arg[0], 'i') | let found=1 | let insert=1 | endif
        if CaseIn(arg[0], 't') | let found=1 | let terminal=1 | endif
        if CaseIn(arg[0], 'c') | let found=1 | let command=1 | endif
      endif
      let leader_loop=_initKeys(leaders, keys, verbose)
    else
      if LastCase("leaders")
        let leaderscount=g:lastswitch
      elseif LastCase('mapping')
        call extend(mapping_args, [g:lastswitch])
      elseif LastCase('cmd')
        call extend(cmd_args, [g:lastswitch])
      elseif LastCase('prekeys')
        call extend(prekeys_args, [g:lastswitch])
      elseif LastCase('keys')
        call extend(keys_args, [g:lastswitch])
      else
        call extend(cmd_args, [g:lastswitch])
      endif
    endif
    call remove(arg, 0)
  endwhile
  if verbose
    let debugoutput = [
      \ ["The Argument is:", g:lastswitch],
      \ ["mapping", mapping],
      \ ["mapping_args", mapping_args],
      \ ["cmd", cmd],
      \ ["cmd_args", cmd_args],
      \ ["verbose", verbose ],
      \ ["command", command],
      \ ["normal", normal],
      \ ["visual", visual],
      \ ["insert", insert],
      \ ["terminal", terminal],
      \ ["force", force ],
      \ ["onlyprekeys", onlyprekeys],
      \ ["leaders", leaders],
      \ ["leaderscount", leaderscount],
      \ ["leader_string", leader_string]
      \ ]
    call PrintAlignedTable(debugoutput)
  endif
  if !onlyprekeys
    let prekeys_args=extend([""], prekeys_args)
  endif
  if leaders
    for i in range(1, leaderscount)
      let leader_string=leader_string."<leader>"
      call extend(leader_loop, [leader_string])
    endfor
  endif
  if verbose
    echo cmd_args
    echo keys_args
    echo "leader_loop: " leader_loop
  endif
  for key in keys_args
    if verbose
      echo key
    endif
    for prekey in prekeys_args
      for leader in leader_loop
        if verbose
          echo "leader: " leader
          echo "key" key
          echo "cmd" cmd 
          echo "!empty(cmd)" !empty(cmd)
        endif
          if cmd_args[0][0] == ":" 
            let c=join(cmd_args, ' ')
            let execute=x.''.prekey.key.' '.c
          else
            let cmd_args_joined=join(cmd_args, " ")
            let c = cmd_args_joined.'("'.escape(prekey.key, "<>").'")'
            let execute=prekey.key.' :call '.c.'<cr>'
            if verbose
              echo execute
            endif
          endif
        if insert
          execute "Imap ".execute
        endif
        if normal
          execute "Nmap ".execute
        endif
        if command
          execute "Tmap ".execute
        endif
        if visual
          execute "Vmap ".execute
        endif
        if command
          execute "Cmap ".execute
        endif
      endfor
    endfor
  endfor
endfunction
