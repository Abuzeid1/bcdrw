#!/bin/bash

# directory containing images
input_dir="$1"
quality="${2:-90}"
width1="${3:-360}"
width2="${4:-720}"
width3="${5:-1080}"
width4="${6:-1440}"
width5="${6:-1920}"
if [[ -z "$input_dir" ]]; then
echo "Please specify an input directory."
exit 1
fi

# for each svg in the input directory
for img in $( find $input_dir -type f -iname "*.svg" );
do
  svgo $img -o ${img%.*}-optimized.svg
done

for img in $( find -E $input_dir -type f -regex '.*\.(jpg|png|jp2|jpeg|JPG)');
do
  cwebp -q $quality $img -o ${img%.*}-$width1.webp -resize $width1 0
  cwebp -q $quality $img -o ${img%.*}-$width2.webp -resize $width2 0
  cwebp -q $quality $img -o ${img%.*}-$width3.webp -resize $width3 0
  cwebp -q $quality $img -o ${img%.*}-$widt4.webp -resize $width4 0
  cwebp -q $quality $img -o ${img%.*}-$width5.webp -resize $width5 0
done