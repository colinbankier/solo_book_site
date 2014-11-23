#!/bin/bash

original_path="/Users/colin.bankier/Documents/Solo Webstuff/originals"

for image in under_sail.jpg bay.jpg beached.tif tied_up.tif sunset.jpg book_2.jpg contents.jpg ice.tif mary_vic_allison.tif morea.tif vic.jpg page_23.jpg page_54.jpg page_84.jpg page_121.jpg page_148.jpg page_171.jpg;
do
  voffset=0
  ext=jpg
  filename="${image%.*}"
  if [ $filename = "under_sail" ]; then
    voffset=60
  fi
  if [ $filename = "book_2" ]; then
    crop="-crop 180x180+0+0\! -background white -flatten"
  else
      crop="-extent 200x200+0+$voffset"
  fi
  echo $filename
  echo "voffset $voffset"
  convert -define jpeg:size=200x200 "$original_path/${image}" -strip -thumbnail '200x200^' \
    -gravity center $crop -quality 80 assets/images/${filename}_200x200.jpg

  convert "$original_path/${image}" -resize 1200 -strip -format jpeg\
  -quality 60 assets/images/${filename}_fullsize.jpg
done

echo "background"
convert "$original_path/background.png" -resize 1200 -strip -format jpeg\
  -quality 60 assets/images/background.jpg

echo cover
convert "$original_path/cover.png" -resize 940  -strip -format jpeg\
  -quality 90 assets/images/cover.jpg
