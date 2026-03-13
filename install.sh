#!/bin/bash

arg=${1:+0}
if [[ $arg ]]; then
  debug=$([[ $1 == "debug" ]] && echo true || echo false)
fi

debug() {
  if (( $debug )); then
    echo "$@"
  fi
}

install() {
  _check_binary() {
    if [[ -z `which $1` ]]; then
      return 1
    else
      return 0
    fi
  }
  _check_binary $1 && debug "$1 found: $(which $1)" || { debug "$1 not found"; return; }
  vimbinary=$1

  plugvim="https://raw.githubusercontent.com/junegunn/vim-plug/refs/heads/master/plug.vim"
  datadir_win_fallback="~/vimfiles/autoload/plug.vim"
  datadir_win_std="~/.vim/autoload/plug.vim"
  datadir_mac_std="~/.vim/autoload/plug.vim"
  datadir_lin_std="~/.vim/autoload/plug.vim"
  datadir_neovim_modern="~/.local/share/nvim/site/autoload/plug.vim"
  datadir_neovim_alt="~/.config/nvim/autoload/plug.vim"

  runtimepath_tmp_exists () {
    return $(test -f "runtimepath.tmp") && return 0 || return 1
  }

  runtimepath_tmp_exists && echo "runtimepath.tmp exists. Consider removing it or change the directory and start again" && exit 0 || echo "Checking Runtime Path"

  if ! runtimepath_tmp_exists; then
    $vimbinary -es \
      -c 'call writefile([ trim(split(&runtimepath, ",")[0]) ], "runtimepath.tmp")' \
      -c 'qa!' \
      2>/dev/null
    if runtimepath_tmp_exists; then
      runtimepath=`cat runtimepath.tmp`
      rm runtimepath.tmp
    fi
  fi
  autoload=$runtimepath"/autoload/"
  debug $autoload
  mkdir -p $autoload

  ostype=(
    [0]=device
    [1]=mac
    [2]=win
    [3]=lin
    [4]=unknown
  )

  debug $OSTYPE

  echo $OSTYPE

  _get_os() {
    if [[ "$OSTYPE" == "linux-musl" ]]; then
      return 0
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      return 1
    elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
      return 2
      elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
      return 3
    else
      echo "Unknown operating system: $OSTYPE"
      return 4
    fi
  }

  os=${ostype[$(_get_os)]}

  echo -n "Installing Vim-Advantages"
  case  "$os" in
    "lin") echo " on linux" ;;
    "mac") echo " on macintosh";;
    "win") echo " on windows";;
    "device") echo " on device";;
    *) echo " on unknown device";;
  esac

  case "$os" in
    "lin")
      packagemanager="apt-get"
      installations="$pkg install -y fzf silversearcher-ag ripgrep"
      plug_vim="wget -q $plugvim -o ${autoload}plug.vim"
      ;;
    "mac")
      packagemanager="choc"
      installations="$pkg install -y fzf silversearcher-ag ripgrep"
      plug_vim="wget -q $plugvim -o "$autoload"plug.vim"
      ;;
    "win")
      packagemanager="pacman"
      installations=""
      plug_vim="curl -fLo "$autoload"plug.vim $plugvim"
      ;;
    "device")
      echo "device"
      packagemanager="apk"
      installations="$pkg add fzf ripgrep"
      plug_vim="wget -q $plugvim -o ${autoload}plug.vim"
      ;;
    *)
      echo "Exiting: unknown device"
      exit 1
      ;;
  esac

  echo "Installing Additional Software"
  eval "sudo" $installations

  echo "Installing Vim Plug (plug.vim)"
  eval "sudo" $plug_vim

  echo "Installing Vim-Advantages (with plug.vim)"
  $vimbinary -es -c "source plug.vim | call plug#begin() | Plug 'vi0lin/vim-advantages' | call plug#end() | PlugInstall | quitall"
}

install "vim"
install "nvim"
