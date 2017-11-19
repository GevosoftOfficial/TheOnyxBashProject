# The Onyx Bash Project File Manager Setup
# A Program that setups all the necessary files for the rest of the File Manager to work.
# Beta
# 
# Edvard Busck-Nielsen, Tell Space, hereby disclaims all copyright interest in the program “The Onyx Bash Project File Manager” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

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

# Part 0 : Setup File Permissions

# Clears the screen
clear
# Shows header using 'figlet'
figlet T h e   O n y x   B a s h   P r o j e c t
echo ""
echo "\033[1m\033[4mFile Manager Setup\033[0m"
echo ""
echo "Please follow these instructions to install & Setup The Onyx Bash File Manager"
echo "This file needs SU (Super-User) Profligates, Please enter your password: "
# Changes all the Files part of the file managers permissions and make them executable.
sudo chmod 777 file_create.sh
sudo chmod +x file_create.sh
sudo chmod 777 file_delete.sh
sudo chmod +x file_delete.sh
sudo chmod 777 file_edit.sh
sudo chmod +x file_edit.sh
sudo chmod 777 file_existing.sh
sudo chmod +x file_existing.sh
sudo chmod 777 FileManager.sh
sudo chmod +x FileManager.sh
sudo chmod 777 FileManagerAction.sh
sudo chmod +x FileManagerAction.sh
sudo chmod 777 FileManagerLogout.sh
sudo chmod +x FileManagerLogout.sh
sudo chmod 777 file_rename.sh
sudo chmod +x file_rename.sh
sudo chmod 777 file_ro.sh
sudo chmod +x file_ro.sh
echo "File Permissions setup Done!"

# Part 1 : Setup User Text-Editor

echo "Please enter the Text-Editor you want to use with the File Manager (as default) This can be changes later."
# Asks the user for a text-editor name.
read text_editor
# Creates a file that stores the users selection
# Removes any old files
rm .user_data_texteditor.txt
touch .user_data_texteditor.txt
echo "$text_editor" >> .user_data_texteditor.txt
echo "Done! Default Text-Editor set to : $text_editor"

# Part 2 : User Data File

# Creates a user data file so the script(s) know that this setup script has been executed for future reference.
# Removes any old versions of the file.
cd ..
rm .user_data_filemanager.txt
touch .user_data_filemanager.txt

# Part 3 : Exit

# Exits the script into main Onyx Bash script (OnyxBash.sh)
echo "Setup Done. Type : sh FileManager.sh to start the file manager."
echo "Tell Space The Onyx Bash Project 2017"
sh OnyxBash.sh
clear	
exit
