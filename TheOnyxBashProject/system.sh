# The Onyx Bash Project System Information
# Simple script for showing some system information as a part of The Onyx Bash Project
# Beta
# 
# Edvard Busck-Nielsen, Tell Space, hereby disclaims all copyright interest in the program “The Onyx Bash Project System Information (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 13 November 2017
# Edvard Busck-Nielsen, President of Tell Space Technology Development & Developer at Tell Space Technology Development

# Copyright 2018, 2018 Edvard Busck-Nielsen
#!/bin/bash

# This file is part of The Onyx Bash Project.

#    The Onyx Bash Project is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    The Onyx Bash Project is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with The Onyx Bash Project.  If not, see <http://www.gnu.org/licenses/>.

# Contact and FAQ : http://onyxbash.ml OR See the README.
# Part 0 : Home Screen

#Clears the screen
clear
# Shows header using 'figlet'
figlet The Onyx Bash Project
figlet -f mini S y s t e m   I n f o r m a t i o n
echo ""
echo "\033[1m\033[4mBasic Info:\033[0m"
uname -a
echo ""
# Shows list of possible actions to take.
echo "\033[1m\033[4m1) Advanced System Info, 2) Exit\033[0m"
# Gets user input stored in the variable 'info_action'
printf ": "
read -r info_action
# If statement to check what action the user picked.
if [ "$info_action" = "1" ]
	then
		# The user picked 'Advanced System Info'
		# Shows advanced system info:
		# Informs the user about needed SU permissions.
		echo "\033[1m\033[4mThis script needs SU (Super-User) Permissions please enter your password below:\033[0m"
		sudo lshw -short
		# Informs the user for end of the command 'lshw (Short version)'
		echo ""
		echo "\0331m\033[4m***END*** Pres enter to exit.\033[0m"
		# Confirmation input stored in temporary variable.
		read tmp
		# Exits the script into main Onyx Bash script (OnyxBash.sh)
		sh OnyxBash.sh
		clear
		exit
		
elif [ "$info_action" = "2" ]
	then
		# The user picked 'Exit'
		# Exits the script into main Onyx Bash Script (OnyxBash.sh)
		sh OnyxBash.sh
		clear
		exit
else
	# None of the above rules apply.
	# Shows an error and restarts script.
	echo "Error! Please select one of the above numbered action (1/2)!"
	# Confirmation input stored in temporary variable.
	read tmp
	# Restarts the script
	sh system.sh
	clear
	exit
fi
