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

# ==================== START ==================== #

#banner
sleep 0.2
echo -e "\n"
echo -e " 	░█▀▀░█▀▀░█▀█░█▀▄░█▀▀ "
echo -e " 	░█░░░█░░░█░█░█░█░█▀▀ "
echo -e " 	░▀▀▀░▀▀▀░▀▀▀░▀▀░░▀▀▀ "
echo -en "\n     By: "
echo -e "\033[1;35mOmanar\033[0m [Oussama MANAR]\n"
sleep 0.2
echo -n "Insert Project title: " # Ask for project title
read projectName # Get project title

# Define auxiliary variables
DFL_DIR="$HOME/Desktop";
headerfile="$DFL_DIR/$projectName/includes/$projectName.h"
mainfile="$DFL_DIR/$projectName/srcs/$projectName.c"
upper=$(echo "$projectName" | awk '{print toupper($0)}')
CCODE_DIR="${HOME}/.ccode"

# get the correct ccode directory
if [[ ! -d $CCODE_DIR ]]; then
	CCODE_DIR="."
fi

if [ -z $projectName ]; then # If project title is empty
	echo -e "\033[0;31m </ -- Enter The Project Title! -- >\n\033[0m" # Display error message
elif [ -d $DFL_DIR/$projectName ]; then # If project title is already exist
	echo -e "\033[0;31m\n </ -- Project Title Already Exists! -- >\n\033[0m" # Display error message
else # If project title is valid
	mkdir $DFL_DIR/$projectName # Create project directory
	mkdir $DFL_DIR/$projectName/includes # Create includes directory
	touch $headerfile # Create header file
	mkdir $DFL_DIR/$projectName/srcs # Create srcs directory
	touch $mainfile # Create main file
	echo "#include <$projectName.h>" >> $mainfile # Include header file in main file
	cat >> $mainfile < $CCODE_DIR/templates/main.template # Add main file template
	mkdir $DFL_DIR/$projectName/libs # Create libs directory
	echo -en "\nAdd libft? (y/n): " # Ask for libft choice
	read answer # Get libft choice
	if [ -z $answer ] || ( [ $answer != "y" ] && [ $answer != "n" ] ); then # If libft choice is empty or invalid
		sleep 0.25
		echo -e "\033[31m\n </ -- An error occurred in the answer -- >\033[0m" # Display error message
		echo -e "\033[33m\n </ -- Libft Not Added -- >\033[0m" # Display message
	elif [ $answer = "y" ]; then # If libft choice is yes
		cp -r $CCODE_DIR/templates/libft $DFL_DIR/$projectName/libs/libft # Add libft directory
		sleep 0.5
		echo -e "\033[0;36m\n </ --  Libft Added Successfully --  >\033[0m" # Display success message
	else # If libft choice is no
		sleep 0.25
		echo -e "\033[33m\n </ -- Libft Not Added -- >\033[0m" # Display message
	fi # End if libft choice
	echo "#ifndef "$upper"_H" >> $headerfile # Define header file
	echo "# define "$upper"_H" >> $headerfile # Define header file
	echo "" >> $headerfile # Add epmty line
	if [ -d $DFL_DIR/$projectName/libs/libft ]; then # If libft directory is exist
		echo "# include <libft.h>" >> $headerfile # Add libft header file
	fi # End if libft directory is exist
	echo "# include <stdio.h>" >> $headerfile # Add stdio header file
	echo "# include <unistd.h>" >> $headerfile # Add unistd header file
	echo "# include <stdlib.h>" >> $headerfile # Add stdlib header file
	echo "" >> $headerfile # Add epmty line
	echo "#endif" >> $headerfile # End define header file
	touch $DFL_DIR/$projectName/Makefile # Create Makefile
	echo "NAME	=	$projectName" >> $DFL_DIR/$projectName/Makefile # Add Makefile template
	cat >> $DFL_DIR/$projectName/Makefile < $CCODE_DIR/templates/Makefile.template # Add Makefile template
	sleep 0.5
	echo -e "\033[1;32m\n </ $projectName Has Been Created Successfully! >\n\033[0m" # Display success message
fi # End if project title is valid

sleep 0.25
echo -e	"\n    	 Please report any issues:"
echo -en "\n\033[1;30m    	     GitHub"
echo -en "\033[1;32m ➜  \033[0m"
echo -e	"\033[1;35momanar42\n\033[0m"

exit 0 # Exit script

# ==================== END ==================== #
