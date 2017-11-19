# The Onyx Bash Project Setup
# The setup script for The Onyx Bash Project
# Beta
# 
# Edvard Busck-Nielsen, Tell Space, hereby disclaims all copyright interest in the program “The Onyx Bash Project Setup” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

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

# Part 0 : Header

# Clears the screen
clear
# Shows header text message
figlet -f mini T h e   O n y x   B a s h   P r o j e c t   S e t u p
echo ""
echo ""

# Part 1 : Setup process

# Sets up user name
printf "Set User Name: "
# Gets input stored in 'user_name' variable
read user_name
# Creates a file that stores the users user name, called '.user_data_name.txt'
# Removeds any old versions of the file
rm .user_data_name.txt
touch .user_data_name.txt
echo "$user_name" >> .user_data_name.txt
# Sets up program list file and removes any old versions of the file.
rm .user_data_apps.txt
touch .user_data_apps.txt
echo "File Manager (filemanager)" >> .user_data_apps.txt
echo "System Settings (settings)" >> .user_data_apps.txt

# Part 2 : File Permission Setup.

# Sets up file permissions
# Informs the user
echo "The program needs SU (Super-User Privileges) to setup file permissions, Please enter your password: "
sudo chmod 777 OnyxBash.sh
sudo chmod +x OnyxBash.sh
sudo chmod 777 onyx_bash_setup.sh
sudo chmod +x onyx_bash_setup.sh
sudo chmod 777 filemanager.sh
sudo chmod +x filemanager.sh
sudo chmod 777 settings.sh
sudo chmod +x settings.sh
sudo chmod 777 .user_data_name.txt
sudo chmod 777 .user_data_apps.txt

# Part 3 : Exit

# Informs the user
echo "Done with the setup procces type : sh OnyxBash.sh to continue to main program"
echo "The Onyx Bash Project Tell Space 2017."
# Create file to show that the setup is done for the main script.
touch .user_data.txt
# Exits the script into main Onyx Bash script (OnyxBash.sh)
sh OnyxBash.sh
clear
exit
