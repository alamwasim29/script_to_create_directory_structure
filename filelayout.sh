#!/usr/bin/env bash

directory_structure() {

    read -p "Pass the parent directory name:" parent_dir
    read -p "How many 1st level child directory you want?" count
    while [[ $count -ge 1 ]]; do
        read -p "pass the child dir name:" child_dir
        mkdir -p ./$parent_dir/$child_dir
        ((count--))
    done
}
#create project directory with first level child dir under current directory
# if [[ $# -eq 0 ]]; then
#     echo "Usage: $0 parent_dir child_dir etc"
# fi
read -p "Confirm: Press 'Y' for filelayout creation in current directory else 'N' " input
case $input in
[yY])
    directory_structure
    ;;
[nN])
    read -p "Provide the complete target path." path
    ;;
*)
    echo "Wrong Input."
    ;;
esac

for (( ; ; )); do

    read -p "Press Y/N to continue/exit:" choice
    case $choice in
    [yY])
        directory_structure
        ;;
    [nN])
        echo "Directory creation complete!"
        exit
        ;;
    *)
        echo -e "Incorrect Choice\nKindly select Y/N."
        ;;
    esac

done
