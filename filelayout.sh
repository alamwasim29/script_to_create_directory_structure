#!/usr/bin/env bash

directory_structure() {

    read -p "Enter parent dir name and child dir count at level-1:" parent_dir count
    while [[ $count -ge 1 ]]; do
        read -p "pass the child dir name:" child_dir
        mkdir -p $1/$parent_dir/$child_dir
        ((count--))
    done
}

if [[ $# -eq 0 ]]; then
    echo "Usage: $0 followed by Y/N"
    echo "'Y'=>Create dir and sub-dir at current working dir\n'N'=>Elsewhere"
    exit
fi

case $1 in
[yY])
    directory_structure "."
    ;;
[nN])
    read -p "Provide the complete target path:" path
    directory_structure $path #check in future for /at the end of input.
    ;;
*)
    echo "Wrong Input."
    ;;
esac

for (( ; ; )); do
    read -p "Press Y/N to continue/exit:" choice
    case $choice in
    [yY])
        directory_structure #Need to modify this section
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
