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

# Part -1 ->To see the cpu information and free using the command, the code is as follows:

#!/bin/bash
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

get_memory_info() {
    free
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
	memory)
        	case "$2" in
            		getinfo)
                		get_memory_info
                		;;
           		 *)
                		echo "Memory subcommand incomplete. Use 'internsctl memory getinfo'."
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

![1](https://github.com/UtkarshTewari1/Linux-Custom-Script-Task/assets/129510005/ac7ce04c-35a7-4004-ac7b-d9e5dcf5bbc2)

# Part -2 -> To create a new user show the user list and sudo user list, edited the script

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

get_memory_info() {
    free
}

list_users() {
    cat /etc/passwd | awk -F: '{print $1}'
}

list_sudo_users() {
    getent group sudo | cut -d: -f4
}

create_user() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: internsctl user create <username>"
        exit 1
    fi

    username=$1

    # Check for the user already exists

    if id "$username" &>/dev/null; then
        echo "User $username already exists."
        exit 1
    fi

    # Create the user 

    useradd -m "$username"

    # Set a password for the user 

    passwd "$username"

    echo "User $username created successfully."
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
	memory)
        	case "$2" in
            		getinfo)
                		get_memory_info
                		;;
           		 *)
                		echo "Memory subcommand incomplete. Use 'internsctl memory getinfo'."
                		;;
        	esac
        	;;
	user)
        	case "$2" in
            		create)
                		create_user "$3"
                		;;
			list)
                		if [ "$3" == "--sudo-only" ]; then
                    			list_sudo_users
                		else
                    			list_users
                		fi
                		;;
			*)
                		echo "Invalid user subcommand"
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

# Hereby attached the pic after execution:-

![1](https://github.com/UtkarshTewari1/Linux-Custom-Script-Task/assets/129510005/7b9e7a13-4f3b-45b4-91ec-907d69f2a515)

![1](https://github.com/UtkarshTewari1/Linux-Custom-Script-Task/assets/129510005/2e77c775-67dc-4535-a688-3ee19a3ffdd5)

# Part-3 -> To get the information of a file updated the shell script as follows:

#!/bin/bash
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

get_memory_info() {
    free
}

list_users() {
    cat /etc/passwd | awk -F: '{print $1}'
}

list_sudo_users() {
    getent group sudo | cut -d: -f4
}

get_file_info() {

	file_name="${@: -1}"  # Get the last argument\

	# Check if the file exists

    	if [ ! -e "$file_name" ]; then
        	echo "File not found: $file_name"
        	exit 1
    	fi
		case $1 in
		    --size | -s)
		        echo "Size(B): $(stat -c %s $file_name)"
		        ;;
		    --permissions | -p)
		        echo "Access: $(stat -c %A $file_name)"
		        ;;
		    --owner | -o)
		        echo "Owner: $(stat -c %U $file_name)"
		        ;;
		    --last-modified | -m)
		        echo "Modify: $(stat -c %y $file_name)"
		        ;;
		    *)
		        echo "File: $file_name"
    			echo "Access: $(stat -c %A $file_name)"
    			echo "Size(B): $(stat -c %s $file_name)"
    			echo "Owner: $(stat -c %U $file_name)"
    			echo "Modify: $(stat -c %y $file_name)"
		esac	
}

create_user() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: internsctl user create <username>"
        exit 1
    fi

    username=$1

    # Check for the user already exists

    if id "$username" &>/dev/null; then
        echo "User $username already exists."
        exit 1
    fi

    # Create the user 

    useradd -m "$username"

    # Set a password for the user 

    passwd "$username"

    echo "User $username created successfully."
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
	memory)
        	case "$2" in
            		getinfo)
                		get_memory_info
                		;;
           		 *)
                		echo "Memory subcommand incomplete. Use 'internsctl memory getinfo'."
                		;;
        	esac
        	;;
	user)
        	case "$2" in
            		create)
                		create_user "$3"
                		;;
			list)
                		if [ "$3" == "--sudo-only" ]; then
                    			list_sudo_users
                		else
                    			list_users
                		fi
                		;;
			*)
                		echo "Invalid user subcommand"
                		;;
        	esac
        	;;
	file)
        	case "$2" in
            		getinfo)
                		shift 2  # Remove 'file' and 'getinfo' from arguments
                		get_file_info "$@"
                		;;
            		*)
                		echo "Invalid file subcommand. Use 'internsctl file getinfo [options] <file-name>'."
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

# Hereby attached the pic after the execution:

![1](https://github.com/UtkarshTewari1/Linux-Custom-Script-Task/assets/129510005/e2b2aec8-5c2a-4ac1-b8a3-6f6a2b6d5eca)

![1](https://github.com/UtkarshTewari1/Linux-Custom-Script-Task/assets/129510005/693ee416-2397-4d6b-85e7-290dfd0415fe)















