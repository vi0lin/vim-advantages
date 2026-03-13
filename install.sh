#!/bin/bash

arg=${1:+0}
if [[ $arg ]]; then
  debug=$([[ $1 == "debug" ]] && echo true || echo false)
fi

debug() {
  if $debug; then
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
  datadir=(
    "~/vimfiles/autoload"
    "~/.vim/autoload"
    "~/.vim/autoload"
    "~/.vim/autoload"
    "~/.local/share/nvim/site/autoload"
    "~/.config/nvim/autoload"
    "/usr/share/vim/vimfiles"
    "/usr/share/vim/vim92"
  )
  score_paths() {
    decision=""
    for dir in ${datadir[@]}; do
      decision=$dir
    done
    echo $decision
  }
  # echo $(score_paths)

  vimruntime_tmp_exists () {
    return $(test -f "vimruntime.tmp") && return 0 || return 1
  }

  vimplug_exists=$([[ -f plug.vim ]] && echo true || echo false)

  vimruntime_tmp_exists && echo "vimruntime.tmp exists. Consider removing it or change the directory and start again" && exit 0 || echo "Checking Runtime Path"

  # &vimruntime
  if ! vimruntime_tmp_exists; then
    $vimbinary -es \
      -c 'call writefile([ trim(split($VIMRUNTIME, ",")[0]) ], "vimruntime.tmp")' \
      -c 'qa!' \
      2>/dev/null
    if vimruntime_tmp_exists; then
      vimruntime=`cat vimruntime.tmp`
      rm vimruntime.tmp
    fi
  fi
  vimruntime=$vimruntime
  autoload=$vimruntime"/autoload/"

  vimplug_exists_in_vimruntime=$([[ -f ${autoload}/plug.vim ]] && echo true || echo false)
  debug $vimruntime
  debug $autoload
  # mkdir -p $vimruntime

  ostype=(
    [0]=device
    [1]=mac
    [2]=win
    [3]=lin
    [4]=unknown
  )

  debug "$OSTYPE"

  _get_os() {
    if [[ "$OSTYPE" == "linux-musl" ]]; then
      echo 0
    elif [[ "$OSTYPE" == "darwin"* ]]; then
      echo 1
    elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
      echo 2
    elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
      echo 3
    else
      echo "Unknown operating system: $OSTYPE"
      echo 4
    fi
  }

  os=${ostype[$(_get_os)]}

  debug $os

  echo -n "Installing Vim-Advantages"
  case  "$os" in
    "lin") echo " on linux" ;;
    "mac") echo " on macintosh";;
    "win") echo " on windows";;
    "device") echo " on device";;
    "unknown"|*) echo " on unknown";;
  esac

  case "$os" in
    "lin")
      manager="apt-get"
      installations="$manager install -y fzf silversearcher-ag ripgrep"
      plug_vim="wget -q $plugvim -o ${autoload}/plug.vim"
      ;;
    "mac")
      manager="choc"
      installations="$manager install -y fzf silversearcher-ag ripgrep"
      plug_vim="wget -q $plugvim -o ${autoload}/plug.vim"
      ;;
    "win")
      manager="pacman"
      installations=""
      plug_vim="curl -fLo ${autoload}/plug.vim $plugvim"
      ;;
    "device")
      manager="apk"
      installations="$manager add fzf ripgrep"
      plug_vim="wget -q $plugvim -P ${autoload}"
      ;;
    "unknown"|*)
      echo "Exiting: unknown device"
      exit 1
      ;;
  esac

  echo "Installing Additional Software"
  debug "sudo" $installations
  eval "sudo" $installations

  if ! $vimplug_exists_in_vimruntime; then
    echo "Installing Vim Plug (plug.vim)"
    debug "sudo" $plug_vim
    eval "sudo" $plug_vim
  else
    echo "Plug.vim is already installed"
    echo "Implement Check For Updates"
  fi

  echo "Installing Vim-Advantages (with plug.vim)"
  $vimbinary -es -c "source plug.vim | call plug#begin() | Plug 'vi0lin/vim-advantages' | call plug#end() | PlugInstall | quitall"
}

install "vim"
install "nvim"
