for a in *.png; do mogrify -fuzz 20% -trim "$a" "$a"; done
for a in *.jpg; do mogrify -fuzz 20% -trim "$a" "$a"; done


mogrify -fuzz 20% -trim ./*/*.png
mogrify -fuzz 20% -trim ./*/*.jpg


find ./ -name "*.jpg" -exec mogrify -fuzz 20% -trim "$a" "$a" {} \;

find ./ -name “*.jpg” -o -name “*.JPG” -o -name “*.png” -o -name “*.PNG” find ./ -name “*.jpg” -o -name “*.JPG” -o -name “*.png” -o -name “*.jpeg


# processes images in subfolders
./*/*.jpg

bottom crop:
-crop +0-60 +repage

# crop bottom and then trim
mogrify -crop +0-60 +repage -fuzz 20% -trim ./*/*.jpg

#trim only vertical borders
-gravity South \ -background blue -splice 0x1  -background red -splice 0x1 \ -trim  +repage -chop 0x1 +repage \
-gravity Northwest \ -background blue -splice 0x1  -background red -splice 0x1 \ -trim  +repage -chop 0x1 +repage


#rotate only if width exceeds height
mogrify -rotate "90>" *.jpg

#resize for kobo Aura HD
-resize 1080x1440\>

#resize and canvas
-resize 1080x1440\> -background black -compose Copy \
-gravity center -extent 1080x1440

#sharpen
-unsharp 0x1

#all-in-one
mogrify -fuzz 20% -trim +repage -rotate "90>" +repage -resize 1080x1440\> ./*/*.jpg


mogrify -fuzz 20% -trim +repage -rotate "90>" +repage -resize 1080x1440\> -background black -compose Copy -gravity center -extent 1080x1440 ./*/*.jpg

#ultimate no sharpen
mogrify -rotate "90>" +repage -fuzz 20% -gravity South -background blue -splice 0x1  -background red -splice 0x1 -trim  +repage -chop 0x1 -gravity North -background blue -splice 0x1  -background red -splice 0x1 -trim  +repage -chop 0x1 -resize 1080x1440 -background black -compose Copy -gravity Center -extent 1080x1440 ./*/*.jpg

#ultimate with sharpen
mogrify -rotate "90>" +repage -fuzz 20% -gravity South -background blue -splice 0x1  -background red -splice 0x1 -trim  +repage -chop 0x1 -gravity North -background blue -splice 0x1  -background red -splice 0x1 -trim  +repage -chop 0x1 -resize 1080x1440 -sharpen 0x1 -background black -compose Copy -gravity Center -extent 1080x1440 ./*/*.jpg



#delete matching files recursively
find . -name "credits.jpg" -print0 | xargs -0 rm -rf 