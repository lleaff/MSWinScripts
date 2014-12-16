echo *** Setting Screen 2 as primary *** 
cd C:\Program Files (x86)\12noon Display Changer\
dc64cmd.exe -monitor="\\.\DISPLAY2" -more -primary 
dc64cmd.exe -monitor="\\.\DISPLAY1" -apply -secondary -bottom
REM -lx=-240 -ly=1050