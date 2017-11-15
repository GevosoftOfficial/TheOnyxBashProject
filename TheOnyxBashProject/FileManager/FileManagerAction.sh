# The Onyx Bash Project File Manager Action
# A Program that handles the actions for a selected file
# Beta
# 
# Edvard Busck-Nielsen, Tell Space, hereby disclaims all copyright interest in the program “The Onyx Bash Project File Manager” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 13 November 2017
# Edvard Busck-Nielsen, President of Tell Space Technology Development & Developer at Tell Space Technology Development

# Copyright 2017, 2017 Edvard Busck-Nielsen
#!/bin/bash

#This file is part of The Onyx Bash Project File Manager.

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

# Clears the screen.
clear
# Checks if the file (.tmp_filename.txt) Exists.
# If the file exists the script continues.
# But if the file doesn't exist the program shows an Error and exits to the main File Manager script (FileManager.sh)
if [ -e .tmp_filename.txt ]
	then
		# The file exists. The script continues
		# Gets the working file's name from the .tmp_filename.txt file and stores it in the variable 'filename'.
		filename=$(cat .tmp_filename.txt)
		
		# Part 1 : File Action
		
		# Shows a header using 'figlet'
		figlet -f mini O n y x  B a s h  F i l e  M a n a g e r
		echo "\033[4m\033[1mChoose action for file : $filename\033[0m"
		echo ""
		# Shows a list of different actions for the current selected file
		echo "1) Create a new file, 2) Edit, 3) Read-Only File Content, 4) Rename, 5) Delete, 6) Go Back."
		# Gets user input stored in : 'file_action'
		printf ": "
		read -r file_action

		# Part 2: Action Check
		
		# If statement for checking what action the user chose.
		if [ "$file_action" = "1" ]
			then
				# The user chose 'Create a new file'
				# Calls the File Creation script (file_create.sh)
				sh file_create.sh
				clear
				exit
		elif [ "$file_action" = "2" ]
			then
				# The user chose 'Edit'
				# Calls the File edit script (file_edit.sh)
				sh file_edit.sh
				clear
				exit
		elif [ "$file_action" = "3" ]
			then
				# The user chose 'Read-Only File Content'
				# Calls the File R-O Content script (file_ro.sh)
				sh file_ro.sh
				clear
				exit
		elif [ "$file_action" = "4" ]
			then
				# The user chose 'Rename'
				# Calls the File renaming script (file_rename.sh)
				sh file_rename.sh
				clear
				exit
		elif [ "$file_action" = "5" ]
			then
				# The user chose 'Delete'
				# Calls the File deletion script (file_delete.sh)
				sh file_delete.sh
				clear
				exit
		elif [ "$file_action" = "6" ]
			then
				# The user chose 'Go Back'
				# Exits the script by calling the Logout Script (FileManagerLogout.sh) Because all the temporary files need to be deleted like .tmp_filename.txt file.
				sh FileManagerLogout.sh
				clear
				exit
		else
			# Error in case none of the above apply
			echo "Error! Action, $file_action not recognized!"
			# Confirmation input stored in temporary variable
			read tmp
			# Restarts the script.
			sh FileManager.sh
			clear
			exit
		fi
else
	# The file doesn't exist.
	# Error Warning:
	echo "Error! You haven't chosen a file to work with!"
	# Confirmation input into temporary variable
	read tmp
	# Exits into main File Manager script:
	sh FileManager.sh
	clear
	exit
fi