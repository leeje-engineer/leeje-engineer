#!/bin/bash

# Get the current PATH value
path_value=$PATH

# Split the PATH value by colon (:) separator
IFS=':' read -ra path_arr <<< "$path_value"

# Flag variable to check if '.' is found
found_dot=false

# Loop through the array and check if '.' is found at the beginning or middle
for path in "${path_arr[@]}"
do
    if [[ "$path" == "." ]]; then
        found_dot=true
        break
    elif [[ "$path" == *":."* ]]; then
        found_dot=true
        break
    fi
done

# If '.' is found at the beginning or middle, modify the PATH
if $found_dot; then
    new_path=""

    # Loop through the array and add each path to the new PATH variable
    for path in "${path_arr[@]}"
    do
        if [[ "$path" == "." ]]; then
            continue
        elif [[ "$path" == *":."* ]]; then
            new_path="$new_path:${path%:.}"
        else
            new_path="$new_path:$path"
        fi
    done

    # Remove the first ':' character from the new PATH variable
    new_path="${new_path:1}"

    # Set the new PATH value
    export PATH="$new_path"

    echo "PATH modified: $PATH"
else
    echo "PATH does not contain '.' at the beginning or middle"
fi
