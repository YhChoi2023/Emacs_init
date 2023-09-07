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
# cd /data/

##################################################
# prompt
##################################################
#export PS1='\[\e]0;\w\a\][\u@\h \W]\$ '
#export PS1='\[\e]0;\W\a\][\u@\h \w]\$ '
export PS1='\[\e]0;\W\a\]\[\e[32m\]\u@\h \[\e[31m\]\w\[\e[0m\]\n\$ '

##################################################
# VCS
##################################################
export VCS_HOME="/cad/synopsys/vcs/R-2020.12-SP2-9"
# export LM_LICENSE_FILE="27020@192.168.1.203"
export LM_LICENSE_FILE="27020@192.168.4.203" # Change 230530
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
# Current path
##################################################
PATH="${PATH}:./"									# Already added in PATH. Therefore it will be duplicated

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



##################################################
# ARM Socrates
##################################################
export PR_HOME=/data/35_Uart/PL011_VC/uart_pl011                                                
export GLOBAL=/data/35_Uart/PL011_VC/global                                                     
export PERIPH=Uart                                                                      
#export SIMULATOR=modelsim                                                               
#export SIMULATOR=LDV
export SIMULATOR=VCS                                                               
export TEST_METH=noscan                                                                 
export HDL_SOURCE=verilog                                                               
export HDL_NETL=verilog                                                                 
export TEST_ENV=BUSTALK                                                                 
export LIB_SYNOP=/arm/fipd/design_kits/arm/tsmc90g/advantage/2006q2v2/aci/sc-ad/synopsys

##################################################
# ARMCompiler6.20.1_standalone_linux-x86_64
# - Path: Where would you like to install to? [default: /home/yhc/ArmCompilerforEmbedded6.20.1]
##################################################
PATH="${PATH}:/home/yhc/ArmCompilerforEmbedded6.20.1/bin"

##################################################
# ARMCompiler_506_Linux_x86_b960
# - Path: Where would you like to install to? [default: /home/yhc/ARM_Compiler_5.06u7]
##################################################
PATH="${PATH}:/home/yhc/ARM_Compiler_5.06u7/bin"

##################################################
# ARM_GNU_Compiler_12.3.rel1/
# - Path: /home/yhc/ARM_GNU_Compiler_12.3.rel1/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-elf
##################################################
PATH="${PATH}:/home/yhc/ARM_GNU_Compiler_12.3.rel1/arm-gnu-toolchain-12.3.rel1-x86_64-aarch64-none-elf\bin"

##################################################
# ARM_GNU_Compiler_12.3.rel1/ 
# - Path: /home/yhc/ARM_GNU_Compiler_12.3.rel1/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi
##################################################
PATH="${PATH}:/home/yhc/ARM_GNU_Compiler_12.3.rel1/arm-gnu-toolchain-12.3.rel1-x86_64-arm-none-eabi/bin"

##################################################
# ARM Development Studio
# Start DS with armds_ide
# Check dependency with dependency_check_linux-x86_64.sh
##################################################
PATH="${PATH}:/opt/arm/developmentstudio-2023.0/bin"
PATH="${PATH}:/opt/arm/developmentstudio-2023.0/sw/dependency_check"

##################################################
# License comfiguration for Arm Compiler (inculdeing Fusa)
# URL: developer.arm.com/documentation/ka004854/latest/
##################################################
# export ARM_PRODUCT_DEF="/opt/arm/developmentstudio-2023.0/sw/mappings/gold.elmap"
# export ARM_PRODUCT_PATH="/home/yhc/ARM_Compiler_5.06u7/sw/mappings/"
# export ARMLMD_LICENSE_FILE="8224@192.168.4.210"
# export ARMLM_ONDEMAND_ACTIVATION=SWSKT-std0@https:192.168.4.201:7070

##################################################
# SSE-710 environment settings
# Reference: /data/39_sse710_0_out/sse710_0/
##################################################
# PATH="${PATH}:/data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/php/php-5.6.16/bin"
# PATH="${PATH}:/data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/perl/perl-5.18.1/bin/"
# PATH="${PATH}:/data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/python/Python-3.7.1/bin/python3"
# PATH="${PATH}:/data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/ad_3p_tools/xalan_1_8_0/linux/bin"
# PATH="${PATH}:"
# PATH="${PATH}:"
# PATH="${PATH}:"
# PATH="${PATH}:"
# PATH="${PATH}:"
# PATH="${PATH}:"





# setenv PATH /data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/php/php-5.6.16/bin
# :/data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/perl/perl-5.18.1/bin/
# :/data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/python/Python-3.7.1/bin/python3
# :/data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/ad_3p_tools/xalan_1_8_0/linux/bin
# :$PATH

# setenv PERL5LIB /data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/perl/perl-5.18.1/lib/site_perl/5.18.1/
# :/data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/perl/perl-5.18.1/lib/
# :$PERL5LIB

# setenv PYTHONHOME /data/zaram_soc_db/tools/ARM-Socrates/etc/thirdparty/python/Python-3.7.1

# setenv PYTHONSTARTUP " "







