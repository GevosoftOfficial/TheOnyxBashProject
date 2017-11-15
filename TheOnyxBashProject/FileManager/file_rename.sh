# The Onyx Bash Project File Manager file_rename
# # A Program that renames text-files
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
# Checks if the file .tmp_filename.txt exists.
# If the file exists the script continues, but if it doesn't exist the script exits back to main File Manager script (FileManager.sh)
if [ -e .tmp_filename.txt ]
	then
		# The file exists the script continues
		# Gets the current working file's name from the .tmp_filename.txt file and stores it in the variable 'filename'.
		filename=$(cat .tmp_filename.txt)
		
		# Part 1 : New Name Input
		
		# Shows a header using 'figlet'
		figlet -f mini O n y x  B a s h  F i l e  M a n a g e r
		echo "\033[4m\033[1mRename File : $filename\033[0m"
		echo ""
		# Gets the new filename from the user
		# User input stored in the variable 'new_filename'
		printf "New Filename for : $filename : "
		read -r new_filename

		# Part 2 : Renaming
		
		# Renames the current working file using the 'new_filename' variable.
		mv $filename $new_filename

		# Part 3 : .tmp_filename.txt Fixing
		
		# Because the current working filename is changed the .tmp_filename.txt file is invalid and it has to be fixed.
		# Removes the old .tmp_filename.txt File
		rm .tmp_filename.txt
		# Creates a new one
		touch .tmp_filename.txt
		# Inserts the new current working filename into it
		echo "$new_filename" >> .tmp_filename.txt

		# Part 4 : Exit
		
		# The script has finished and exits back into the main File Manager script (FileManager.sh)
		# Show a confirmation message.
		echo "File : $filename renamed to : $new_filename"
		# Confirmation input stored in temporary variable.
		read tmp
		# Exits the script
		sh FileManager.sh
		clear
		exit
else
	# The File doesn't exist the script exits into the main File Manager script (FileManager.sh)
	# Shows error.
	echo "Error! No file selected. Please select one first!"
	# Confirmation input stored in a  temporary variable.
	read tmp
	# Exits the script
	sh FileManager.sh
	clear
	exit
fi