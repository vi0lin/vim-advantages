
import autoload "./Functions.vim9" as F

function! NewCommand(...)
  let args=split(a:000[0], ' ')
  let i = 0
  let name = ""
  " echo len(args)
  while i < len(args)
    let arg=args[i]
    if i > 0 && arg[0] != '-'
      let name=arg
      break
    endif
    let i += 1
  endwhile
  " echo "Name: "..name
  " echo args
  let command = join(args[i:], ' ')
  :call F.Command.new(name, command)
  try
    exec join(a:000, ' ')
  endtry
endfunction
command! -range -nargs=+ NewCommand call NewCommand(<q-args>)

" Keymaps.vim
NewCommand command -range -nargs=* BulkMove :call _BulkMove()
NewCommand command! -range -nargs=+ Move <line1>,<line2>call Move(<f-args>)
NewCommand command -range -nargs=* SaveRoot :call SaveRoot()
NewCommand command -range -nargs=+ Util call __util(<q-args>)
NewCommand command -range -nargs=+ UtilizeVash call UtilizeVash(<f-args>)
NewCommand command Implement :call Implement()
NewCommand command -nargs=+ -complete=command Allargs call Allargs(<q-args>)
NewCommand command -range -nargs=+ Utilize call Utilize(<f-args>)
NewCommand command -range -nargs=+ OpenFile call OpenFile(<q-args>)
NewCommand command -range -nargs=+ CtrlShiftP call CtrlShiftP(<q-args>)
NewCommand command! RunLinter call RunLinterInBackground()
NewCommand command -range -nargs=+ SelectFile call SelectFile(<q-args>)
NewCommand command -range -nargs=+ Selection call Selection(<q-args>)
NewCommand command -range -nargs=+ EE call EE(<q-args>)
NewCommand command! Dashboard call Dashboard()
NewCommand command! -nargs=1 Bs :call BufSel("<args>")
NewCommand command -range -nargs=+ Debug call Debug(<f-args>)
NewCommand command -range -nargs=+ CD call CD(<q-args>)
NewCommand command -nargs=+ -complete=command TIN call TIN(<q-args>)
NewCommand command -nargs=+ -complete=command Sys call Sys(<q-args>)
NewCommand command -nargs=+ -complete=command Vim call Vim(<q-args>)
NewCommand command! -range CountRegex '<,'>call CountRegex()<cr>
vnoremap <S-F11> :<C-u>call Move('l')<cr>
nnoremap <S-F11> :call Move('l')<cr>
inoremap <S-F11> <C-o>:call Move('l')<cr>
cnoremap <S-F11> :call Move('l', 'c')<cr>
tnoremap <S-F11> <C-\><C-n>:call Move('l', 't')<cr>
NewCommand command! -range ToggleCommentFlip <line1>,<line2>call ToggleCommentFlip()
NewCommand command -range -nargs=0 Cword <line1>,<line2>call Cword(<f-args>)
NewCommand command -range -nargs=0 Cfile <line1>,<line2>call Cfile(<f-args>)
NewCommand command -range -nargs=0 CurrentWord <line1>,<line2>call CurrentWord(<f-args>)
NewCommand command -range -nargs=+ LeaderDot call LeaderDot(<q-args>)
NewCommand command -range -nargs=1 WordsPerLine <line1>,<line2>call WordsPerLine(<args>)

NewCommand command -range -nargs=+ Nmap <line1>,<line2>call Nmap(<f-args>)
NewCommand command -range -nargs=+ Vmap <line1>,<line2>call Vmap(<f-args>)
NewCommand command -range -nargs=+ Imap <line1>,<line2>call Imap(<f-args>)
NewCommand command -range -nargs=+ Tmap <line1>,<line2>call Tmap(<f-args>)
NewCommand command -range -nargs=+ Cmap <line1>,<line2>call Cmap(<f-args>)
NewCommand command -range -nargs=+ Amap <line1>,<line2>call Amap(<f-args>)
NewCommand command -range -nargs=+ INmap :call UNmap(<f-args>)
NewCommand command -range -nargs=+ UVmap :call UVmap(<f-args>)
NewCommand command -range -nargs=+ UImap :call UImap(<f-args>)
NewCommand command -range -nargs=+ UTmap :call UTmap(<f-args>)
NewCommand command -range -nargs=+ UCmap :call UCmap(<f-args>)
NewCommand command -range -nargs=+ UAmap :call UAmap(<f-args>)

NewCommand command -range -nargs=* LineUp :call LineUp(<f-args>)

NewCommand command -range -nargs=0 LayoutVim <line1>,<line2>call LayoutVim()
NewCommand command -range -nargs=0 LayoutBash <line1>,<line2>call Layout_Bash()

NewCommand command -range -nargs=0 BASH <line1>,<line2>call BASH()
NewCommand command -range -nargs=1 VIM <line1>,<line2>call VIM(<q-args>)
NewCommand command -range -nargs=0 VIMCOMMENT <line1>,<line2>call VIMCOMMENT()
NewCommand command -range -nargs=0 PYTHON <line1>,<line2>call PYTHON()

NewCommand command -nargs=? LsQF call ListInQuickfix(<q-args>)
NewCommand command -range -nargs=* FindCols call FindStringColumns(<q-args>)
NewCommand command -range -nargs=* FindCharCols call FindCharColumns(<q-args>)
" NewCommand command to run :global with the function
" NewCommand command -range -nargs=* FindMatches <line1>,<line2>g/bar/call ProcessMatches(<q-args>)
NewCommand command! -range -nargs=* FindMatches <line1>,<line2>g/bar/call ProcessMatches(<q-args>)
NewCommand command! -range -nargs=* ProcessMatches <line1>,<line2>call ProcessMatches(<q-args>)
NewCommand command -range -nargs=0 RemoveCR <line1>,<line2>call RemoveCR()

NewCommand command -nargs=1 SearchOpenFile call SearchOpenFile(<q-args>)

NewCommand command -nargs=0 BuildProject <line1>,<line2>call BuildProject()
NewCommand command -nargs=0 RunProject <line1>,<line2>call RunProject()
NewCommand command -nargs=0 MakeProject <line1>,<line2>call MakeProject()
NewCommand command -nargs=0 CTagsProject <line1>,<line2>call CTagsProject()

NewCommand command! -range ToggleVertical <line1>,<line2>call ToggleVertical()
NewCommand command! -range ToggleC <line1>,<line2>call ToggleC()

NewCommand command -nargs=0 -range MoveCommentsToEnd <line1>,<line2>call MoveCommentsToEnd()
NewCommand command -nargs=0 -range PruneEmptyLines <line1>,<line2>call PruneEmptyLines()
NewCommand command -nargs=0 -range DeleteEmptyLines <line1>,<line2>call DeleteEmptyLines()
NewCommand command -nargs=0 -range DeleteNumbersAtTheBeginning <line1>,<line2>call DeleteNumbersAtTheBeginning()

NewCommand command -nargs=0 RepeatLastCommand call RepeatLastCommand()

NewCommand command -range -nargs=* AddFunction <line1>,<line2>call AddFunction(<q-args>)
NewCommand command -range -nargs=0 AddFunctionUserInput <line1>,<line2>call AddFunctionUserInput()
NewCommand command -range -nargs=0 AddFunctionVisualSplit <line1>,<line2>call AddFunctionVisualSplit()
NewCommand command -nargs=0 -range InsertFunction <line1>,<line2>call InsertFunction()
NewCommand command -nargs=0 -range InsertFilename <line1>,<line2>call InsertFilename()
NewCommand command -nargs=0 -range CopyFileNameToClipboard <line1>,<line2>call CopyFileNameToClipboard()
NewCommand command -nargs=0 -range CopyWholePathToClipboard <line1>,<line2>call CopyWholePathToClipboard()
NewCommand command -nargs=? -range InsertReceiver <line1>,<line2>call InsertReceiver(<q-args>)
NewCommand command -nargs=0 -range BuildThis <line1>,<line2>call BuildThis()

NewCommand command! -range -nargs=* UNREG <line1>,<line2>call UNREG(<f-args>)
NewCommand command! -range -nargs=* SETREG <line1>,<line2>call SETREG(<f-args>)
NewCommand command! -range -nargs=1 GETREG <line1>,<line2>call GETREG(<q-args>)
NewCommand command! -range -nargs=* COP <line1>,<line2>call COP(<f-args>)
NewCommand command! -range -nargs=* REPLACE <line1>,<line2>call REPLACE(<f-args>)
NewCommand command! -range -nargs=* CUT <line1>,<line2>call CUT(<f-args>)
NewCommand command! -range -nargs=* CreateMarker <line1>,<line2>call CreateMarker(<f-args>)
NewCommand command! -range -nargs=* ASK <line1>,<line2>call ASK(<f-args>)
NewCommand command! -range -nargs=* CUTG <line1>,<line2>call CUTG(<f-args>)

NewCommand command -range -nargs=0 -range VS <line1>,<line2>call VS()

NewCommand command -nargs=* -complete=command SETCOLOR call SETCOLOR(<f-args>)
NewCommand command -nargs=* -complete=command COLOR call COLOR(<f-args>)

NewCommand command -nargs=0 -range OpenFileCommandLineProject <line1>,<line2>call OpenFileCommandLineProject()
NewCommand command -nargs=0 -range OpenFileCommandLineSameDir <line1>,<line2>call OpenFileCommandLineSameDir()
NewCommand command -nargs=0 -range OpenFileCommandLineCWD <line1>,<line2>call OpenFileCommandLineCWD()
NewCommand command -nargs=0 -range OpenFileCommandLineRepo <line1>,<line2>call OpenFileCommandLineRepo()
NewCommand command -nargs=0 -range OpenFileCommandLineSystem <line1>,<line2>call OpenFileCommandLineSystem()
NewCommand command -nargs=0 -range OpenFileFZFRepo <line1>,<line2>call OpenFileFZFRepo()
NewCommand command -nargs=0 -range OpenFileFZFProject <line1>,<line2>call OpenFileFZFProject()
NewCommand command -nargs=0 -range OpenFileFZFSystem <line1>,<line2>call OpenFileFZFSystem()
NewCommand command -nargs=0 -range SetProjectCommandLineProject <line1>,<line2>call SetProjectCommandLine()
NewCommand command -nargs=0 -range SetProjectCommandLineSystem <line1>,<line2>call SetProjectCommandLine()
NewCommand command -nargs=0 -range SetProjectFZFProject <line1>,<line2>call SetProjectFZFProject()
NewCommand command -nargs=0 -range SetProjectFZFSystemAndFile <line1>,<line2>call SetProjectFZFSystemAndFile()
NewCommand command -nargs=0 -range SetProjectFZFProjectAndFile <line1>,<line2>call SetProjectFZFProjectAndFile()
NewCommand command -nargs=0 -range JumpProjectUp call JumpProjectUp()
NewCommand command -nargs=0 -range JumpProjectStepwise call JumpProjectStepwise()
NewCommand command -nargs=0 -range JumpProjectIn call JumpProjectIn()
NewCommand command -nargs=0 -range JumpProjectL call JumpProjectL()
NewCommand command -nargs=0 -range JumpProjectR call JumpProjectR()
NewCommand command -nargs=0 -range JumpProjectDump call JumpProjectDump()
NewCommand command -nargs=0 -range SetProjectFZFSystem <line1>,<line2>call SetProjectFZFSystem()

NewCommand command -nargs=0 -range MakeDirCurrentProject <line1>,<line2>call MakeDirCurrentProject()
NewCommand command -nargs=0 -range SaveFile <line1>,<line2>call SaveFile()

" NewCommand command! -nargs=0 SearchCword exec "vimgrep /\<<cword>\>/j **/*" | copen | cbottom
NewCommand command! -nargs=0 SearchCword exec "vimgrep /<cword>/j "..GetProject().."/**" | copen | cbottom

NewCommand command -nargs=0 -range Build <line1>,<line2>call Build()
NewCommand command -nargs=0 -range BuildStop <line1>,<line2>call BuildStop()
" NewCommand command -nargs=0 -range Run <line1>,<line2>call Run()
NewCommand command -nargs=0 -range EXEC <line1>,<line2>call EXEC()
NewCommand command -nargs=0 -range EXECTOGGLE <line1>,<line2>call EXECTOGGLE()
NewCommand command -nargs=0 -range INTERPRETERTOGGLE <line1>,<line2>call INTERPRETERTOGGLE()
NewCommand command! -nargs=+ CheckListContains call s:CheckList(<q-args>)

" ---- commands ------------------------------------------------------
" NewCommand command! -nargs=1 Grep exec 'silent grep -nrw -- "<args>" .'
" NewCommand command! -nargs=1 Grep exec 'silent echo! "<args>"' | copen
" | copen | redraw!
" NewCommand command! -nargs=1 LGrep exec 'silent lgrep -nrw -- "<args>" .' | lopen | redraw!
" NewCommand command! -nargs=1 Grep  exec 'ls! -al' | copen | redraw!
NewCommand command! -nargs=1 Grep exec 'silent grep! -nR -- "<args>" .' | copen | redraw!
NewCommand command! -nargs=0 PyCopen exec 'silent make' | copen | redraw!
NewCommand command! -nargs=0 Run exec w:runprg.' \| copen \| redraw!'
