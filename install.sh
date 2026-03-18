#!/bin/bash

# autocmd! BufWritePost install.sh :call RedoCommandToTerm("l")
# autocmd! BufWritePost install.sh

# arg=${1:+0}
arg=$1
if [ -n $arg ]; then
  dbg=$([[ "$1" == "debug" ]] && echo true || echo false)
fi

debug() {
  if $dbg; then
    echo "$@"
  fi
}

debug "Debug:" $dbg

file_exists () {
  return $(test -f $@) && return 0 || return 1
}

tmpfile="vimgather.tmp"

vim_gather() {
  args=$@
  # printf -v "$1" '%s ' "${args[1]}" "${@:2}"
  command=${@:2}
  debug Command $command
  if ! file_exists $tmpfile; then
    # New Line Seems To Be Impossibile
    $vimbinary -es << VIMSCRIPT
let variable=execute('$command')->split("\n")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})
call writefile(variable, "$tmpfile")
qa!
VIMSCRIPT
    if file_exists $tmpfile; then
      vimgather=$(cat $tmpfile)
      rm $tmpfile
    fi
  else
    echo "File exists, remove it manualy."
  fi
  printf -v "$1" '%s ' "$vimgather"
}

install() {
  _check_binary() {
    if [[ -z $(which $1) ]]; then
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
  # scriptnames=$(vim_gather "redir=>variable | scriptnames | redir END")
  vim_gather scriptnames "scriptnames"
  for scriptname in $scriptnames; do
    echo $scriptname
  done
  # debug $scriptnames
  vimplug_exists=$([[ -f plug.vim ]] && echo true || echo false)

  file_exists $tmpfile && echo $tmpfile exists. Consider removing it or change the directory and start again && exit 0 || echo "Checking Runtime Path"

  # &vimruntime
  vim_gather vimruntime "echo split(\$VIMRUNTIME, ',')[0]"
  debug Vimruntime $tmpfile $vimruntime
  plugins=$vimruntime"/plugin/"
  vim_folder="~/.vim"
  plugins=$vim_folder"/autoload/"

  vimplug_exists=$([[ -f ${plugins}plug.vim ]] && echo true || echo false)
  debug plugins $plugins
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
      wget_plug_vim="wget -q $plugvim -O ${plugins}plug.vim"
      ;;
    "mac")
      manager="choc"
      installations="$manager install -y fzf silversearcher-ag ripgrep"
      wget_plug_vim="wget -q $plugvim -o ${plugins}plug.vim"
      ;;
    "win")
      manager="pacman"
      installations=""
      wget_plug_vim="curl -fLo ${plugins}plug.vim $plugvim"
      ;;
    "device")
      manager="apk"
      installations="$manager add fzf ripgrep"
      wget_plug_vim="wget -q $plugvim -P ${plugins}"
      ;;
    "unknown"|*)
      echo "Exiting: unknown device"
      exit 1
      ;;
  esac

  echo "Installing Additional Software"
  debug "sudo" $installations
  # eval "sudo" $installations

  if ! $vimplug_exists; then
    echo "Installing Vim Plug (plug.vim)"
    debug "sudo" $wget_plug_vim
    # eval "sudo" $wget_plug_vim
  else
    echo "Plug.vim is already installed"
    echo "Implement Check For Updates"
  fi

  echo "Installing Vim-Advantages (with plug.vim)"
  # $vimbinary -es -c "source ${plugins}plug.vim | call plug#begin() | Plug 'vi0lin/vim-advantages' | call plug#end() | PlugInstall | quitall"
}

install "vim"
install "nvim"
