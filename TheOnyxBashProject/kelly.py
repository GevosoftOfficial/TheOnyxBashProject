import os
# The Onyx Bash Project Kelly Prg. Lang
# Kelly Programming Language terminal
# 2.0
# 
# Edvard Busck-Nielsen, Gevosoft, hereby disclaims all copyright interest in the program "Kelly Porgramming Language" (witch is a programming language Based On The BASIC Programming Language.) written by Edvard Busck-Nielsen.

# signature of Edvard Busck-Nielsen 23 December 2017
# Edvard Busck-Nielsen, President of Gevosoft Technology Development & Developer at Gevosoft Technology Development

# Copyright 2018, 2018 Edvard Busck-Nielsen

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

def input_func(data):
	if '"' in data and '")' in data and '(' in data:
		input_var_name = data[data.index('(')+1:data.index(' "')]
		print (input_var_name)
		input_title = data[data.index('"')+1:data.index('")')]
		print (input_title)
		temp_input_var = raw_input(input_title+" ")
		print (temp_input_var)
		if input_var_name in Global_var_names:
			print ("The Variable : "+input_var_name+"Already exists")
		else:
			Global_var_names.append(input_var_name)
			Global_variables.update({input_var_name : temp_input_var})
			start()
	else:
		print ("Syntax Error!")
		start()

def print_var_func(data):
	var_name = data[data.index('(')+1:data.index(')')]
	if var_name in Global_var_names:
		print(Global_variables[var_name])
		start()
	else:
		print ("Variable "+var_name+" doesn't exist")
		start()


def add_var(data):
	if '"' in data:
		if '$' in data and '+' in data:
			main_var_name = data[data.index('(')+1:data.index(' =')]
			second_var_name = data[data.index('$')+1:data.index(' +')]
			plus_string = data[data.index('"')+1:data.index('")')]
			if second_var_name in Global_var_names:
				second_var_data = Global_variables[second_var_name]
				main_var_data = second_var_data + plus_string
				Global_var_names.append(main_var_name)
				Global_variables.update({main_var_name : main_var_data})
				start()
			else:
				print("Syntax Error")
				start()
		elif '")' in data:
			var_name = data[data.index('(')+1:data.index(' =')]
			var_data = data[data.index('"')+1:data.index('")')]
			Global_variables.update({var_name : var_data})
			Global_var_names.append(var_name)
			start ()
		else:
			print "Syntax Error"
			start()
	else:
		print("Syntax Error")
		start()

def print_func(data):
	data_data = data[data.index('("')+2:data.index('")')]
	print (data_data)
	start()

def start():
	print('\033[1m' + 'Kelly 1.0')
	print ("Type 'help' or 'credits' for more information."+'\033[0m')
	data = raw_input(">>> ")
	if "print" in data:
		if data[0:8] == 'print ("':
			if data[-1] == ')':
				print_func(data)
			else:
				print "Syntax Error"
				start()
		elif data[0:7] == 'print (':
			if data[-1] == ')':
				print_var_func(data)
			else:
				print("Syntax Error")
				start()
		else:
			print ("Syntax Error")
			start()
	elif "var" in data:
		if data[0:5] == "var (":
			if data[-1] == ")":
				if "=" in data:
					add_var(data)
				else:
					print "Syntax Error"
					start()
			else:
				print ("Syntax Error")
				start()
		else:
			print ("Syntax Error")
			start()
	elif data == "clear":
		os.system('clear')
		start()
	elif data == "exit":
		print "Exit..."
		os.system('sh OnyxBash.sh')
	elif data == "help":
		print "Help Manual:"
		print 'Printing text: print ("your text")'
		print 'Creating a varibale: var (var_name = "some string")'
		print 'Printing a variable: print (var_name)'
		print 'Combinding a variable with a string: var ($some_variable + "some text")'
		print "Clearing the screen: clear"
		print "Exit Kelly: exit"
		start()
	elif data == "credits":
		print("Credits: Kelly Prg. Lang. Is a part of The Onyx Bash Project by Tell Space (http://telspace.ml)")
		print("Devloped by: Edvard Busck-Nielsen 2017")
		start()
	elif 'input' in data and data[0:7] == 'input (':
		input_func(data)
	else:
		print ("Error Command "+data+" Not Found!")
		start()

os.system('clear')
Global_variables = {}
Global_var_names = []
start()
