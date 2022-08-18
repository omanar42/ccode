# *********************************************** #
#      ____  ____ ___  ____ _____  ____ ______    #
#     / __ \/ __ `__ \/ __ `/ __ \/ __ `/ ___/    #
#    / /_/ / / / / / / /_/ / / / / /_/ / /        #
#    \____/_/ /_/ /_/\__,_/_/ /_/\__,_/_/         #
#                                                 #
#    Script                                       #
#    By: omanar <omanar@student.1337.ma>          #
#    Created: 2022/08/18 03:45 AM by omanar       #
#                                                 #
# *********************************************** #

#! /bin/bash

# START #

echo "What is the name of your project?"
read projectName

if [ -z $projectName ]; then
	echo "\033[0;31m</ Please give a name! >\033[0m"
elif [ -d $projectName ]; then
	echo "\033[0;31m</ Project already exists! >\033[0m"
else
	mkdir $projectName
	mkdir $projectName/srcs
	touch $projectName/srcs/$projectName.c
	mkdir $projectName/includes
	touch $projectName/includes/$projectName.h
	mkdir $projectName/libs
	touch $projectName/Makefile
	cat >> $projectName/Makefile < templates/Makefile.template
	echo "\033[1;32m</ Project has been Created! >\033[0m"
fi

# END #
