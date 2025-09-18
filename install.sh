#!/bin/bash
echo "Install Vim-Advantages"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux detected"
  cc="wget -q https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim ./plug.vim"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "macOS detected"
  cc="wget -q https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim ./plug.vim"
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  echo "Windows detected"
  cc="curl -o plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim"
else
  echo "Unknown operating system: $OSTYPE"
fi
eval $cc
if ! [ -f "./plug.vim" ]; then
  plug_loaded=true
fi
echo "installing"
vim -c "source plug.vim | call plug#begin() | Plug 'vi0lin/vim-advantages' | call plug#end() | PlugInstall | quitall"
if $plug_loaded; then
  rm ./plug.vim
  unset plug_loaded
fi
echo "Done Installing vi0lin/vim-advantages"
echo ""
echo "#####################################"
echo "Configuration"

main_repo="`pwd`"
source_dir="`pwd`/src"
bashrc="~/.bashrc"

read -r _main_repo -p "Where Is Your Main Repository? [default=$main_repo]: " 
if [[ -n "$main_repo" ]]; then
  main_repo=$_main_repo
fi

read -r _source_dir -p "Where Is Your SourceFolder? [default=$source_dir]: " 
if [[ -n "$source_dir" ]]; then
  source_dir=$_source_dir
fi

echo ""
read -r _bashrc -p "Where Is Your .bashrc? [default=$bashrc]: " 
if [[ -n "$_bashrc" ]]; then
  bashrc=$_bashrc
fi

sed -i '/^call EnsureEnvironment()/ { N; s/^call EnsureEnvironment()\n/&call SetEnvironment("~", "$main_repo", "$source_dir", "$bashrc")\n/ }' ~/.vim/plugged/vim-advantages/src/Functions.vim | head -n 20

