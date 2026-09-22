@echo off

time /t

setlocal enabledelayedexpansion

rem === Start date and time ===
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set D1=%%a
    set M1=%%b
    set Y1=%%c
)
for /f "tokens=1-3 delims=:." %%a in ("%time%") do (
    set H1=%%a
    set Min1=%%b
    set S1=%%c
)

rem === Start date to days since 1970 ===
call :toDays %Y1% %M1% %D1% Days1

rem === Start time to seconds ===
set /a Sec1=%H1%*3600 + %Min1%*60 + %S1%

timeout /t 1 >nul

del .\data\data_hbpl_nesting.pl >nul

:: Parameters: 
::   - SWI-Prolog version
::   - Nbr. of Equations
::   - Nbr. of Rules
::   - Nbr. of Assumptions

rem Load the baseline parameters and automation flags from params.bat
call params.bat

rem Launch the nested loop pipeline.
rem Hierarchy order: Equations Loop -> Rules Loop -> Assumptions Loop
call :loop_equations

echo.

rem === End date and time ===
for /f "tokens=1-4 delims=/ " %%a in ("%date%") do (
    set D2=%%a
    set M2=%%b
    set Y2=%%c
)
for /f "tokens=1-3 delims=:." %%a in ("%time%") do (
    set H2=%%a
    set Min2=%%b
    set S2=%%c
)

rem === Convert end date to days since 1970 ===
call :toDays %Y2% %M2% %D2% Days2

rem === Convert end time to seconds ===
set /a Sec2=%H2%*3600 + %Min2%*60 + %S2%

rem === Time difference in seconds ===
set /a TotalSec=(Days2-Days1)*86400 + (Sec2-Sec1)

rem === Convert to HH:MM:SS ===
set /a HH=TotalSec/3600
set /a MM=(TotalSec%%3600)/60
set /a SS=TotalSec%%60

rem === Format with zeroes ===
if %HH% LSS 10 set HH=0%HH%
if %MM% LSS 10 set MM=0%MM%
if %SS% LSS 10 set SS=0%SS%

echo Total Automation Elapsed time: %HH%:%MM%:%SS%

time /t
exit /b


:: =========================================================================
:: NESTED AUTOMATION LOOP SUBROUTINES
:: =========================================================================

:loop_equations
if defined AutomateEquations (
    for /f "tokens=1-3" %%a in ("!AutomateEquations!") do (
        set /a E_Min=%%a
        set /a E_Max=%%b
        set /a E_Steps=%%c
        set /a E_LastStep=E_Steps - 1
        for /l %%i in (0, 1, !E_LastStep!) do (
            if !E_LastStep! equ 0 (
                set /a Equations=E_Min
            ) else (
                set /a E_Diff=E_Max - E_Min
                set /a E_Prod=E_Diff * %%i
                set /a E_Incr=E_Prod / E_LastStep
                set /a Equations=E_Min + E_Incr
            )
            call :loop_rules
        )
    )
) else (
    call :loop_rules
)
exit /b

:loop_rules
if defined AutomateRules (
    for /f "tokens=1-3" %%a in ("!AutomateRules!") do (
        set /a R_Min=%%a
        set /a R_Max=%%b
        set /a R_Steps=%%c
        set /a R_LastStep=R_Steps - 1
        for /l %%i in (0, 1, !R_LastStep!) do (
            if !R_LastStep! equ 0 (
                set /a Rules=R_Min
            ) else (
                set /a R_Diff=R_Max - R_Min
                set /a R_Prod=R_Diff * %%i
                set /a R_Incr=R_Prod / R_LastStep
                set /a Rules=R_Min + R_Incr
            )
            call :loop_hyporules
        )
    )
) else (
    call :loop_hyporules
)
exit /b

:loop_hyporules
if defined AutomateHypoRules (
    for /f "tokens=1-3" %%a in ("!AutomateHypoRules!") do (
        set /a H_Min=%%a
        set /a H_Max=%%b
        set /a H_Steps=%%c
        set /a H_LastStep=H_Steps - 1
        for /l %%i in (0, 1, !H_LastStep!) do (
            if !H_LastStep! equ 0 (
                set /a HypoRules=H_Min
            ) else (
                set /a H_Diff=H_Max - H_Min
                set /a H_Prod=H_Diff * %%i
                set /a H_Incr=H_Prod / H_LastStep
                set /a HypoRules=H_Min + H_Incr
            )
            call :loop_assumptions
        )
    )
) else (
    call :loop_assumptions
)
exit /b

:loop_assumptions
if defined AutomateAssumptions (
    for /f "tokens=1-3" %%a in ("!AutomateAssumptions!") do (
        set /a A_Min=%%a
        set /a A_Max=%%b
        set /a A_Steps=%%c
        set /a A_LastStep=A_Steps - 1
        for /l %%i in (0, 1, !A_LastStep!) do (
            if !A_LastStep! equ 0 (
                set /a Assumptions=A_Min
            ) else (
                set /a A_Diff=A_Max - A_Min
                set /a A_Prod=A_Diff * %%i
                set /a A_Incr=A_Prod / A_LastStep
                set /a Assumptions=A_Min + A_Incr
            )
            call :execute_instance
        )
    )
) else (
    call :execute_instance
)
exit /b


:: =========================================================================
:: REPETITIVE RUNTIME BENCHMARK INSTANCE INVOCATION
:: =========================================================================

:execute_instance
echo =========================================================================
echo Running Benchmark with: Equations=%Equations% ^| Rules=%Rules% ^| Assumptions=%Assumptions%
echo =========================================================================

cd benchmarks
rem Generate parametric benchmarks
if /i "%Benchmark%"=="stocks-n" (
    %SWIPL% -g "['stocks-n_gen'],halt"
) else if /i "%Benchmark%"=="stocks-r" (
    %SWIPL% -g "['stocks-r_gen'],halt"
) else (
    rem Default fallback for stocks-s and any other value
    %SWIPL% -g "['stocks-s_gen'],halt"
)
cd ..\HBPL
rem Execute benchmarks
%SWIPL% -g "['../systems/hbpl_nesting'],benchmark,halt"
cd ..
rem Collect benchmark data
rem call collect_benchmarks.bat
exit /b


:: =========================================================================
:: AUXILIARY METHOD: DATE CONVERSION
:: =========================================================================

:toDays
rem Convert YYYY MM DD to days since 1970-01-01
setlocal
set Y=%1
set M=%2
set D=%3

rem Adjust to Zeller algorithm
if %M% LSS 3 (
    set /a Y=Y-1
    set /a M=M+12
)

set /a A=Y/100
set /a B=A/4
set /a C=2-A+B
set /a E=365*Y
set /a F=Y/4
set /a G=30*(M+1)/2

set /a JD=C+E+F+G+D-719469

endlocal & set %4=%JD%
exit /b
