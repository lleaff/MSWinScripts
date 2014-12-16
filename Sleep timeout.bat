@mode con: cols=50 lines=6
@if [%1]==[] goto :emptyargs
@set timeinput=%1
:emptyargs
@if "%1"=="" set timeinput=0
@REM Checking if minutes, hours or days
@set timeminutes=%timeinput%
@set timeunit=%timeinput:~-1%

@if not %timeinput%==1 goto not1m
@set timeunitfull=minute
:not1m
@if not %timeinput%==1 set timeunitfull=minutes

@if not %timeunit%==d goto notd 
@set timeinput=%timeinput:~0,-1%
@set /a timeminutes=%timeinput%*1440
@if not %timeinput%==1 goto not1d
@set timeunitfull=day
:not1d
@if not %timeinput%==1 set timeunitfull=days
:notd
@if not %timeunit%==h goto noth
@set timeinput=%timeinput:~0,-1%
@set /a timeminutes=%timeinput%*60
@if not %timeinput%==1 goto not1h
@set timeunitfull=hour
:not1h
@if not %timeinput%==1 set timeunitfull=hours
:noth
@set /a timeseconds=%timeminutes%*60
@echo Computer will go to sleep in %timeinput% %timeunitfull%
@REM "C:\Portable Program Files\Scripts\Power config - Hibernate off.lnk"
:timeoutreset
@if not %timeseconds% gtr 99999 goto timeout1
@set /a cycles=%timeseconds%/99999
@if not %cycles%==1 goto not1c
@set cyclelabel=cycle
:not1c
@if not %cycles%==1 set cyclelabel=cycles
@echo %cycles% timer %cyclelabel% left
@timeout /t 99999 /nobreak
@set /a %timeseconds%=%timeseconds%-99999
@echo 
@goto timeoutreset
:timeout1
@timeout /t %timeseconds% /nobreak
@REM rundll32.exe powrprof.dll,SetSuspendState 0,1,0
@shutdown /h
