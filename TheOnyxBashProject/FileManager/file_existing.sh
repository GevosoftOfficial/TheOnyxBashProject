# The Onyx Bash Project File Manager file_existing
# A Program that opens files that already exist on the system for to be used by other parts of The Onyx bash Project File Manager
# 1.0
# 
# Edvard Busck-Nielsen, Gevosoft, hereby disclaims all copyright interest in the program “The Onyx Bash Project File Manager” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 13 November 2017
# Edvard Busck-Nielsen, President of Gevosoft Technology Development & Developer at Gevosoft Technology Development

# Copyright 2018, 2018 Edvard Busck-Nielsen
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
# Shows a header using 'figlet'
figlet -f mini O n y x  B a s h  F i l e  M a n a g e r
echo "\033[4m\033[1mChoose File\033[0m"
echo ""

# Part 1 : User input

# Shows a list of all the files in the 'Documents' Directory
ls -l
echo ""
# Asks the user for a filename and stores it in the variable 'filename'
printf "Select File: "
read -r filename

# Part 2 : File Check

# If statement for checking if the file exists to prevent errors from outside the script.
if [ -e $filename ]
	then
		# The file exists the script continues.
		
		# Part 3 : Opening the file
		
		# Creates a temporary file called 'tmp_filename.txt' with the users selected filename for other scripts to use.
		# Removes it in case it exists. (It shouldn't be possible for it to exist but this is just to be sure.)
		rm .tmp_filename.txt
		touch .tmp_filename.txt
		# Inserts the filename.
		echo "$filename" >> .tmp_filename.txt

		# Part 4 : Exit
		
		# Exits the script into the main File Manager script (FileManager.sh)
		sh FileManager.sh
		clear
		exit
else
	# The file doesn't exist.
	# Shows error
	echo "Error! The file : $filename Doesn't exist. Please enter a valid filename!"
	# Confirmation input stored in temporary variable.
	read tmp
	#Exits the script into the main File manager script (FileManager.sh)
	sh FileManager.sh
	clear
	exit
fi
