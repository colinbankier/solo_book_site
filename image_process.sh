
original_path="/Users/colin.bankier/Documents/Solo Webstuff/originals"
#for image in under_sail.jpg bay.jpg beached.tif tied_up.tif sunset.jpg book.tif contents.jpg ice.tif mary_vic_allison.tif morea.tif vic.jpg;
for image in contents.jpg;
do
  voffset=0
  ext=jpg
  filename="${image%.*}"
  if [ $filename = "under_sail" ]; then
    voffset=120
  fi
  echo $filename
  echo "voffset $voffset"
  convert -define jpeg:size=200x200 "$original_path/${image}" -gravity center -extent 200x200\
  -quality 60 -thumbnail '200x200' assets/images/${filename}_200x200.jpg
done
