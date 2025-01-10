#!/bin/bash

# Display Menu
echo "1. Add User"
echo "2. Delete User"
echo "3. List Users"
echo "4. Backup Directory"
echo "5. Exit"
read -p "Choose an option: " choice

case $choice in
	1)
	    read -p "Enter username to add: " username
            sudo useradd "$username"
            echo "User $username added successfully."
        
        2) 
            read -p "Enter username to delete: " username
            sudo userdel -r "$username"
            echo "User $username deleted successfully."

        3) 
            cut -d: -f1 /etc/passwd

        4) 
            read -p "Enter directory to backup: " source_dir
            read -p "Enter backup destination: " dest_dir backup_name="backup_$(date + %F_%T).tar.gz" tar -czvf "$dest_dir/$backup_name" "$source_dir"
            echo "Backup created at $dest_dir/$backup_name"

        5)
            echo "Exiting..."
            exit 0
        
        6) 
            echo "Invalid choice!"

esac	    
