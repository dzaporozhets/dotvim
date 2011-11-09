#!/bin/bash

# Author: Sergey Potapov (aka Blake)
# License: GNU GPLv2
# Description:
#   This tool takes a plugin dir path and make zip archive.
# Usage:
#   plugin_to_zip.sh PLUGIN_DIR_PATH [ VERSION ]
# Example:
#   This will creat file VIM_DIR/tmp/vim-plug_name-0.5.zip
#   ./plugin_to_zip.sh ../bundle/plug_name 0.5

PLUG_PATH=$1
PLUG_VERSION=$2

DIR=$(cd ${0%/*} && pwd)
TMP_DIR=$DIR/../tmp

#expand TMP_DIR
mkdir $TMP_DIR -p
TMP_DIR=$(cd $TMP_DIR && pwd)

plug_dir=${PLUG_PATH%/}
plug_dir=${plug_dir##*/}


if [[ $plug_dir = vim[_-]* ]];then
    plug_name="${plug_dir}"
else
    plug_name="vim-${plug_dir}"
fi

if [[ $PLUG_VERSION = "" ]]; then
    archive_name="${plug_name}.zip"
else
    archive_name="${plug_name}-${PLUG_VERSION}.zip"
fi

plug_tmp_dir=$TMP_DIR/plug_to_zip_$plug_name
cp $PLUG_PATH $plug_tmp_dir -R

cd $plug_tmp_dir

# delete all files wich specified in .gitignore
ignore_files=$(cat ./.gitignore)
for file in $ignore_files;
do
    rm ./$file -rf
done
# delete README file
rm ./[Rr][Ee][Aa][Dd][Mm][Ee]* -rf
# remove git repo
rm ./.git -rf
rm ./.gitignore -f

# make zip archive
zip $archive_name -r * > /dev/null
mv ./$archive_name $TMP_DIR -f

# remove temporary dir
rm $plug_tmp_dir -rf

echo "Zip arhive created: ${TMP_DIR}/${archive_name}"

