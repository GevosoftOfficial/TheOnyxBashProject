# The Onyx Bash Project CC (Calendar Clock)
# Calendar/Clock script for The Onyx Bash Projects script(s)
# 2.0
# 
# Edvard Busck-Nielsen, Gevosoft, hereby disclaims all copyright interest in the program “The Onyx Bash Project CC” (witch is a set of  terminal tools for simple tasks) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 13 November 2017
# Edvard Busck-Nielsen, President of Gevosoft Technology Development & Developer at Gevosoft Technology Development

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

# Part 0 : Home Screen

# Clears the sceen
clear

# Infinite loop to show time
while : ;do
	# Creates a variable equal to the system time called 'time_var'
	time_var=$(date +%T)
	# Shows a header and basic information
	figlet The Onyx Bash Project
	figlet -f mini C a l e n d a r  /  C l o c k
	echo ""
	echo "\033[1m\033[4mCurrent Date And Time\033[0m"
	echo ""
	echo "\033[2mCancel real time clock by pressing 'Ctrl+C' Type sh OnyxBash.sh After that to launch main program\033[0m"
	echo ""
	# Shows calendar
	cal
	echo ""
	# Shows time using 'sysvbanner' program
	banner $time_var
	# Waits one second
	sleep 1
	# Clears the screen
	clear
done
