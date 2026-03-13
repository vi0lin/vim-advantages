let vimruntime=split(&vimruntime, ",")[0]
exec 'source '..vimruntime..'autoload/vim-advantages/Functions.vim'
exec 'source '..vimruntime..'autoload/vim-advantages/Functions.vim9'
