%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Metainterpreter (meta2) Benchmarking
%
%   This metainterpreter consults an HBPL program and 
%   interprets it passing the constraint and degree arguments as
%   required by fuzzy reasoning and the a3 weak unification algorithm.
%   The program and the proximity equations are stored in the static
%   database.
%   Hypotheses are stored in a list for the augmented program.
%   AVLs are used to enhance lookups in the augmente program list and
%   block constraints.
%
%   Excludes: graded rules, fuzzy sets and fuzzy relations
%             other than '~' (sim)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- module(meta2, [
		benchmark/0,
		example/2,
		run_goal/2,
    stat/2,
    run_goal_list/2,
    op(1050, xfy, [=>]),      % Hypothetical implication
    % op(1020, yfx, [/\\]),     % Hypothetical conjunction. Unsupported, but easy
    op(500, yfx, ['~'])       % Similarity relation
   ]).

% Benchmark-related modules:
:- use_module('bench_utils').
:- use_module('iso_predicates').

% HBPL-related modules:
:- use_module('bplShell').
:- use_module('foreign').
:- use_module('flags').
:- use_module('evaluator').


:- op(1050, xfy, [=>]).      % Hypothetical implication
% :- op(1020, yfx, [/\\]).     % Hypothetical conjunction
:- op(500, yfx, ['~']).      % Similarity relation


:- initialization(initialize_hbpl).
:- initialization(evaluator:op(1050,xfy,[=>])).
%:- initialization(evaluator:op(1020,yfx,[/\\])).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Use examples
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% User programs:
program0([(p :- a=>a)]). 
% ?- example(p, program0). Succeeds with one answer
program1([(p(X) :- ((a(X) :- X=1;X=2) => a(X)))]). 
% ?- example(p(X), program1). Succeeds with two answers
program2([(p(X) :- ((a(X) :- X=1;X=2) => a(X)), a(X))]). 
% ?- example(p(X), program2). fails
program3([student(s1), take(s1,c1), (grad(S):-take(S,c1),take(S,c2)), (p(S) :- student(S), (take(S,_C) => grad(S)))]).
% example(p(X), program3). % X = s1 twice
program4([student(s1), student(s2), take(s1,c1), (grad(S):-take(S,c1),take(S,c2)), (p(S) :- student(S), (take(S,_C) => grad(S)))]).
% example(p(X), program4). % X = s1 twice, X = s2
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
  ProgramGoal =.. [ProgramName, Program],
  ProgramGoal,
  concat_atom(['./tmp/', ProgramName, '.bpl'], ProgramNameExt),
  create_bpl_program(ProgramNameExt, Program),
  run_goal(Goal, ProgramNameExt).

% To run a goal for a program which is in a file, use:
% run_goal(Goal, Program).
% where Program is the path to the program for which Goal is to be solved

% run_goal(+Goal, +ProgramFile) :-
run_goal(Goal, ProgramFile) :-
  consult_program_and_expanded_equations(ProgramFile),
  solve(Goal, t, t, _Cout, 1.0, Dout),
  writef('%t with %d', [Goal, Dout]).


% To get statistics for a goal and a program which is in a file, use:
%   stat(Goal,ProgramFile)

% stat(+Goal,+ProgramFile)
%   Display statistics for a run goal in a program
stat(Goal, ProgramFile) :-
  StatGoal=..[run_stats, Goal, ProgramFile, RTime, CTime, Inferences, _Global, _Local, _Heap],
  StatGoal,
  format('CPUtime: ~3f. Runtime: ~3f. Diftime: ~3f. Inferences: ~d.', [CTime, RTime, CTime-RTime, Inferences]).


% To run a goal for a program in a given list of program rules
% and equations
% run_goal_rules(+Goal, +Rules)
run_goal_list(Goal, Program) :-
  ProgramNameExt = 'program.bpl',
  create_bpl_program(ProgramNameExt, Program),
  run_goal(Goal, ProgramNameExt).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BENCHMARKING

% Metainterpreter 
benchmark :-
  writeln('****************************'),
  writeln('*           META2          *'),
  writeln('****************************'),
  writeln('*'),
  set_host_performance(maximum),
  consult(['../benchmarks/benchmarks']),
  benchmarks_hypothetical(Benchmarks),
  (getenv('RUNS', AtomRuns) -> % Defined in params.bat
    true ; AtomRuns = '1'),
  atom_number(AtomRuns, Runs),
  File = '../data/data_meta2.pl',
  open(File, write, Stream, []),
  findall([Benchmark, CTime],
    (member(Benchmark, Benchmarks),
     format('Solving ~w...\n',[Benchmark]),
     atom_concat('../benchmarks/', Benchmark, BenchmarkFile),
     exec_bench(Runs, BenchmarkFile, RTime, CTime, I, G, L, H),
     writeq(Stream, data(meta2, Benchmark, RTime, CTime, I, G, L, H)),
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
  run_stats(bench, Benchmark, RTime, CTime, Inferences1, Global1, Local1, Heap1),
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
  consult_program_and_expanded_equations(ProgramFile),
  stat_start(RT, T, I, G, L, H),
  !,
  solve(Goal, t, t, _Cout, 1.0, _Dout),
  !,
  stat_end(RT, T, I, G, L, H, RTime, Time, Inferences, Global, Local, Heap).


% consult_program_and_expanded_equations(+ProgramFile)
consult_program_and_expanded_equations(ProgramFile) :-
  % Read the program and equatios in the lists Program and Equations
  read_program_equations(ProgramFile, UProgram, Equations),
  fact_to_rule_list(UProgram, RProgram),
  sort_predicates(RProgram, Program),
  % Compile the program to generate and consult proximity equations
  expand_equations(Equations, ExpEquations),
  PrologFile = 'tmp/program.pl',
  % Create the file as a module program with the clauses at Program
  create_pl_program(PrologFile, ExpEquations, Program),
  clear_module(PrologFile),
  consult(PrologFile).


% expand_equations(+Equations, -BlkEquations)
expand_equations(Equations, BlkEquations) :-
  flags:set_bpl_flag(relation_properties(sim, [symmetric, reflexive, transitive(yes)])),
	translator:expand_equations([sim],
	                 Equations, UnsortedExpEquations),
	sort(UnsortedExpEquations, SortedExpEquations),
	evaluator:build_block_equations(SortedExpEquations, UnsortedBlkEquations),
  sort(UnsortedBlkEquations, BlkEquations).


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
   Term = (X~Y=D), !,
   Equations = [sim(X, Y, D)|RemEquations],
   read_rules_equations(Rules, RemEquations)
   ;
   Rules = [Term|RemRules],
   read_rules_equations(RemRules, Equations)
  ).


% solve(+Goal, +Program, +Cin, -Cout, +Din, -Dout)
%
% Facts must come in the form: head :- true.
%
solve((Goal1, Goal2), Program, Cin, Cout, Din, Dout) :-
  !,
  solve(Goal1, Program, Cin, Co1, Din, Do1),
  solve(Goal2, Program, Co1, Cout, Do1, Dout).
solve((Goal1; Goal2), Program, Cin, Cout, Din, Dout) :-
  !,
  (solve(Goal1, Program, Cin, Cout, Din, Dout) ;
   solve(Goal2, Program, Cin, Cout, Din, Dout)).
solve((Hyp => Goal), Program, Cin, Cout, Din, Dout) :-
  !,
  insert_rule(Hyp, Program, HProgram),
  solve(Goal, HProgram, Cin, Cout, Din, Dout).
solve(Goal, _Program, Cin, Cin, Din, Din) :-
  my_builtin(Goal),
  !,
  evaluator:Goal.  
% Lookup in the consulted program
solve(Goal, Program, Cin, Cout, Din, Dout) :-
  Goal =.. [GFunctor|GArgs],
  length(GArgs, L),
  length(HArgs, L),
  (HFunctor = GFunctor ; evaluator:sim(GFunctor, HFunctor, _, _)), % The reflexive property is implicit
  Head =.. [HFunctor|HArgs],
  clause(program:Head, Body),
  evaluator:weak_unify_a3(Goal, Head, 0.0, Cin, Co1, Din, Do1),
  solve(Body, Program, Co1, Cout, Do1, Dout).  
% Lookup in the augmented program
solve(Goal, Program, Cin, Cout, Din, Dout) :-
  functor(Goal, GFunctor, Arity),
  (HFunctor = GFunctor ; evaluator:sim(GFunctor, HFunctor, _, _)), % The reflexive property is implicit
  atomic_concat(HFunctor, Arity, Key),
  get_assoc(Key, Program, Rules),
  unifiable_member((Goal :- _Body), Rules, (UGoal :- UBody), Cin, Co1, Din, Do1),
  copy_term((UGoal :- UBody), (CGoal :- CBody)),
  evaluator:weak_unify_a3(Goal, CGoal, 0.0, Co1, Co2, Do1, Do2),
  solve(CBody, Program, Co2, Cout, Do2, Dout).

% unifiable_member(+Element, +List, -UnifiableElement, +Cin, -Co1, +Din, -Do1)
% 
unifiable_member(X, [Y|_], Y, Cin, Cout, Din, Dout) :-
  \+ \+ evaluator:weak_unify_a3(X, Y, 0.0, Cin, Cout, Din, Dout).
unifiable_member(X, [Y|_], _, _Cin, _Cout, _Din, _Dout) :-
  pred_lt(X,Y), % Stop if looking for greater terms in the standard order
  !,
  fail.
unifiable_member(X, [_|Ys], Z, Cin, Cout, Din, Dout) :-
  unifiable_member(X, Ys, Z, Cin, Cout, Din, Dout).
  
% insert_rule(+(Head :- Body), +Program, -NewProgram)
% Insert a rule in an assoc list (AVL tree)
% The key is the predicate name and arity
% Each element in the assoc list is the ordered list of its clauses
insert_rule(FactOrRule, Program, NewProgram) :-
  (FactOrRule = (Head :- Body) ; (FactOrRule = Head, Body = true)),
  !,
  Rule = (Head :- Body),
  functor(Head, Functor, Arity),
  atomic_concat(Functor, Arity, Key),
  (get_assoc(Key, Program, Rules)
   ->
    insert_rule_ordered(Rule, Rules, NewRules)
   ;
    NewRules = [Rule]),
  put_assoc(Key, Program, NewRules, NewProgram). 
  
% insert_rule_ordered(+Rule, +Rules, -NewRules)
% Insert Rule in the ordered list Rules 
% Ordering is based on the standard order over rule heads.
insert_rule_ordered(Rule, [], [Rule]).
insert_rule_ordered(Rule1, [Rule2|Program], [Rule1, Rule2|Program]) :-
  pred_lt(Rule1, Rule2),
  !.
insert_rule_ordered(Rule1, [Rule2|Program], [Rule2|IProgram]) :-
  insert_rule_ordered(Rule1, Program, IProgram).  
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

