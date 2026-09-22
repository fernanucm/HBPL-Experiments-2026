%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% HBPL Benchmarking
%
% This file is intended for measuring the performance of the system HBPL, which translates HBPL programs (.bpl) into Prolog programs (.tpl and .tpls) which are consulted and then executed
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- module(hbpl, [
		benchmark/0,
		example/2,
		run_goal/2,
    stat/2,
    run_goal_list/2
   ]).

% Benchmark-related modules:
:- use_module('bench_utils').
:- use_module('iso_predicates').

% HBPL-related modules:
:- use_module('bplShell').
:- use_module('foreign').
:- use_module('flags').
:- use_module('evaluator').


:- op(1050,xfy,[=>]).      % Hypothetical implication
:- op(1020,yfx,[/\\]).     % Hypothetical conjunction

:- initialization(initialize_hbpl).
:- initialization(evaluator:op(1050,xfy,[=>])).
:- initialization(evaluator:op(1020,yfx,[/\\])).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A basic metainterpreter with ordered lists
% Description: The current datatase passed as an argument, i.e., using the heap for storing the current program. For each implication, solve the consequent with the program augmented with the hypothesis. Fixes previous issue
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% User programs:
program0([(p :- a=>a)]). 
% ?- example(p, program0). Succeeds with one answer
program1([(p(X) :- ((a(X) :- X=1;X=2) => a(X)))]). 
% ?- example(p(X), program1). Succeeds with two answers
program2([(p(X) :- ((a(X) :- X=1;X=2) => a(X)), a(X))]). 
% ?- example(p(X), program2). fails
program3([student(s1), take(s1,c1), (grad(S):-take(S,c1),take(S,c2)), (p(S) :- student(S), (take(S,_C) => grad(S)))]).
% example(p(S), program3). % S = s1 twice
program4([student(s1), student(s2), take(s1,c1), (grad(S):-take(S,c1),take(S,c2)), (p(S) :- student(S), (take(S,_C) => grad(S)))]).
% example(p(S), program4). % S = s1 twice, S = s2
% From N-Prolog:
program5([(b :- (b => a)), (a :- b)]).
% example(a, program5). % Infinetely many answers
program6([(p :- q(1), q(2)), q(_)]).
% example(p, program6). % Succeeds with one answer
program7([c,a,b,d,a]).
% example(a, program7). % Succeeds with two answers and do not look from b on


% This is for solving goals with the examples included in this very same file
% An HBPL file with the same name than the example and extension .bpl is created
% i.e., program0.bpl, program1.bpl...
example(Goal, ProgramName) :-
  ProgramGoal =.. [ProgramName, UProgram],
  ProgramGoal,
  fact_to_rule_list(UProgram, RProgram),
  sort_predicates(RProgram, Program),
  concat_atom(['./tmp/', ProgramName, '.bpl'], ProgramNameExt),
  create_bpl_program(ProgramNameExt, Program),
  run_goal(Goal, ProgramNameExt).

% To run a goal for a program which is in a file, use:
% run_goal(Goal, Program).
% where Program is the path to the program for which Goal is to be solved

% run_goal(+Goal, +ProgramFile) :-
run_goal(Goal, ProgramFile) :-
  change_hypothetical_directive(ProgramFile, true),
  bplShell:ld(ProgramFile, [f]), % Forced compiling
  prepare_goal(Goal, AtomGoal, ListGoal),
  bplShell:translate_command(AtomGoal, ListGoal, SolveGoal),
  initialize_hypothetical_settings,
  bplShell:SolveGoal.


% To get statistics for a goal and a program which is in a file, use:
%   stat(Goal,ProgramFile)

% stat(+Goal,+ProgramFile)
%   Display statistics for a run goal in a program
stat(Goal, ProgramFile) :-
  StatGoal=..[run_stats, Goal, ProgramFile, RTime, CTime, Inferences, _Global, _Local, _Heap],
  StatGoal,
  % format('Runtime: ~3f. CPUtime: ~3f. Inferences: ~d. GS: ~d. LS ~d. H:~d.', [RTime, Time, Inferences, Global, Local, Heap]).
  format('CPUtime: ~3f. Runtime: ~3f. Diftime: ~3f. Inferences: ~d.', [CTime, RTime, CTime-RTime, Inferences]).


% To run a goal for a program in a given list of rules
% run_goal_rules(+Goal, +Rules)
run_goal_list(Goal, Rules) :-
  fact_to_rule_list(Rules, RProgram),
  sort_predicates(RProgram, Program),
  ProgramNameExt = 'tmp/program.bpl',
  create_bpl_program(ProgramNameExt, Program),
  run_goal(Goal, ProgramNameExt).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BENCHMARKING

% Metainterpreter 
benchmark :-
  writeln('****************************'),
  writeln('*           HBPL           *'),
  writeln('****************************'),
  writeln('*'),
  set_host_performance(maximum),
  consult(['../benchmarks/benchmarks']),
  benchmarks_hypothetical(Benchmarks),
  % benchmarks_classic(Benchmarks),
  (getenv('RUNS', AtomRuns) -> % Defined in params.bat
    true ; AtomRuns = '1'),
  atom_number(AtomRuns, Runs),
  File = '../data/data_hbpl.pl',
  open(File, write, Stream, []),
  findall([Benchmark, CTime],
    (member(Benchmark, Benchmarks),
     format('Solving ~w...\n',[Benchmark]),
     atom_concat('../benchmarks/', Benchmark, BenchmarkFile),
     change_hypothetical_directive(BenchmarkFile, true),
     exec_bench(Runs, BenchmarkFile, RTime, CTime, I, G, L, H),
     writeq(Stream, data(hbpl, Benchmark, RTime, CTime, I, G, L, H)),
     writeln(Stream, '.')),
    _BenchmarkCTimeList),
  close(Stream),
  set_host_performance(balanced).
  
exec_bench(Runs, Benchmark, RTime, CTime, I, G, L, H) :-
  exec_bench(0, Runs, Benchmark, 0, RTimes, 0, CTimes, I, G, L, H),
  !,
  RTime is RTimes/Runs,
  CTime is CTimes/Runs.
exec_bench(_Runs, Benchmark, _RTime, _Time, _I,_G,_L,_H) :-
  writeln('**********  ERROR **********'),
  writeln(Benchmark).
  
exec_bench(N, Runs, _Benchmark, RTime, RTime, Time, Time, _Inferences, _Global, _Local, _Heap) :-
  N > Runs.
exec_bench(N, Runs, Benchmark, RTimeIn, RTimeOut, CTimeIn, CTimeOut, Inferences, Global, Local, Heap) :-
  N =< Runs,
  N >= 0,
  run_stats(once(bench), Benchmark, RTime, CTime, Inferences1, Global1, Local1, Heap1),
  format('~a: ~f sec. - ~f sec. - ~d inf. - ~d glo. - ~d loc. - ~d heap\n', [Benchmark, RTime, CTime, Inferences1, Global1, Local1, Heap1]),
  (N == 0
   ->
    RTimeIn1 = 0, CTimeIn1 = 0 , Inferences=Inferences1, Global=Global1, Local=Local1, Heap=Heap1
   ;
    RTimeIn1 is RTimeIn+RTime, CTimeIn1 is CTimeIn+CTime),  % Discard the first run
  N1 is N+1,
  exec_bench(N1, Runs, Benchmark, RTimeIn1, RTimeOut, CTimeIn1, CTimeOut, Inferences, Global, Local, Heap).

run(Goal, ProgramFile) :-
  run_stats(Goal, ProgramFile, _RTime, _Time, _Inferences, _Global, _Local, _Heap).

run_stats(Goal, ProgramFile, RTime, CTime, Inferences, Global, Local, Heap) :-
  change_hypothetical_directive(ProgramFile, true),
  bplShell:ld(ProgramFile, [f]), % Forced compiling
  prepare_goal(Goal, AtomGoal, ListGoal),
  bplShell:translate_command(AtomGoal, ListGoal, SolveGoal),
  initialize_hypothetical_settings,
  stat_start(RT, T, I, G, L, H),
  !,
  bplShell:SolveGoal,
  !,
  stat_end(RT, T, I, G, L, H, RTime, CTime, Inferences, Global, Local, Heap).



% my_builtin(+Predicate)
my_builtin(Goal) :-
  iso_builtin_predicate(Goal),
  !.


% fact_to_rule_list(+FRs, -RRs)
% Take a list of facts and rules and return
% the same list with facts transformed to rules
%
% Use my_builtin/1 on iso_builtin_predicate/1
%
fact_to_rule_list([], []).
fact_to_rule_list([(H :- B)|Rs], [(H :- B1)|RRs]) :-
  !,
  fact_to_rule_body(B, B1),
  fact_to_rule_list(Rs, RRs).
fact_to_rule_list([H|Rs], [R|RRs]) :-
  fact_to_rule(H, R),
  fact_to_rule_list(Rs, RRs).
  
fact_to_rule_body((G,B), (G1,B1)) :-
  !,
  fact_to_rule_body(G, G1),
  fact_to_rule_body(B, B1).
fact_to_rule_body((G;B), (G1;B1)) :-
  !,
  fact_to_rule_body(G, G1),
  fact_to_rule_body(B, B1).
fact_to_rule_body((F => B), (R => B1)) :-
  !,
  fact_to_rule(F, R),
  fact_to_rule_body(B, B1).
fact_to_rule_body(B, B).

  
fact_to_rule(G, G) :-
  my_builtin(G),
  !.
fact_to_rule((H :- B), (H :- B)) :-
  !.
fact_to_rule(H, (H :- true)).

