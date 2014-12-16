echo *** Setting Screen 1 as primary *** 
cd C:\Program Files (x86)\12noon Display Changer\
dc64cmd.exe -monitor="\\.\DISPLAY1" -more -primary
dc64cmd.exe -monitor="\\.\DISPLAY2" -apply -secondary -top
REM  -lx=240 -ly=-1050