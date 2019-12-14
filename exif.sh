#!/usr/bin/env bash

TIME=0
DIR=~/Pictures/

echo "**************************"
echo "Starting Photo Update"

for f in "$DIR"/*.jpg;
do
  ((time=time+30))
  #Use GNU date - brew install gnu-time coreutils
  d=`gdate -d "2019-11-09 09:00:00 AEDT $TIME secs" +"%Y:%m:%d %H:%M:%S"`
  echo "Updating: $f"
  exiftool -overwrite_original -q -CreateDate="$d" -DateTimeOriginal="$d" -ModifyDate="$d" "$f"
done

echo "**************************"
echo "Complete"
