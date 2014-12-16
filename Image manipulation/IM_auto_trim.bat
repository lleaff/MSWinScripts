SET IMDIR=C:\Program Files\ImageMagick

SET APP=mogrify.exe
SET OPTS=-fuzz 20% -trim
REM mogrify Usage:
REM mogrify -fuzz 20% -trim *.png
REM mogrify -fuzz 20% -trim *.jpg

CD D:\DDS_TEMP
for /r . %%D in (.) do "%IMDIR%\%APP%" %OPTS% "%%~fD\*.png"
for /r . %%D in (.) do "%IMDIR%\%APP%" %OPTS% "%%~fD\"

PAUSE