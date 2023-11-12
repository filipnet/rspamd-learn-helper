#!/bin/bash
#
# Script Name   : rspamd-learn-helper.sh
# Description   : Script for training SPAM and HAM for rspamd
#                 This script searches for ".SpamTraining" and ".HamTraining"
#                 folders under user directories in "/home" directory.
# Author        : https://github.com/filipnet
# License       : BSD 3-Clause "New" or "Revised" License
# ======================================================================================

# Set the home directory
home_directory="/home"

# Define the SPAM folder (Note: For dovecot, a dot should be prefixed to the folder name)
spam_folder=".TrainingSpam"

# Define the HAM folder (Note: For dovecot, a dot should be prefixed to the folder name)
ham_folder=".TrainingHam"

# Recursive function to search for the SPAM and HAM folders
search_training_folder() {
  local directory="$1"
  local folder_name="$2"

  # Check if the training folder exists
  if [ -d "$directory/$folder_name" ]; then
    # Echo in yellow color
    echo -e "\e[1;33m$folder_name folder found in $directory\e[0m"

    # Execute rspamc learn command with the correct training folder name
    if [ "$folder_name" == "$spam_folder" ]; then
      rspamc learn_spam "$directory/$folder_name"
    elif [ "$folder_name" == "$ham_folder" ]; then
      rspamc learn_ham "$directory/$folder_name"
    fi
  fi

  # Iterate through subdirectories
  for subdirectory in "$directory"/*; do
    if [ -d "$subdirectory" ]; then
      search_training_folder "$subdirectory" "$folder_name"
    fi
  done
}

# Check if rspamc is available
if command -v rspamc &> /dev/null; then
  echo -e "\e[1;32mrspamd is installed. Ready to train SPAM and HAM.\e[0m"
  sleep 3
else
  echo -e "\e[1;31mError: rspamc command not found. Please install rspamd to use this script.\e[0m"
  exit 1
fi

# Iterate through user directories under /home
for user_directory in "$home_directory"/*; do
  if [ -d "$user_directory" ]; then
    username=$(basename "$user_directory")

    # Search for SPAM folder
    search_training_folder "$user_directory" "$spam_folder"

    # Search for HAM folder
    search_training_folder "$user_directory" "$ham_folder"
  fi
done
