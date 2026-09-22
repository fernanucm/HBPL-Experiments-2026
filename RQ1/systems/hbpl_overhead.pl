%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bousi-Prolog Benchmarking
%
%  Assess the overhead of hypothetical reasoning on classic programs
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- module(benchmark, [
		benchmark/0
   ]).

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
  writeln('*       HBPL Overhead      *'),
  writeln('****************************'),
  writeln('*'),
  set_host_performance(maximum),
  consult('../benchmarks/benchmarks'), 
  benchmarks_classic(Benchmarks),
  (getenv('RUNS', AtomRuns) -> % Defined in params.bat
    true ; AtomRuns = '1'),
  atom_number(AtomRuns, Runs),
  benchmark(Runs, false, Benchmarks), % Statistics without hypothetical reasoning
  benchmark(Runs, true, Benchmarks), % Statistics with hypothetical reasoning
  set_host_performance(balanced).


% benchmark(+Runs, +Hy, +Benchmarks),
% Hy (Hypothetical Reasoning) \in {true, false}
% bpl: classical benchmarks
% bpl: the same classical benchmarks with hypothetical reasoning enabled
benchmark(Runs, Hy, Benchmarks) :-
  % File = 'benchmark_data_true_swi.pl',
  atomic_list_concat(['../data/data_hbpl_overhead_',Hy,'.pl'], File),
  open(File, write, Stream, []),
  findall([Benchmark, CTime],
    ( member(Benchmark, Benchmarks),
      atom_concat('../benchmarks/', Benchmark, BenchmarkFile),
      change_hypothetical_directive(BenchmarkFile, Hy),
      exec_bench(Runs, Hy, BenchmarkFile, RTime, CTime, I, G, L, H),
      writeq(Stream, data(Hy, Benchmark, RTime, CTime, I, G, L, H)),
      writeln(Stream, '.')),
      _BenchmarkCTimeList),
  close(Stream).
  
exec_bench(Runs, Hy, Benchmark, RTime, CTime, I, G, L, H) :-
  bplShell:hy(Hy),
  bplShell:ld(Benchmark, [f]), % Forced compiling
  exec_bench_aux(0, Runs, Benchmark, 0, RTimes, 0, CTimes, I, G, L, H),
  !,
  RTime is RTimes/Runs,
  CTime is CTimes/Runs.
exec_bench(_Runs, _Hy, Benchmark, _RTime, _CTime, _I,_G,_L,_H) :-
  writeln('**********  ERROR **********'),
  writeln(Benchmark).
  
exec_bench_aux(N, Runs, _Benchmark, RTime, RTime, CTime, CTime, _Inferences, _Global, _Local, _Heap) :-
  N > Runs.
exec_bench_aux(N, Runs, Benchmark, RTimeIn, RTimeOut, CTimeIn, CTimeOut, Inferences, Global, Local, Heap) :-
  N =< Runs,
  N >= 0,
  % set_random(seed(111)),
  run_stats('once(time(bench))', Benchmark, RTime, CTime, Inferences1, Global1, Local1, Heap1),
  format('~a: ~f sec. - ~f sec. - ~d inf. - ~d glo. - ~d loc. - ~d heap\n', [Benchmark, RTime, CTime, Inferences1, Global1, Local1, Heap1]),
  (N == 0
   ->
    RTimeIn1 = 0, CTimeIn1 = 0 , Inferences=Inferences1, Global=Global1, Local=Local1, Heap=Heap1
   ;
    RTimeIn1 is RTimeIn+RTime, CTimeIn1 is CTimeIn+CTime),  % Discard the first run
  N1 is N+1,
  exec_bench_aux(N1, Runs, Benchmark, RTimeIn1, RTimeOut, CTimeIn1, CTimeOut, Inferences, Global, Local, Heap).


% run(+Goal, +Benchmark)
%
%% Run a Goal in HBPL for a Benchmark program
%

run(Goal, Benchmark) :-
  run_stats(Goal, Benchmark, _RTime, _CTime, _Inferences, _Global, _Local, _Heap).


% run_stats(+Goal, _Benchmark, -RTime, -CTime, -Inferences, -Global, -Local, -Heap)
%
%% Run a Goal in HBPL for a Benchmark program and 
%  return execution statistics
%

run_stats(Goal, _Benchmark, RTime, CTime, Inferences, Global, Local, Heap) :-
  bplShell:reset_first_answer_flag,
  stat_start(RT, T, I, G, L, H),
  !,
  bplShell:process_input(Goal, [Goal]),
  !,
  stat_end(RT, T, I, G, L, H, RTime, CTime, Inferences, Global, Local, Heap),
  flags:remove_all_bpl_flag(first_not_solution(_, _, _)),
  retractall(first_answer_flag).  


% END OF BENCHMARKING
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

