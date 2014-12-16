echo *** Setting Screen 2 as primary *** 
REM Swapping primary and secondary
cd C:\Program Files (x86)\12noon Display Changer\
dc64cmd.exe -monitor="\\.\DISPLAY2" -more -primary 
dc64cmd.exe -monitor="\\.\DISPLAY1" -apply -secondary -bottom
REM -lx=-240 -ly=1050
echo **** Press a key to reenable Screen 1 as primary ****
pause
cd C:\Program Files (x86)\12noon Display Changer\
dc64cmd.exe -monitor="\\.\DISPLAY1" -more -primary
dc64cmd.exe -monitor="\\.\DISPLAY2" -apply -secondary -top
REM  -lx=240 -ly=-1050