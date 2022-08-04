#!/usr/bin/env bash

directory_structure() {
    read -p "Enter parent dir name:" parent_dir
    read -p "Enter the array of sub_dir at level-1:" -a sub_dir
    for i in ${sub_dir[@]}; do
        echo "$i"
        mkdir -p $1/$parent_dir/$i
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
        echo "Do you wish to create further sub_dir at ${a[@]}"
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
