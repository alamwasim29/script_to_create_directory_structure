#!/usr/bin/env bash
create_directory_structure() {
    read -p "provide the path address:" path
    read -p "Provide the directory's name at a given path" -a directory
    for i in ${directory[@]}; do
        mkdir -p $path/$i
    done
}
create_directory_structure

for (( ; ; )); do
    read -p "Press Y/N to continue/exit:" choice
    case $choice in
    [yY])
        create_directory_structure
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
