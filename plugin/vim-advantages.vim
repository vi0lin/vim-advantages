let runtimepath=split(&runtimepath, ",")[0]
let p = 'autoload/vim-advantages'
let p = 'src'
exec 'source '..runtimepath..'/plugged/vim-advantages/'..p..'/Functions.vim9'
exec 'source '..runtimepath..'/plugged/vim-advantages/'..p..'/Functions.vim'
