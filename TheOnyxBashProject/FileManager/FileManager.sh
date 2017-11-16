# The Onyx Bash Project File Manager
# A Program that functions as a full file manager in the Linux terminal 
# Beta
# 
# Edvard Busck-Nielsen, Tell Space, hereby disclaims all copyright interest in the program “The Onyx Bash Project File Manager” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 13 November 2017
# Edvard Busck-Nielsen, President of Tell Space Technology Development & Developer at Tell Space Technology Development

# Copyright 2017, 2017 Edvard Busck-Nielsen
!/bin/bash

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
 
# Clears the screen.
clear
# Checks if the file '.tmp_filename.txt' exists
# If the file exists the program will proceed to the File Actions Script (FileManagerAction.sh) Because this means that the user already have a working file selected.
# If the file doesn't exists the script continues to part 1.
if [ -e .tmp_filename.txt ]
	then
		# Actions if the file exists, The Actions Script is called.
		sh FileManagerAction.sh
		clear
		exit
else
		# The file doesn't exist, The script continues.

		# Part 1 : Startup

		# Shows a header using the 'figlet' command (The user needs to have 'figlet' installed)
		figlet The Onyx Bash Project
		figlet -f mini F i l e  M a n g e r
		echo ""
		echo ""
		# Creates a variable called 'list_files' equal to the output of the 'ls' command to be able to add styling to the output text.
		list_files=$(ls -C)
		# Shows the files in the directory.
		echo "\033[2m$list_files\033[0m"
		echo ""
		# Show a list of possible options.
		echo "1) Create a new File, 2) Use an existing File, 3) Exit the Program."
		# Gets user input stored in : file_action.
		printf ": "
		read -r file_action
		
		# Part 3 : Action check
		
		# If statement to check what option the user picker or to show an error.
		if [ "$file_action" = "1" ]
			then
				# The user picked option 'Create a new file'
				# Calls New file script (file_create.sh)
				sh file_create.sh
				clear
				exit
		elif [ "$file_action" = "2" ]
			then
				# The user picked option 'Use an existing file'
				# Calls Use existing file script (file_existing.sh)
				sh file_existing.sh
				clear
				exit
		elif [ "$file_action" =  "3" ]
			then
				# The user picked option 'Exit program'.
				# Exits the program
				clear
				exit
		elif [ "$file_action" = "" ]
			then
				# The user input was blank
				# Shows error
				echo "Error, Action can't be blank!"
				# Confirmation input to temporary variable
				read tmp
				# Restarts the script
				sh FileManager.sh
				clear
				exit
		else
			# In case none of the above rules apply
			# Shows error and restarts script
			echo "Error option, $file_action"
			sh FileManager.sh
			clear
			exit
		fi 
fi


