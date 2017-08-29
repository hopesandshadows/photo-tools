# create directory for resized photos. If you don't all originals will be lost


mkdir resized

# look up all files - should be .jpg or .JPG
for fname in *.*; do

  # this is the resize and slightly sharpen part
  echo "resizing $fname"
  mogrify -quality 95% -write "./resized/$fname" -resize 1600x1600 "$fname"
  
  # watermarking on bottom left corner, with padding
  echo "watermarking $fname"
  composite -gravity SouthWest -geometry +10+10 /path/to/watermark.png "./resized/$fname" "./resized/$fname"

done
