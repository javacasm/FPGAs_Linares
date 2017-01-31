#!/bin/bash

TEMP_DIR="ebook-temp"
TEMP_file=$TEMP_DIR"/ebook.md"
TEMP_DownloadImagesFile=$TEMP_DIR"/get_imagenes.sh"
TEMP_ImagesFile=$TEMP_DIR"/imagesURLS.txt"
TEMP_DirImages=$TEMP_DIR"/images/"
TEMP_DownloadImagesNames=$TEMP_DIR"/images.txt"

EBOOK_NAME=$TEMP_DIR"/FPGAs"

rm -rf $TEMP_DIR
mkdir $TEMP_DIR

files=( README.md \
    charla.md \
    icezum.md \
    Herramientas.md )


for i in "${files[@]}"
do :
   grep -v  -E '@javacasm|Licencia_CC|CEP|Febrero|juntadeandalucia|### \[https://github.com/javacasm/RaspberryJaen' $i >>$TEMP_file
done



# Procesado de imágenes


grep  '!' ebook-temp/ebook.md  | grep 'http' | tr '(?' '\n\n' | grep 'http' | tr ')' ' '  > $TEMP_ImagesFile
sed  's/http/wget http/' <$TEMP_ImagesFile > $TEMP_DownloadImagesFile

cat $TEMP_DownloadImagesFile |  rev |  cut -d / -f 1 | rev >$TEMP_DownloadImagesNames

# chmod u+x $TEMP_DownloadImagesFile
# mkdir $TEMP_DirImages
# cd $TEMP_DirImages
# ../../$TEMP_DownloadImagesFile
# cd ..

# Generamos el ebook

# pandoc --toc --toc-depth=1 --verbose -o $EBOOK_NAME $TEMP_file

pandoc --verbose -o $EBOOK_NAME".epub" $TEMP_file
pandoc --verbose -o $EBOOK_NAME".pdf" $TEMP_file
mv $EBOOK_NAME* .


# rm -rf $TEMP_DIR # comentado para comprobar
