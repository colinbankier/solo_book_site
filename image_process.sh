#!/bin/bash

original_path="/Users/colin.bankier/Documents/Solo Webstuff/originals"

for image in under_sail.jpg bay.jpg beached.tif tied_up.tif sunset.jpg book.tif contents.jpg ice.tif mary_vic_allison.tif morea.tif vic.jpg;
do
  voffset=0
  ext=jpg
  filename="${image%.*}"
  if [ $filename = "under_sail" ]; then
    voffset=60
  fi
  echo $filename
  echo "voffset $voffset"
  convert -define jpeg:size=200x200 "$original_path/${image}" -strip -thumbnail '200x200^' \
    -gravity center -extent 200x200+0+$voffset -quality 60 assets/images/${filename}_200x200.jpg

  convert "$original_path/${image}" -resize 1200 -strip -format jpeg\
  -quality 60 assets/images/${filename}_fullsize.jpg
done

echo "background"
convert "$original_path/background.png" -resize 1200 -strip -format jpeg\
  -quality 60 assets/images/background.jpg

echo cover
convert "$original_path/cover.png" -resize 940  -strip -format jpeg\
  -quality 60 assets/images/cover.jpg
