@echo off

time /t

setlocal enabledelayedexpansion

:: Capture start time and date
set "start_time=%TIME%"
for /f %%x in ('powershell -NoProfile -Command "Get-Date -Format 'yyyyMMddHHmmss'"') do set sysdate=%%x
set "start_date=%sysdate:~0,8%"

timeout /t 1 >nul

call params.bat
cd benchmarks
:: Generate parametric benchmarks
%SWIPL% -g "[hypo1_gen],halt"
%SWIPL% -g "[hypo2_gen],halt"
%SWIPL% -g "[hypo3_gen],halt"
%SWIPL% -g "[hypo4_gen],halt"
%SWIPL% -g "[hypo5_gen],halt"
%SWIPL% -g "[hypo6_gen],halt"
%SWIPL% -g "[hypo7_gen],halt"
cd ..\HBPL
:: First table: Overhead due to hypothetical reasoning
%SWIPL% -g "['../systems/hbpl_overhead'],benchmark,halt"
:: Second and third tables: Comparison of different systems
%SWIPL% -g "['../systems/meta1'],benchmark,halt"
%SWIPL% -g "['../systems/meta2'],benchmark,halt"
%SWIPL% -g "['../systems/meta3'],benchmark,halt"
%SWIPL% -g "['../systems/hbpl'], benchmark,halt"
cd ..
call collect_benchmarks.bat

:: Capture end time
set "end_time=%TIME%"
for /f %%x in ('powershell -NoProfile -Command "Get-Date -Format 'yyyyMMddHHmmss'"') do set sysdate=%%x
set "end_date=%sysdate:~0,8%"

:: Convert start and end times to milliseconds
for /f "tokens=1-4 delims=:.," %%a in ("%start_time%") do (
    set /a "startMs=(((%%a*60)+%%b)*100)+%%c"
)
for /f "tokens=1-4 delims=:.," %%a in ("%end_time%") do (
    set /a "endMs=(((%%a*60)+%%b)*100)+%%c"
)

:: Calculate elapsed time
set /a "elapsedMs=endMs - startMs + (end_date - start_date)*3600*24"

:: Format seconds as HH:MM:SS
set /a hours=%elapsedMs% / 3600
set /a minutes=(%elapsedMs% %% 3600) / 60
set /a secs=%elapsedMs% %% 60

:: Pad with leading zeros if needed
if %hours% lss 10 set hours=0%hours%
if %minutes% lss 10 set minutes=0%minutes%
if %secs% lss 10 set secs=0%secs%

set formatted=%hours%:%minutes%:%secs%
echo Elapsed time: !formatted! seconds

endlocal

time /t
