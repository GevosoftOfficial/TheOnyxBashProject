# The Onyx Bash Project System Settings
# Settings script for The Onyx Bash Projects script(s)
# Beta
# 
# Edvard Busck-Nielsen, Tell Space, hereby disclaims all copyright interest in the program “The Onyx Bash Project System Settings” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 13 November 2017
# Edvard Busck-Nielsen, President of Tell Space Technology Development & Developer at Tell Space Technology Development

# Copyright 2017, 2017 Edvard Busck-Nielsen
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

# Part 0 : Setup

# Clears the screen
clear

# Part 1 : Header/Menu

# Show a header using 'figlet'
figlet T h e   O n y x   B a s h   P r o j e c t
figlet -f mini S y s t e m   S e t t i n g s
echo ""
# Shows a list of available settings commands.
echo "\033[1m\033[4mSettings: 1) Onyx Bash Settings, 2) File Manager Settings, 3) Exit\033[0m"
echo ""

# Part 2 : Settings Action

# Asks the user for a preferd settings action from the actions list.
# User input stored in 'settings_action'
printf "Action: "
read -r settings_action

# Part 3 : Action check

# If statement to check what action the user picked
if [ "$settings_action" = "1" ]
	then
		# The user picked 'Onyx Bash Setitngs'
		# Runs the onyx setup script.
		sh onyx_bash_setup.sh
		clear
		exit
elif [ "$settings_action" = "2" ]
	then
		# The user picked 'File Manager Settings'
		# Runs the File Manager setup script
		# Changes to the File manager Directory
		cd FileManager
		# Runs the setup script.
		sh setup.sh
		clear
		exit
elif [ "$settings_action" = "3" ]
	then
		# The user picked 'Exit'
		# Exits the script into main Onyx Bash script 'OnyxBash.sh'
		sh OnyxBash.sh
		clear
		exit
else
	# None of the above rules apply
	# Shows an error and exits
	echo "Error! Please select one of the numbed actions."
	# Confirmation input to temporary variable.
	read tmp
	# Exits the script
	clear
	exit
fi
