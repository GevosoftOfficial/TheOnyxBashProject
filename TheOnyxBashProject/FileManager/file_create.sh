# The Onyx Bash Project File Manager file_create
# # A Program that creates new text-files
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
# Shows a header using 'figlet'
figlet -f mini O n y x  B a s h  F i l e  M a n a g e r
echo "\033[4m\033[1mCreate New Text-File\033[0m"
echo ""

# Part 1 : Filename

# Asks the user for a filename stored in 'filename' variable
printf "Filename: "
read -r filename

# Part 2 : File validation

# Checks if the file already exists.
# If the file exists the script shows an error and restarts the script, but if the file doesn't exists the script continues.
if [ -e $filename ]
	then
		# The file exists
		# Shows error
		echo "Error! The filename : $filename already exists! Please use another one."
		# Confirmation input stored in temporary variable
		read tmp
		# Restarts the script
		sh file_create.sh
		clear
		exit
else
	# The file doesn't exist the script continues.
	
	# Part 3 : File Creation
	
	# The file is created
	touch $filename
	# Confirmation message.
	echo "$filename created..."
	# Confirmation input stored in temporary variable
	read tmp
	# Removes the .tmp_filename.txt file in case that it allready exists.
	rm .tmp_filename.txt
	# Creates the .tmp_filename.txt file for other scripts & inserts the filename into it.
	touch .tmp_filename.txt
	echo "$filename" >> .tmp_filename.txt

	# Part 4 : Exit
	
	# The script is done and exits into the File Action Script (FileManagerAction.sh)
	sh FileManagerAction.sh
	clear
	exit
fi