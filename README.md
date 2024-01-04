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




