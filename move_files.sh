#!/bin/bash

# Path to file which containing the list of splitted fasta filenames
filename_list="./filenames.txt"

# Paths to move files from the source to the destination folder
source_folder="./source"
destination_folder="./destination"

# Move each single file
while IFS= read -r filename; do
    mv "$source_folder/$filename" "$destination_folder/$filename"
done < "$filename_list"
