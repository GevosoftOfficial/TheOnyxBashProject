# The Onyx Bash Project File Manager file_ro
# A Program that shows the contents of text-files in R-O (Read-Only) Format.
# Beta
# 
# Edvard Busck-Nielsen, Tell Space, hereby disclaims all copyright interest in the program “The Onyx Bash Project File Manager” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 13 November 2017
# Edvard Busck-Nielsen, President of Tell Space Technology Development & Developer at Tell Space Technology Development

# Copyright 2017, 2017 Edvard Busck-Nielsen
!/bin/bash

# This file is part of The Onyx Bash Project File Manager.

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
		# The file exists the script continues.
		# Gets the current working filename from the .tmp_filename.txt , and stores it in : 'filename' variable.
		filename=$(cat .tmp_filename.txt)
		# Gets the content of the current working file and stores it in the variable 'file_content' (Not in use can be useful later)
		file_content=$(cat $filename)
		# Clears the screen.
		clear
		# Part 1 : Show File Content
		
		# Shows a header using 'figlet'
		figlet -f mini O n y x  B a s h  F i l e  M a n a g e r
		echo "\033[4m\033[1mContent Of : $filename\033[0m"
		echo ""
		# Prints out the current working files content.
		cat $filename
		# Prints out a message to show the end of the file.
		echo "\033[7m***END OF FILE***\033[0m"
		# Gets confirmation input stored in a temporary variable.
		read tmp

		# Part 2 : Exit
		
		# Exits the script into the main File Manager script (FileManager.sh)
		sh FileManager.sh
		clear
		exit
else
	# The file doesn't exist and the script exits into the main File Manager Script (FileManager.sh).
	# Shows error!
	echo "Error! No File Selected Please select one first."
	# Confirmation input stored in temporary variable
	read tmp
	# Exits the script into main File Manager Script (FileManager.sh)
	sh FileManager.sh
	clear
	exit
fi