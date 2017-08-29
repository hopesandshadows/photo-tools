#!/bin/sh

# change directory to the desired one
cd /path/to/your/folder

# create directory for resized photos. If you don't all originals will be lost

mkdir resized

# look up all files - should be .jpg or .JPG
for fname in *.*; do

  # this is the resize and slightly sharpen part
  echo "resizing $fname"
  mogrify -quality 95% -write "./resized/$fname" -resize 1600x1600 "$fname"

  # watermarking
  echo "watermarking $fname"
  composite -compose atop -gravity SouthEast "/path/to/watermark/image" "./resized/$fname" "./resized/$fname"

done
