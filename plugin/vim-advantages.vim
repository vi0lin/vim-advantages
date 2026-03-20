let runtimepath=split(&runtimepath, ",")[0]
let p = 'src'
let p = 'autoload/vim-advantages'
exec 'source '..runtimepath..'/plugged/vim-advantages/'..p..'/Functions.vim9'
exec 'source '..runtimepath..'/plugged/vim-advantages/'..p..'/Functions.vim'
