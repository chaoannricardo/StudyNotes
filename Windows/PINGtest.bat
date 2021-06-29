@echo off

:loop

for /F "tokens=2" %%i in ('date /t') do set mydate=%%i
set mytime=%time%

SET TodayYear=%date:~0,4%
SET TodayMonthP0=%date:~5,2%
SET TodayDayP0=%date:~8,2%

echo ============== >> internetStability.log
echo %date% %mytime% >> internetStability.log & ping -n 1 -l 500 www.google.com >> internetStability.log

echo. >> internetStability.log

timeout 30

goto loop
