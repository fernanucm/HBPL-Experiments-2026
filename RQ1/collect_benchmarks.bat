call params.bat
call %SWIPL% -g "[collect_benchmarks],main(classic),halt."
call %SWIPL% -g "[collect_benchmarks],main(hypothetical),halt."
set TARGET="..\..\1.Submission"
rem copy /y data_hbpl_overhead_classic.tex %TARGET%
rem copy /y data_hbpl_overhead_hypo.tex %TARGET%
exit /b
