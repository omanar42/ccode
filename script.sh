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

echo "What is the name of your project?"
read projectName
if [ -z $projectName ]; then
	echo "\033[0;31m</ Please give a name! >\033[0m"
elif [ -d $projectName ]; then
	echo "\033[0;31m</ Project already exists! >\033[0m"
else
	mkdir $projectName
	cd $projectName
	mkdir src
	touch src/$projectName.c
	mkdir includes
	touch includes/$projectName.h
	mkdir libs
	touch Makefile
	echo "\033[1;32m</ Project has been Created! >\033[0m"
fi