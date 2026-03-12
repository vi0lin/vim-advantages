#!/bin/bash

# datadir="~/.vim/autoload/"
# if ! [ -d $datadir ]; then
#   datadir="~/.vim/plugged/vim-advantages/autoload/"
#   if ! [ -d $datadir ]; then
#     datadir="."
#   fi
# fi
# echo $datadir
exit

echo "Install Vim-Advantages"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  echo "Linux detected"
  installations="apt-get install -y fzf silversearcher-ag ripgrep"
  plug_vim="wget -q https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim "+$datadir+"plug.vim"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  echo "macOS detected"
  installations="apt-get install -y fzf silversearcher-ag ripgrep"
  plug_vim="wget -q https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim "+$datadir+"plug.vim"
elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
  echo "Windows detected"
  installations=""
  plug_vim="curl -o "+$datadir+"plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim"
else
  echo "Unknown operating system: $OSTYPE"
fi

eval $installations
eval $plug_vim

# if [ -f "./plug.vim" ]; then
#   mv plug.vim ~/.vim/autoload/plug.vim
# fi
#   echo ""
#   plug_loaded=false
#   exit
# else
#   plug_loaded=true
# fi
# echo $plug_loaded

echo "installing"

if $plug_loaded; then
  vim -c "source plug.vim | call plug#begin() | Plug 'vi0lin/vim-advantages' | call plug#end() | PlugInstall | quitall"
  unset plug_loaded
fi

# echo "Done Installing vi0lin/vim-advantages"
# echo ""
# echo "#####################################"
# echo "Configuration"

# main_repo="`pwd`"
# source_dir="`pwd`/src"
# bashrc="~/.bashrc"

# echo -n "Where Is Your Main Repository? [default=$main_repo]: "
# read -r _main_repo
# if [[ -n "$main_repo" ]]; then
#   main_repo=$_main_repo
# fi

# echo -n "Where Is Your SourceFolder? [default=$source_dir]: "
# read -r _source_dir
# if [[ -n "$source_dir" ]]; then
#   source_dir=$_source_dir
# fi

# echo -n "Where Is Your .bashrc? [default=$bashrc]: "
# read -r _bashrc
# if [[ -n "$_bashrc" ]]; then
#   bashrc=$_bashrc
# fi

# sed -i '/^call EnsureEnvironment()/ { N; s/^call EnsureEnvironment()\n/&call SetEnvironment("~", "'$main_repo'", "'$source_dir'", "'$bashrc'")\n/ }' ~/.vim/plugged/vim-advantages/src/Functions.vim
