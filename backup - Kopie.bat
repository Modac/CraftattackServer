@ECHO OFF

:start
echo Starting backup...
SET itdate=%date:~-10%
SET itdate=%itdate:~6,4%-%itdate:~3,2%-%itdate:~0,2%
echo Current date: %itdate%
SET hour=%time:~0,2%
IF "%hour:~0,1%" == " " SET hour=0%hour:~1,1%
set ittime=%hour%-%time:~3,2%
echo Current time: %ittime%
xcopy /e /c /h /i /v /r /y /q world Backup\%itdate%_%ittime%world\
xcopy /e /c /h /i /v /r /y /q world_nether Backup\%itdate%_%ittime%world_nether\
xcopy /e /c /h /i /v /r /y /q world_the_end Backup\%itdate%_%ittime%world_the_end\
echo Backup finished
echo Waiting 60 minutes
ping -w 1000 -n 3600 127.0.0.1 >nul 2>&1
goto start