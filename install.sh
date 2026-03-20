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

signature="\" vim-advantage installation 2866039580"
sig_b=$signature" Begin"
sig_e=$signature" End"
debug sig_b $sig_b
debug sig_e $sig_e
get_files_with_signature() {
  unset files_with_signature
  files_with_signature=()
  for path in ${@}; do
    path="${path/#\~/$HOME}"
    grep -q "$sig_b" $path && files_with_signature+=("$path")
  done
  debug "Files With Signature:" ${files_with_signature[@]}
  # printf -v $1 '%s\n' "${files_with_signature[@]}"
  # declare -n ref="files_with_signature"
  # eval $1=$files_with_signature[@]
}
check_signature() {
  get_files_with_signature $@
  first_file=${@:1:1}
  debug first_file $first_file
  len=${#files_with_signature[@]}
  debug "Files With Signature:" $len
  [ $len -gt 1 ] && remove_signature ${files_with_signature[@]} && create_signature $first_file
  [ $len -eq 1 ] && update_signature ${files_with_signature[@]}
  [ $len -eq 0 ] && create_signature $first_file
  # [[ $len -lt 1 ]] && update_signature $@
}
create_signature() {
  debug "Create Signature" $@
  for file in "$@"; do
    local path="$file"
    path="${path/#\~/$HOME}"
    sudo sed -i "\$a$sig_b\n$source_command\n$sig_e" $path
  done
}
update_signature() {
  debug "Update Signature" $@
  for file in ${files_with_signature[@]}; do
    local path="$file"
    path="${path/#\~/$HOME}"
    # sed -z "s/\(^.*$signature\).*\(^.*$signature\)/\1\n\" ${date}\n\2/g" $file
    # sed "/$sig/{N; s/$sig.*$sig/\" $date/}" $file
    sudo sed -i -n "/$sig_b/{:a;N;/$sig_b/!ba;N;s/.*\n/$sig_b\n$source_command\n/};p" $file
    # sed -E 's/(\d*) (.*)/\0 == \t\1-->\t\2/'
    # echo $stdin | sed -E 's/(\d*) (.*)/\0 == \t\1-->\t\2/'
  done
  # echo "${files_with_signature[@]}"
  # echo "$@" | xargs -I {} grep vim-advantages {}
  # grep "$signature" "{}"
  # grep -rlZ "test" $files
}
remove_signature() {
  debug "Remove Signature" $@
  for file in ${files_with_signature[@]}; do
    sudo sed -i "/$sig_b/,/$sig_e/d" $file
  done
}
signature_exists() {
  sudo sed -n "/$sig_b/q" $1 && return 0 || return 1
}

file_exists2() {
  local path="$1"
  path="${path/#\~/$HOME}"
  [[ -e "$path" ]]
}

keep_existing() {
  unset existing
  existing=()
  for f in "$@"; do
    # f="${f##+([[:space:]])}"
    # if [[ -f $f ]]; then
    # realpath -m -- "$f"
    # echo "file exists: " $f
    file_exists2 $f && existing+=( "$f" )
  done
  # echo ${existing[@]}
  # printf -v $1 "%s\n" "${existing[@]}"
}

debug Debug: $dbg

file_exists () {
  return $(test -f $@) && return 0 || return 1
}

vimgather() {
  tmpfile="vimgather.tmp"
  # args=$@
  # printf -v "$1" '%s ' "${args[1]}" "${@:2}"
  # debug "vimgather args:" $@
  #
  # command=${@:1}
  command=${@:2}
  debug Command: $command
  if ! file_exists $tmpfile; then
    # New Line Seems To Be Impossibile
#    $vimbinary -es << VIMSCRIPT
#let variable=execute('$command')->split("\n")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})
#call writefile(variable, "$tmpfile")
#qa!
#VIMSCRIPT
    $vimbinary -e -c "redir! > $tmpfile | $command | redir END | qa!"
   # -c "redir > $tmpfile | echo execute('$command')->split(\"\\n\")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')}) | redir END | qa!"
    if file_exists $tmpfile; then
      vimgather=$(cat $tmpfile)
      #printf -v "$1" '%s' "$vimgather"
      eval $1=\$vimgather
      rm $tmpfile
    fi
  else
    echo "File exists, remove it manualy."
  fi

  file_exists $tmpfile && echo $tmpfile exists. Consider removing it or change the directory and start again && exit 0 || echo "Checking Runtime Path"
  debug "Tmpfile was deleted ($tmpfile)"
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
  # scriptnames=$(vimgather "redir=>variable | scriptnames | redir END")
  # vimgather scriptnames "scriptnames"
  vimgather scriptnames "echo execute('scriptnames')->split(\"\\n\")->map({_,v -> v->substitute('^\s*\d\+:\s*','','')})->join(\"\n\")"

  keep_existing $scriptnames

  # for scriptname in $scriptnames; do
  #   # echo "-> check for signature: " $scriptname
  #   if [ -f $scriptname ]; then
  #     echo $scriptname
  #     signature_exists $scriptname && echo $scriptname "sig found"
  #   fi
  # done
  # debug $scriptnameo
  vimplug_exists=$([[ -f plug.vim ]] && echo true || echo false)

  # &vimruntime
  vimgather vimruntime "echo split(\$VIMRUNTIME, \",\")[0]"
  debug Vimruntime: $vimruntime
  plugins=$vimruntime"/plugin/"
  vim_folder="~/.vim"
  source_command="source ${plugins}vim-advantages.vim"
  source_command=$(echo $source_command | sed 's;/;\\/;g' )
  debug source_command: $source_command
  plugins=$vim_folder"/autoload/"

  vimplug_exists=$([[ -f ${plugins}plug.vim ]] && echo true || echo false)
  debug Plugins: $plugins
  # mkdir -p $vimruntime

  ostype=(
    [0]=device
    [1]=mac
    [2]=win
    [3]=lin
    [4]=unknown
  )

  debug OsType: "$OSTYPE"

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

  debug ShortOsType: $os

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
  debug Installation Instruction: "sudo" $installations
  eval "sudo" $installations

  if ! $vimplug_exists; then
    echo "Installing Vim Plug (plug.vim)"
    debug Download Instructions: "sudo" $wget_plug_vim
    eval "sudo" $wget_plug_vim
  else
    echo "Plug.vim is already installed"
    echo "Implement Check For Updates"
  fi

  echo "Installing Vim-Advantages (with plug.vim)"

  # check if vim-advantages got sourced
  vimgather got_sourced "try | if exists('g:vim_advantages_got_sourced') | echo g:vim_advantages_got_sourced | endif | endtry"

  # debug "Got Sourced:" $got_sourced

  # echo $got_sourced | xxd -b
  # echo "0" | xxd -b
  # echo 0 | xxd -b

  # echo "$got_sourced" | xxd -b

  $vimbinary -es -c "source ${plugins}plug.vim | call plug#begin() | Plug 'vi0lin/vim-advantages' | call plug#end() | PlugInstall | quitall"

  # [[ $got_sourced ]] && ( echo "Vim Advantages Got Sourced!" ) || ( echo "Vim Advantages Not Loaded"; )
  check_signature $existing

  vimgather got_sourced "try | if exists('g:vim_advantages_got_sourced') | echo g:vim_advantages_got_sourced | endif | endtry"

  debug "Got Sourced:" $got_sourced

  [[ $got_sourced ]] && ( echo "Vim Advantages Got Sourced!" ) || ( echo "Vim Advantages Not Loaded"; )

}

install "vim"
# install "nvim"
