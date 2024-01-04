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
