# .bashrc
# Shell command

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi


# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# Reserved variable
# | Variable | Description                      |
# |----------+----------------------------------|
# | HOME     | User home directory              |
# | PATH     | Excuted file path                |
# | LANG     | Support language                 |
# | UID      | User ID                          |
# | SHELL    | Excuted shell when login         |
# | FUNCNAME | Function name of current excuted |
# | TERM     | Login terminal                   |

echo "Starting ~/.bashrc"


export VCS_HOME="/cad/synopsys/vcs/R-2020.12-SP2-9"
export LM_LICENSE_FILE="27020@192.168.1.203"
export MGLS_LICENSE_FILE=1717@x8086
export VERILATOR_AUTHOR_SITE=1

if [ -n "${LD_LIBRARY_PATH}" ]; then
   export LD_LIBRARY_PATH="/usr/lib:/usr/lib64:$LD_LIBRARY_PATH"
else
   export LD_LIBRARY_PATH="/usr/lib:/usr/lib64"
fi
export LD_LIBRARY_PATH="/usr/local/lib/:$LD_LIBRARY_PATH"

PATH=${PATH}:$VCS_HOME/bin										# Already added in PATH. Therefore it will be duplicated
PATH=${PATH}:/data/local/script								# Already added in PATH. Therefore it will be duplicated
PATH=${PATH}:/cad/mentor/questa/questasim/bin # Already added in PATH. Therefore it will be duplicated

##################################################
# verdi
##################################################
export NOVAS_HOME="/cad/synopsys/verdi"
export LD_LIBRARY_PATH="$NOVAS_HOME/share/PLI/VCS/linux64/:$LD_LIBRARY_PATH"
PATH="${PATH}:$NOVAS_HOME/bin"								# Already added in PATH. Therefore it will be duplicated

##################################################
# Emacs sudo path
##################################################
# alias emacs='/var/lib/snapd/snap/bin/emacs'

##################################################
# UVM path
##################################################
export UVM_HOME="/data/UVM_LIB"

##################################################
# RISCV path
##################################################
export RISCV="/data/RISCV/chipyard-tc"			
#export MAKEFLAGS="$MAKEFLAGS -jN" # Assuming you have N cores on your host system
PATH="${PATH}:$RISCV/bin"										# Already added in PATH. Therefore it will be duplicated

export LD_LIBRARY_PATH="$RISCV/lib:$LD_LIBRARY_PATH"

#riscv-gnu-toolchain
export RISC5GNUTOOL=/data/RISCV/GNUtoolchain
PATH="${PATH}:$RISC5GNUTOOL/bin"						# Already added in PATH. Therefore it will be duplicated

##################################################
# Clangd
##################################################
export CLANGD="/data/tools/llvm"
PATH="${PATH}:$CLANGD/bin"									# Already added in PATH. Therefore it will be duplicated

##################################################
# Export PATH
##################################################
if [ -z "${PATH-}" ]; then # if (PATH == NULL)
	export PATH
fi

##################################################
# Remove duplicate $PATH entries
##################################################
if [ -n "$PATH" ]; then # if (PATH != NULL)
  old_PATH=$PATH:;
	# echo "Original full PATH: ----------"
	# echo "${PATH}"
	PATH=
  while [ -n "$old_PATH" ]; do
    x=${old_PATH%%:*}       # the first remaining entry
		# echo "Slicing PATH the first remaining entry: ----------"
		# echo "${x}"
    case $PATH: in
      *:"$x":*) ;;          # already there, do nothing
      *) PATH=$PATH:$x;;    # [default] not there yet
    esac # [endcase]
		# echo "New PATH: ----------"
		# echo "${PATH}"
    old_PATH=${old_PATH#*:}
  done
  PATH=${PATH#:}
  unset old_PATH x
fi

##################################################
# Alias
##################################################
alias term="gnome-terminal &"
alias scl_en="scl enable devtoolset-7 bash"
alias so="source ~/.bashrc"
alias vcs='vcs -full64'
alias dve='dve -full64'
alias vcssim='vcssim.sh'
alias emacs='/var/lib/snapd/snap/bin/emacs'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# alias ls='ls -F'
alias c='clear'

