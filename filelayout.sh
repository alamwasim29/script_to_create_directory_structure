#!/usr/bin/env bash
directory_structure() {
    read -p "provide the path address:" path
    read -p "Provide the directory's name at a given path" -a directory
    for i in ${directory[@]}; do
        mkdir -p $path/$i
    done
}
directory_structure

for (( ; ; )); do
    read -p "Press Y/N to continue/exit:" choice
    case $choice in
    [yY])
        directory_structure
        # sub_directory $parent_dir $sub_dir #Need to modify this section
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
