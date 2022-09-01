#!/bin/bash
#Author Oussama MANAR
#42login : omanar

# *********************************************** #
#      ____  ____ ___  ____ _____  ____ ______    #
#     / __ \/ __ `__ \/ __ `/ __ \/ __ `/ ___/    #
#    / /_/ / / / / / / /_/ / / / / /_/ / /        #
#    \____/_/ /_/ /_/\__,_/_/ /_/\__,_/_/         #
#                                                 #
#    ccode                                        #
#    By: omanar <omanar@student.1337.ma>          #
#    Created: 2022/08/18 03:45 AM by omanar       #
#                                                 #
# *********************************************** #

#get the shell configuration file name
shell_config=$(echo -n "$SHELL" | awk -F / '{print $3}')
shell_config="${HOME}/.${shell_config}rc"
CCODE_DIR="${HOME}/.ccode"

#banner
sleep 0.2
echo -e "\n"
echo -e " 	░█▀▀░█▀▀░█▀█░█▀▄░█▀▀ "
echo -e " 	░█░░░█░░░█░█░█░█░█▀▀ "
echo -e " 	░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀▀▀ "
echo -en "\n     By: "
echo -e "\033[1;35mOmanar\033[0m [Oussama MANAR]\n"

ccode_install() {
	if [[ -d $CCODE_DIR ]]; then
		rm -rf $CCODE_DIR;
		sleep 0.5
		echo -e "\033[0;31m\n </ -- Removed the old ccode! -- >\033[0m"
	fi

	if [[ ! -d $CCODE_DIR ]]; then
		mkdir $CCODE_DIR
		cp -r templates/ $CCODE_DIR/templates
		cp ./ccode.sh $CCODE_DIR/ccode.sh
		chmod +x $CCODE_DIR/ccode.sh
	fi
	echo -e "\nalias ccode='bash ~/.ccode/ccode.sh'" >>"$shell_config"
}

#test if it is already installed
if grep "alias ccode='bash ~/.ccode/ccode.sh'" <"$shell_config" &>/dev/null; then
	echo -e "\033[33m\n </ -- ccode Already installed! -- >\033[0m"
	sleep 0.5
	echo -e "\033[36m\n Please, run this command:\n  \033[0;35m source $shell_config"
	echo -e "\033[36m\n Then:\n  \033[0;35m ccode\033[0m"
	sleep 0.5
	echo -e	"\n    	 Please report any issues:"
	echo -en "\n\033[1;30m    	     GitHub"
	echo -en "\033[1;32m ➜  \033[0m"
	echo -e	"\033[1;35momanar42\n\033[0m"
	exit 0
fi

if ! grep "alias ccode='bash ~/.ccode/ccode.sh'" <"$shell_config" &>/dev/null; then
	ccode_install
fi

if grep "alias ccode='bash ~/.ccode/ccode.sh'" <"$shell_config" &>/dev/null; then
	sleep 0.5
	echo -e "\033[1;32m\n </ ccode Has Been Installed Successfully! >\033[0m"
	sleep 0.5
	echo -e "\033[36m\n Please, run this command:\n  \033[0;35m source $shell_config"
	echo -e "\033[36m\n Then:\n  \033[0;35m ccode\033[0m"
else
	sleep 0.5
	echo -e "\033[31m\n </ -- failed to install ccode command ! -- >\033[0m"
	sleep 0.5
	echo -e	"\n    	 Please report any issues:"
	echo -en "\n\033[1;30m    	     GitHub"
	echo -en "\033[1;32m ➜  \033[0m"
	echo -e	"\033[1;35momanar42\n\033[0m"
	exit 1
fi

sleep 0.5
echo -e	"\n    	 Please report any issues:"
echo -en "\n\033[1;30m    	     GitHub"
echo -en "\033[1;32m ➜  \033[0m"
echo -e	"\033[1;35momanar42\n\033[0m"

exit 0
