# The Onyx Bash Project File Manager file_delete
# A Program that deletes text files
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

		# Part 1 : Warning message & Confirmation
		
		# Shows a header using 'figlet'
		figlet -f mini O n y x  B a s h  F i l e  M a n a g e r
		echo "\033[4m\033[1mDelete File : $filename\033[0m"
		echo ""
		# Warns the user and asks for confirmation.
		echo "WARNING! The File : $filename Will Be DELETED And Lost FOREVER!"
		echo "Proceed? y(yes)/n(no)"
		# Gets user input stored in 'delete_y_n'
		read delete_y_n

		# Part 2 : Delete Proceed Check
		
		# If sttatement to check what the user typed.
		if [ "$delete_y_n" = "y" ]
			then
				# The user picked 'yes' The file will be deleted
				
				# Part 3 : Deletion
				
				# The current working file deletes
				rm $filename

				# Part 4: Exit
				
				# The script exits into the File Manager Logout script (FileManagerLogout.sh) to tidy up the temporary files etc.
				sh FileManagerLogout.sh
				clear
				exit
		elif [ "$delete_y_n" = "n" ]
			then
				# The user picked 'no' The file will NOT be deleted.
				# Shows a confirmation message.
				echo "File Will Not be deleted."
				# Confirmation input stored in temporary variable
				read tmp
				# Exits the script into the main File Manager Script (FileManager.sh)
				sh FileManager.sh
				clear
				exit
		else
			# In case none of the above apply
			# Shows error and exits
			echo "Error please choose y/n"
			# Confirmation input stored in temporary variable
			read tmp
			# Exits the script into the main File Manager script (FileManager.sh) 
			sh FileManager.sh
			clear
			exit
		fi
else
	# The file doesn't exits and the script exits into the main File Manager script (FileManager.sh)
	# Shows error
	echo "Error! No file selected. Please select one first!"
	# Exit the script.
	sh FileManager.sh
	clear
	exit
fi