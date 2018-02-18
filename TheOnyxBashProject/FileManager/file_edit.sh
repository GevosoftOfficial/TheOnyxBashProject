# The Onyx Bash Project File Manager file_edit
# # A Program that edits text-files
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
# Checks if the file .tmp_filename.txt exists.
# If the file exists the script continues, but if it doesn't exist the script exits back to main File Manager script (FileManager.sh)
if [ -e .tmp_filename.txt ]
	then
		# The file exists the script continues
		# Gets current working file name from the -tmp_filename.txt file and stores it in the variable 'filename'
		filename=$(cat .tmp_filename.txt)
		#Checks if the file .user_data_texteditor.txt exists.
		# If the file exists the script continues, but if it doesn't exists the script asks the user to set it up by calling the setup/settings script (FileManagerSettings.sh)
		if [ -e .user_data_texteditor.txt ]
			then
				# The file exits the script continues 
				# Gets the users prefered text-editor by getting it from one of the settings files called '.user_data_texteditor.txt' and stores it in the variable 'text_editor'
				text_editor=$(cat .user_data_texteditor.txt)

				# Part 1 : Open the file in text-editor

				# Opens the file in the users preferd text-editor.
				$text_editor $filename

				# Part 2 : Exit
				# Exits back to the main File Manager Script (FileManager.sh)
				sh FileManager.sh
				clear
				exit 
		else
			# Notices the user and calls the Setup/Settings Script (FileManagerSettings.sh)
			echo "No default text-editor chosen please set it up!"
			# Gets confirmation input stored in a temporsry variable
			read tmp
			# Exits the script into the Settings/Setup script (FileManagerSettings.sh)
			sh FileManagerSettings.sh
			clear
			exit
		fi 
else
	# The file doesn't exists the script exits
	sh FileManager.sh
	clear
	exit
fi
