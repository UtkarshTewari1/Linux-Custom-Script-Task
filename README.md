# Linux-Custom-Script-Task
# Section- A

# Creating a new directory:-

mkdir -p ~/man/man1

# Creating  a manual page file for internsctl command in the "man1" directory named "internsctl.1":-
 
echo -e ".TH INTERNSCTL 1
.SH NAME
internsctl \- custom command for interns
.SH SYNOPSIS
internsctl [OPTION]... [FILE]...
.SH DESCRIPTION
This is a custom command for interns.
.SH OPTIONS
--help\n
To get the help\n
--version\n
To get the version"> ~/man/man1/internsctl.1

# Giving permission to the script, executing the script and running the man command, output is attached overhere:

![1](https://github.com/UtkarshTewari1/Linux-Custom-Script-Task/assets/129510005/6c8b9cf6-d026-45e5-bea5-fbb91bef56f8)

![1 1](https://github.com/UtkarshTewari1/Linux-Custom-Script-Task/assets/129510005/9b40da57-a826-4848-bed4-15c6667ea569)

# Ans 2 and 3 ->Now for the options like version and help, edit the script and write the script as:-

#!/bin/bash
# Function to display usage information
usage() {
    echo "Usage: internsctl [-v version] [-h help]"
    echo "  -v, --version      Specify the name (default: v01.1)"
    echo "  -h, --help         Display this help message"
    exit 1
}

function show_version() {
    echo "version = v0.1.0"
}

case $1 in
	-v) 
		show_version
		;;
	-h) 
		usage
		;;
	--version)	
		show_version
		;;
	--help)	
		usage
		;;
	*) 
		echo "Invalid option:";usage	
		;;
esac

# Now change the path of the script so that it can be used as a command as :

sudo cp ./internsctl.sh /usr/local/bin/internsctl

# Attached here pics after executing the command:

![1](https://github.com/UtkarshTewari1/Linux-Custom-Script-Task/assets/129510005/08534866-c61c-44c9-98ca-4d3560141b10)

# Section-B

# To see the cpu information using the command, the code is as follows:

#!/bin/bash
# Function to display usage information
usage() {
    echo "Usage: internsctl [-v version] [-h help]"
    echo "  -v, --version      Specify the name (default: v01.1)"
    echo "  -h, --help         Display this help message"
    echo " cpu getinfo         Display the CPU information"
    exit 1
}

function show_version() {
    echo "version = v0.1.0"
}

get_cpu_info() {
    lscpu
}

case $1 in
	cpu)
		case "$2" in
			getinfo)
                		get_cpu_info
                		;;
            		*)
                		echo "Invalid CPU subcommand. Use 'internsctl cpu getinfo'."
                		;;
		esac
		;;
	-v) 
		show_version
		;;
	-h) 
		usage
		;;
	--version)	
		show_version
		;;
	--help)	
		usage
		;;
	*) 
		echo "Invalid option:";usage	
		;;
esac

# Attached hereby the pic after execution:-

![1](https://github.com/UtkarshTewari1/Linux-Custom-Script-Task/assets/129510005/06210b06-bfd5-4c61-a6ed-980085be0eb4)








