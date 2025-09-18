#!/bin/bash
echo "Install Vim-Advantages"

if ! [ -f "./plug.vim" ]; then
  wget -q https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim ./plug.vim
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
main_repo="~"
source_dir="~"
bashrc="~/.bashrc"

echo -n "$main_repo Is This Your Main Repository? [yN]: "
read -n 1 ismainrepo
echo ""
if [[ "$ismainrepo" =~ [nN] ]]; then
  echo -n "Define Your Main Repo: "
  read -r main_repo
fi

echo -n "$source_dir Is This Your Sources Folder? [yN]: "
read -n 1 issourcedir
echo ""
if [[ "$issourcedir " =~ [nN] ]]; then
  echo -n "Define Your Sources Folder: "
  read -r source_dir
fi

brc=`find $main_repo -type f -name ".bashrc"`
echo $brc

echo -n "$bashrc Is This Your .bashrc? [yN]: "
read -n 1 isbashrc
echo ""
if [[ "$isbashrc" =~ [nN] ]]; then
  echo -n "Define Your .bashrc: "
  read -r bashrc
fi

sed '/^call EnsureEnvironment()/ { N; s/^call EnsureEnvironment()\n/&call SetEnvironment("~", "$main_repo", "$source_dir", "$bashrc")\n/ }' ~/.vim/plugged/vim-advantages/src/Functions.vim | head -n 20

