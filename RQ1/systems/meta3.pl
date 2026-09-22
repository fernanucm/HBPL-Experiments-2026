%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic Metainterpreter (meta3) Benchmarking
%
% This system interprets HBPL programs passed as a predicate-ordered list as an argument. It uses the idea of program contexts as in the compiled approach, but storing the precompiled assumptions in the heap (augmented program in the second argument of solve/2)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- module(meta3, [
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
% :- op(1020,yfx,[/\\]).     % Hypothetical conjunction

:- initialization(initialize_hbpl).
:- initialization(evaluator:op(1050,xfy,[=>])).
% :- initialization(evaluator:op(1020,yfx,[/\\])).

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
  compile_and_read_program(ProgramFile, UProgram),
  set_program_prefix(ProgramFile),
  fact_to_rule_list(UProgram, RProgram),
  add_hypo_builtins(RProgram, HProgram),
  sort_predicates(HProgram, Program),
  prepare_goal(Goal, AtomGoal, ListGoal),
  bplShell:translate_command(AtomGoal, ListGoal, sv(TranslatedGoal, _, _, _DegreeOut)),
  initialize_hypothetical_settings,
  solve(TranslatedGoal, Program),
  writef('%t', [TranslatedGoal]).


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
  ProgramNameExt = 'program.bpl',
  create_bpl_program(ProgramNameExt, Program),
  run_goal(Goal, ProgramNameExt).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BENCHMARKING

% Metainterpreter 
benchmark :-
  writeln('****************************'),
  writeln('*           META3          *'),
  writeln('****************************'),
  writeln('*'),
  set_host_performance(maximum),
  consult(['../benchmarks/benchmarks']),
  benchmarks_hypothetical(Benchmarks),
  (getenv('RUNS', AtomRuns) -> % Defined in params.bat
    true ; AtomRuns = '1'),
  atom_number(AtomRuns, Runs),
  File = '../data/data_meta3.pl',
  open(File, write, Stream, []),
  findall([Benchmark, CTime],
    (member(Benchmark, Benchmarks),
     format('Solving ~w...\n',[Benchmark]),
     atom_concat('../benchmarks/', Benchmark, BenchmarkFile),
     change_hypothetical_directive(BenchmarkFile, true),
     exec_bench(Runs, BenchmarkFile, RTime, CTime, I, G, L, H),
     writeq(Stream, data(meta3, Benchmark, RTime, CTime, I, G, L, H)),
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
  run_stats('bench', Benchmark, RTime, CTime, Inferences1, Global1, Local1, Heap1),
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

run_stats(Goal, ProgramFile, RTime, Time, Inferences, Global, Local, Heap) :-
  change_hypothetical_directive(ProgramFile, true),
  compile_and_read_program(ProgramFile, UProgram),
  set_program_prefix(ProgramFile),
  fact_to_rule_list(UProgram, RProgram),
  add_hypo_builtins(RProgram, HProgram),
  sort_predicates(HProgram, Program),
  prepare_goal(Goal, AtomGoal, ListGoal),
  bplShell:translate_command(AtomGoal, ListGoal, sv(TranslatedGoal, _, _, _DegreeOut)),
  initialize_hypothetical_settings,
  stat_start(RT, T, I, G, L, H),
  !,
  solve(TranslatedGoal, Program),
  !,
  stat_end(RT, T, I, G, L, H, RTime, Time, Inferences, Global, Local, Heap).


% compile_and_read_program(+ProgramFile, -Program)
compile_and_read_program(ProgramFile, Program) :-
  compile_program(ProgramFile, CompiledFile),
  read_program_equations(CompiledFile, Program, BlockEquations),
  maplist({}/[sim(X,Y,_,D),evaluator:sim(X,Y,D)]>>true, BlockEquations, ModuleEquations),
  maplist(assertz, ModuleEquations).


% compile_program(+ProgramFile, -CompiledFile)
compile_program(ProgramFile, CompiledFile) :-
  bplShell:hy(true), % Enable hypothetical reasoning
  bplShell:ld(ProgramFile, [f, c]), % Forced and only compiling, not loading
  compiled_filename(ProgramFile, CompiledFile).


% compiled_filename(ProgramFile, CompiledFile)
%   file.bpl -> file.tpl
%   file.other_extension -> file.other_extension.tpl
compiled_filename(ProgramFile, CompiledFile) :-
  atom_concat(ProgramName, '.bpl', ProgramFile),
  !,
  atom_concat(ProgramName, '.tpl', CompiledFile).

compiled_filename(ProgramFile, CompiledFile) :-
  atom_concat(ProgramFile, '.tpl', CompiledFile).


% % read_program(+ProgramFile, -Program)
% % From facts in this very same file
% % read_program(ProgramFile, Program) :-
% %   ProgramGoal =.. [ProgramFile, Program],
% %   ProgramGoal.
% % From a file
% read_program(ProgramFile, Program) :-
%   op(1050,xfy,[=>]),
%   % op(1020,yfx,[/\\]),
%   see(ProgramFile),
%   read_rules(Program),
%   seen.
  
% read_rules(Rules) :-
%   read_term(Rule, []),
%   (Rule = (:- _Directive) % Dismiss directives
%    ->
%     read_rules(Rules)
%    ;
%     (Rule == end_of_file
%      ->
%       Rules = []
%      ;
%       Rules = [Rule|RemRules],
%       read_rules(RemRules)
%     )
%   ).

% read_program_equations(+ProgramFile, -Program, -Equations)
read_program_equations(ProgramFile, Program, Equations) :-
  op(1050,xfy,[=>]),
  % op(1020,yfx,[/\\]),
  op(500,yfx,['~']),
  see(ProgramFile),
  read_rules_equations(Program, Equations),
  seen.
  
read_rules_equations(Rules, Equations) :-
  read_term(Term, []),
  (Term = (:- _Directive), !, % Dismiss directives
   read_rules_equations(Rules, Equations)
   ;
   Term == end_of_file, !,
   Rules = [],
   Equations = []
   ;
   Term = sim(X, Y, B, D), !,
   Equations = [sim(X, Y, B, D)|RemEquations],
   read_rules_equations(Rules, RemEquations)
   ;
   Rules = [Term|RemRules],
   read_rules_equations(RemRules, Equations)
  ).


solve((Goal1, Goal2), Program) :-
  !,
  solve(Goal1, Program),
  solve(Goal2, Program).
solve((Goal1; Goal2), Program) :-
  !,
  (solve(Goal1, Program) ;
   solve(Goal2, Program)).
% There is no need for the following clause because
% embedded implications are compiled and turned into the predicate =>/4
% solve((Hyp => Goal), Program) :-
%   !,
%   insert_rule(Hyp, Program, HProgram),
%   solve(Goal, HProgram).
solve(Goal, _Program) :-
  my_builtin(Goal),
  !,
  evaluator:Goal.  
solve(Goal, Program) :-
  unifiable_member((Goal :- _Body), Program, (UGoal :- UBody)),
  copy_term((UGoal :- UBody), (CGoal :- CBody)),
  CGoal=Goal,
  solve(CBody, Program).

% unifiable_member(+Element, +List, -UnifiableElement)
% Adapted to work with a sorted list
unifiable_member(X, [Y|_], Y) :-
  \+ \+ X=Y.
unifiable_member(X, Y, _) :-
  pred_lt(X,Y), % Stop if looking for greater terms in the standard order
  !,
  fail.
unifiable_member(X, [_|Ys], Z) :-
  unifiable_member(X, Ys, Z).
  
insert_rule(Rule, [], [Rule]).
insert_rule(Rule1, [Rule2|Program], [Rule1, Rule2|Program]) :-
  pred_lt(Rule1, Rule2),
  !.
insert_rule(Rule1, [Rule2|Program], [Rule2|IProgram]) :-
  insert_rule(Rule1, Program, IProgram).
  
% my_builtin(+Predicate)
% % my_builtin(Goal) :-
% %   iso_builtin_predicate(Goal),
% %   !.
% Solve the implication with the program in the list
my_builtin('=>'(_IdsVs, _Goal, _DI, _DC)) :-
  !,
  fail.
my_builtin(Goal) :-
  Goal =.. [Functor|_Args],
  flags:get_bpl_flag(program_prefix(ProgramPrefix)),
  atom_concat(ProgramPrefix, '_', Prefix),
  atom_concat(Prefix, _, Functor),
  !,
  fail.
my_builtin(_Goal).


% fact_to_rule_list(+FRs, -RRs)
% Take a list of facts and rules and return
% the same list with facts transformed to rules
%
% Use a specific my_builtin, instead based on iso_builtin_predicate/1, based on the name of 
% translated predicate names (starting with the file name and '_') and specific identified built-ins
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



% set_program_prefix(+ProgramFile)
%
set_program_prefix(ProgramFile) :-
  utilities:simplify_filename(ProgramFile, ProgramPrefix),
  flags:set_bpl_flag(program_prefix(ProgramPrefix)).


% add_hypo_builtins(+Program, -HProgram)
%
%% Add hypo builtins needed to solve a 
%   hypothetical goal
%
add_hypo_builtins(Program, HProgram) :-
  HProgram = [
  ('=>'(IdsVs, Goal, DI, DC) :-
      get_di(DI),
      register_rules(IdsVs, DI, DC),
      Goal)
  |Program].



