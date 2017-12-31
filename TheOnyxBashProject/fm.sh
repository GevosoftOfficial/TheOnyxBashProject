# The Onyx Bash Project filemanager
# A script for opening the main File Manager Script
# Beta
# 
# Edvard Busck-Nielsen, Tell Space, hereby disclaims all copyright interest in the program “The Onyx Bash Project filemanager” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 13 November 2017
# Edvard Busck-Nielsen, President of Tell Space Technology Development & Developer at Tell Space Technology Development

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

# Part 0 : Seup & Checks

# Checks if it's the first time opening the File Manager using a text file, witch means it needs setup.
if [ -e .user_data_filemanager.txt ]
	then
		# The file exits the script continues
		# Part 1 : Calls the script

		# Clears the screen
		clear
		# Changes directory
		cd FileManager
		# Calls the script
		sh FileManager.sh
		# Exits
		clear
		exit
else
	# The file doesn't exit runs the setup file (setup.sh)
	# Changes directory into the File Managers directory.
	cd FileManager
	# Runs the setup script.
	sh setup.sh
	clear
	exit
fi
