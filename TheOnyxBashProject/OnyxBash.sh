# The Onyx Bash Project
# The Main Onyx Bash Program
# 3.0
# 
# Edvard Busck-Nielsen, Gevosoft, hereby disclaims all copyright interest in the program “The Onyx Bash Project” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 13 November 2017
# Edvard Busck-Nielsen, President of Gevosoft Technology Development & Developer at Gevosoft Technology Development

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

# Part 0 : Setup & Checks

# Checks if some neccecary files exist
# Checks if this is the first time opening the program to know it to run the setup file(s)
if [ -e .user_data.txt ]
	then
		# The file exists the script continues
		# Gets the user's name from file : .user_data_name.txt the name is stored in variable 'user_name'
		user_name=$(cat .user_data_name.txt)

		# Part 1 : Home Screen
		
		# Clears the screen
		clear
		# Shows header
		figlet The Onyx Bash Project
		figlet -f mini H o m e
		# Shows the users name.
		echo "\033[4m\033[1m$user_name\033[0m"
		echo ""
		# Shows a list of the available programs
		cat .user_data_apps.txt
		echo ""

		# Part 2 : Action
		
		# Asks the user for a selected program.
		printf "Choose Program: "
		# Gets user input stored in 'app_selection' variable
		read -r app_selection
		# Checks if the selection in Kelly
		if [ "$app_selection" != "kelly" ]; then
			# Adds the '.sh' extension to the variable if it's not a python script
			app_selection="$app_selection.sh"
			# Checks if the program the user selected exists.
			if [ -e $app_selection ]
				then
					# The script exists the script continues
					# Exits the script into  the users selected program
					# Calls the corresponding program to the users input.
					sh $app_selection
					clear
					exit
			fi
		else
			# Adds the .py slection to the variable	
			app_selection="$app_selection.py"
			# Checks if the program the user selected exists.
			if [ -e $app_selection ]
				then
					# The script exists the script continues
					# Exits the script into  the users selected program
					# Calls the corresponding program to the users input.
					python $app_selection
					clear
					exit		
			else
				# The script doesn't exists the script restarts.
				# Informs the user
				echo "Error! The Program : $app_selection Was not found!"
				# Confirmation input stored in temporary variable
				read tmp
				# Restarts the script.
				sh OnyxBash.sh
				clear
				exit
			fi
		fi
		

else
	# The file doesn't exist the script runs setup scripts.
	# Clears the screen
	clear
	# Informs the user
	echo "\033[1mWelcome to The Onyx Bash Project (onyxbash.ml)\033[0m"
	echo "This is the first time running this program, please do some setup:"
	echo "\033[2mPress enter to continue with the setup...\033[0m"
	# Gets confirmation input stored in temporary variable
	read tmp
	# Exits into setup script.
	sh onyx_bash_setup.sh
	clear
	exit
fi
