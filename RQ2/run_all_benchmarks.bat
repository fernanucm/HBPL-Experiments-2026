@echo off
rem Launcher script to execute benchmarks, mirror output to screen, and save to a log file

set LOG_FILE=run_all_benchmarks_log.txt

echo ------------------------------------------------=========================

powershell -Command "cmd /c run_all_benchmarks_aux.bat | tee %LOG_FILE%"

echo ------------------------------------------------=========================
echo Results logged to: %LOG_FILE%

