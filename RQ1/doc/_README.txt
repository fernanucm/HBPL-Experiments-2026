***************************************************

          SYSTEMS AND EXPERIMENTS FOR
          
              Research Question 1
              
          in the paper submitted to JLAMP

     Implementing Hypothetical Bousi~Prolog
          
      P. Julian-Iranzo and F. Sáenz-Pérez

                                     Doc. revision:
                                        2026-09-21
***************************************************


INDEX

1. REQUIREMENTS
2. ARCHIVE CONTENTS
3. STARTING HBPL
4. BENCHMARKING



1. REQUIREMENTS
===================

This experiments archive has been prepared for Windows (10 and later) 64 bit and requires:

  - SWI-Prolog 7.6.4 64 bit (or later, maybe requiring some tweaks in the code). https://www.swi-prolog.org/download/stable/bin/swipl-w64-764.exe.envelope
  - GNU Core Utilities for Windows. Install both:
    1- https://gnuwin32.sourceforge.net/packages/coreutils.htm (for the rm command)
    2- https://gnuwin32.sourceforge.net/packages/sed.htm (for the sed command)

Add the installation directory of the GNU Core Utilities to the PATH variable (e.g., the default path C:\Program Files (x86)\GnuWin32\bin).



2. ARCHIVE CONTENTS
===================

This archive contains the following folders:

benchmarks : Benchmark programs as presented in the paper
data       : Target folder for the results of the experiments
doc        : Contains this file and the URLs of SWI and SICStus benchmarks
HBPL       : The system Bousi~Prolog intended to be run in SWI-Prolog
systems    : Contains the metainterpreters which are compared to HBPL



3. STARTING HBPL
=================
  
This is an optional step but advisable to test the Hypothetical Bousi~Prolog (HBPL) implementation:

From a cmd console, run hbpl.bat and issue the command ts:

C:\Experiments\HBPL>hbpl.bat
  ... Just after the banner:
  BPL> ts
  
Warnings are ok, but no failure should be listed at the end of tne test:

          Test Report
================================
Test suites      Passed   Failed
================================
Shell               92        0
Bousi-Prolog       150        0
Hypothetical        37        0
Error/Warnings      90        0
Prolog             611        0
================================
Total              980        0


The command qt can be used to terminate HBPL.

BPL> qt
Exiting the system...



4. BENCHMARKING
===============

Benchmarks, as described in the paper, have been performed on a Windows 11 64-bit operating system.  However, each system and test can also be run in any other OS supported by SWI-Prolog.  This distribution only provides batch files for Windows.

Configuration of the benchmarking process is defined in the files:
    ./params.bat (number of runs -10 by default- and location of SWI-Prolog executable -swipl.exe-)
    ./systems/bench_utils.pl (settings for the Windows energy plan: balanced or maximum; codes may vary for different OSs)

The Windows batch file:

  ./run_all_benchmarks.bat 

executes all the benchmarks, and in its last step the following batch file is called:

  ./collect_benchmarks.bat
  
which collects and summarizes all data in Prolog benchmark data files, and generates LaTeX files for the different tables in the paper.  The files in this distribution are only examples which do not match with the results in the paper and are intended to be regenerated when the benchmarking is performed.


