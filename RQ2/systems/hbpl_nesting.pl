%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bousi-Prolog Benchmarking
%
%  Assess assumption scaling on hypothetical programs
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% :- module(benchmark, [
% 		benchmark/0,
%     op(1200, yfx, [with]),         % Grade operator
%     op(1180, xfx, ['-->', ':-']),  % Lower priority of rule and DCG operators
%     op(1180, fx,  [':-']),         % Lower priority of directive operator
%     op(1050, xfy, [=>]),      % Declare hypothetical implication operator
%     op(1020, xfy, [/\\])      % Declare hypothetical conjunction operator
%    ]).


% Benchmark-related modules:
:- use_module('bench_utils').

% HBPL-related modules:
:- use_module('bousi').
:- use_module('bplShell').
:- use_module('foreign').
:- use_module('flags').
:- use_module('evaluator').


:- initialization(initialize_hbpl).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BENCHMARKING
%
% Tests classic programs with hypothetical reasoning 
%   disabled and enabled
%
benchmark :-
  writeln('****************************'),
  writeln('*       HBPL Nesting       *'),
  writeln('****************************'),
  writeln('*'),
  set_host_performance(maximum),
  consult('../benchmarks/benchmarks'), 
  benchmarks_hypothetical(Benchmarks),
  (getenv('Runs', AtomRuns) -> % Defined in params.bat
    true ; AtomRuns = '1'),
  atom_number(AtomRuns, Runs),
  benchmark_(Runs, Benchmarks),
  set_host_performance(balanced).


% benchmark(+Runs, +Benchmarks)
benchmark_(Runs, Benchmarks) :-
  File = '../data/data_hbpl_nesting.pl',
  open(File, append, Stream, []),
  findall([Benchmark, CTime],
    ( member(Benchmark, Benchmarks),
      atom_concat('../benchmarks/', Benchmark, BenchmarkFile),
      exec_bench(Runs, BenchmarkFile, RTime, CTime, Answers, Inferences),
      getenv('Equations', AtomEquations),
      getenv('Rules', AtomRules),
      getenv('HypoRules', AtomHypoRules),
      getenv('Assumptions', AtomAssumptions),
      % getenv('Answers', AtomAnswers),
      % getenv('Inferences', AtomInferences),
      atom_number(AtomEquations, Equations),
      atom_number(AtomRules, Rules),
      atom_number(AtomHypoRules, HypoRules),
      atom_number(AtomAssumptions, Assumptions),
      % atom_number(AtomAnswers, Answers),
      % atom_number(AtomInferences, Inferences),
      (HypoRules>0 ->
        writeq(Stream, data(Benchmark, Equations, Rules, HypoRules, Assumptions, RTime, CTime, Answers, Inferences))
      ; writeq(Stream, data(Benchmark, Equations, Rules, Assumptions, RTime, CTime, Answers, Inferences))),
      writeln(Stream, '.')),
      _BenchmarkCTimeList),
  close(Stream).
  
exec_bench(Runs, Benchmark, RTime, CTime, Answers, Inferences) :-
%  bplShell:ld(Benchmark, [f]), % Forced compiling
  bplShell:ld(Benchmark, []),
  exec_bench_aux(0, Runs, Benchmark, 0, RTimes, 0, CTimes, Answers, 0, Inferencess),
  !,
  RTime is RTimes/Runs,
  CTime is CTimes/Runs,
  Inferences is Inferencess/Runs.
exec_bench(_Runs, Benchmark, _RTime, _CTime, _Answers, _Inferences) :-
  writeln('**********  ERROR **********'),
  writeln(Benchmark).
  
exec_bench_aux(N, Runs, _Benchmark, RTime, RTime, CTime, CTime, _Answers, Inferences, Inferences) :-
  N > Runs.
exec_bench_aux(N, Runs, Benchmark, RTimeIn, RTimeOut, CTimeIn, CTimeOut, Answers, InferencesIn, InferencesOut) :-
  N =< Runs,
  N >= 0,
  % set_random(seed(111)),
  run_stats('time(once(bench))', Benchmark, RTime, CTime, Answers, Inferences),
  format('~a: ~3f sec. - ~3f sec.\n', [Benchmark, RTime, CTime]),
  (N == 0
   ->
    RTimeIn1 = 0, CTimeIn1 = 0, InferencesIn1 = 0
   ;
    RTimeIn1 is RTimeIn+RTime, 
    CTimeIn1 is CTimeIn+CTime, 
    InferencesIn1 is InferencesIn+Inferences),  % Discard the first run
  N1 is N+1,
  exec_bench_aux(N1, Runs, Benchmark, RTimeIn1, RTimeOut, CTimeIn1, CTimeOut, Answers, InferencesIn1, InferencesOut).


% run(+Goal, +Benchmark)
%
%% Run a Goal in HBPL for a Benchmark program
%

run(Goal, Benchmark) :-
  run_stats(Goal, Benchmark, _RTime, _CTime).


% run_stats(+Goal, _Benchmark, -RTime, -CTime)
%
%% Run a Goal in HBPL for a Benchmark program and 
%  return execution statistics
%

run_stats(Goal, _Benchmark, RTime, CTime, Answers, Inferences) :-
  bplShell:reset_first_answer_flag,
  %stat_start(RT, T), -> Moved to evaluator.pl to measure Goal performance
  !,
  bplShell:process_input(Goal, [Goal]),
  !,
  getenv('Answers', AtomAnswers),
  atom_number(AtomAnswers, Answers),
  bench_stats(RTime, CTime, Inferences),
  %stat_end(RT, T, RTime, CTime),
  flags:remove_all_bpl_flag(first_not_solution(_, _, _)),
  retractall(first_answer_flag).  


% END OF BENCHMARKING
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

