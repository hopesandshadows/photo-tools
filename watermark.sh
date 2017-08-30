# create directory for resized photos. If you don't all originals will be lost
# run this file within the directory of images

#makes new directory called resize
mkdir resized

# find all .JPG
for fname in *.JPG; do

  # resize
  echo "resizing $fname"
  mogrify -quality 95% -write "./resized/$fname" -resize 1600x1600 "$fname"
  
  # watermarking on bottom left corner, with padding
  echo "watermarking $fname"
  composite -gravity SouthWest -geometry +10+10 /path/to/watermark.png "./resized/$fname" "./resized/$fname"

done
