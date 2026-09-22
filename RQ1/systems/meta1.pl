%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic Metainterpreter (meta1) Benchmarking
%
%   This metainterpreter reads an HBPL program as a list and 
%   interprets it passing the constraint and degree arguments as
%   required by fuzzy reasoning and the a3 weak unification algorithm
%   Hypotheses for the augmented program are stored in the same list as the program.
%   Ordered lists are used to enhance lookups in the program list.
%
%   Excludes: graded rules, fuzzy sets and fuzzy relations
%             other than '~' (sim)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- module(meta1, [
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
% :- initialization(evaluator:op(1020,yfx,[/\\])).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% A basic metainterpreter with ordered lists
% Description: The current datatase passed as an argument, i.e., using the heap for storing the current program. For each implication, solve the consequent with the program augmented with the hypothesis
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
  read_program_and_expand_equations(ProgramFile, UProgram, Equations),
  fact_to_rule_list(UProgram, RProgram),
  sort_predicates(RProgram, Program),
  solve(Goal, Program, Equations, t, _Cout, 1.0, Dout),
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
  writeln('*           META1          *'),
  writeln('****************************'),
  writeln('*'),
  set_host_performance(maximum),
  consult(['../benchmarks/benchmarks']),
  benchmarks_hypothetical(Benchmarks),
  (getenv('RUNS', AtomRuns) -> % Defined in params.bat
    true ; AtomRuns = '1'),
  atom_number(AtomRuns, Runs),
  File = '../data/data_meta1.pl',
  open(File, write, Stream, []),
  findall([Benchmark, CTime],
    (member(Benchmark, Benchmarks),
     format('Solving ~w...\n',[Benchmark]),
     atom_concat('../benchmarks/', Benchmark, BenchmarkFile),
     exec_bench(Runs, BenchmarkFile, RTime, CTime, I, G, L, H),
     writeq(Stream, data(meta1, Benchmark, RTime, CTime, I, G, L, H)),
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
  read_program_and_expand_equations(ProgramFile, UProgram, Equations),
  fact_to_rule_list(UProgram, RProgram),
  sort_predicates(RProgram, Program),
  stat_start(RT, T, I, G, L, H),
  !,
  solve(Goal, Program, Equations, t, _Cout, 1.0, _Dout),
  !,
  stat_end(RT, T, I, G, L, H, RTime, Time, Inferences, Global, Local, Heap).


% read_program_and_expand_equations(+ProgramFile, -Program, -ExpEquations)
read_program_and_expand_equations(ProgramFile, Program, ExpEquations) :-
  % Read the program and equatios in the lists Program and Equations
  read_program_equations(ProgramFile, Program, Equations),
  % Compile the program to generate and consult proximity equations
  expand_equations(Equations, ExpEquations).


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


% solve(+Goal, +Program, +Equations, +Cin, -Cout, +Din, -Dout)
%
% Facts must come in the form: head :- true.
%
solve((Goal1, Goal2), Program, Equations, Cin, Cout, Din, Dout) :-
  !,
  solve(Goal1, Program, Equations, Cin, Co1, Din, Do1),
  solve(Goal2, Program, Equations, Co1, Cout, Do1, Dout).
solve((Goal1; Goal2), Program, Equations, Cin, Cout, Din, Dout) :-
  !,
  (solve(Goal1, Program, Equations, Cin, Cout, Din, Dout) ;
   solve(Goal2, Program, Equations, Cin, Cout, Din, Dout)).
solve((Hyp => Goal), Program, Equations, Cin, Cout, Din, Dout) :-
  !,
  insert_rule(Hyp, Program, HProgram),
  solve(Goal, HProgram, Equations, Cin, Cout, Din, Dout).
solve(Goal, _Program, _Equations, Cin, Cin, Din, Din) :-
  my_builtin(Goal),
  !,
  evaluator:Goal.  
solve(Goal, Program, Equations, Cin, Cout, Din, Dout) :-
  unifiable_member((Goal :- _Body), Program, Equations, (UGoal :- UBody), Cin, _Cout, Din, _Dout),
  copy_term((UGoal :- UBody), (CGoal :- CBody)),
  weak_unify_a3(CGoal, Goal, Equations, 0.0, Cin, Co1, Din, Do1),
  solve(CBody, Program, Equations, Co1, Cout, Do1, Dout).


% unifiable_member(+Element, +List, -UnifiableElement)
% 
unifiable_member(X, [Y|_], Equations, Y, Cin, Cout, Din, Dout) :-
  \+ \+ weak_unify_a3(X, Y, Equations, 0.0, Cin, Cout, Din, Dout).
unifiable_member(X, [Y|_], _, _, _Cin, _Cout, _Din, _Dout) :-
  pred_lt(X,Y), % Stop if looking for greater terms in the standard order
  !,
  fail.
unifiable_member(X, [_|Ys], Equations, Z, Cin, Cout, Din, Dout) :-
  unifiable_member(X, Ys, Equations, Z, Cin, Cout, Din, Dout).
  
insert_rule(Rule, [], [Rule]).
insert_rule(Rule1, [Rule2|Program], [Rule1, Rule2|Program]) :-
  pred_lt(Rule1, Rule2),
  !.
insert_rule(Rule1, [Rule2|Program], [Rule2|IProgram]) :-
  insert_rule(Rule1, Program, IProgram).
  
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



%% weak_unify_a3(?Term1, ?Term2, +Equations, +Lambda, +Cin, -Cout, ?DegreeIn, ?DegreeOut)
%
%     Unifies Term1 and Term2 using unification by proximity
%     applying the degree optimization algorithm.
%
weak_unify_a3(Atomic1, Atomic2, Equations, Lambda, Cin, Cout, DegreeIn, DegreeOut) :-
  weak_unify_a3(Atomic1, Atomic2, Equations, Lambda, Cin, Cout, Degree),
  evaluator:degree_composition([DegreeIn, Degree], DegreeOut).

%% weak_unify_a3(?Term1, ?Term2, +Equations, +Lambda, +Cin, -Cout, ?Degree)
%
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     and returns the approximation Degree in which both terms unify.
%     Lambda is the lower bound allowed for the approximation degree
%     of the weak unifications. Cin is the input constraint store of 
%     block constraints, and Cout the output constraint store.

weak_unify_a3(Atomic1, Atomic2, Equations, Lambda, Cin, Cout, Degree) :-
  % Atom (constant) unification
  atomic(Atomic1), 
  atomic(Atomic2), 
  !,
  (Atomic1 == Atomic2
   ->
    Degree = 1.0,
    Cout=Cin
   ;
    ord_member_unify(sim(Atomic1, Atomic2, Block, Degree), Equations),
    Degree >= Lambda,
    evaluator:sat_a3([Atomic1:Block, Atomic2:Block], Cin, Cout)
  ).

weak_unify_a3(Xs, Ys, Equations, Lambda, Cin, Cout, Degree) :-
  is_list(Xs),
  is_list(Ys),
  !,
	weak_unify_args_a3(Xs, Ys, Equations, Lambda, Cin, Cout, Degree).

weak_unify_a3(Term1, Term2, Equations, Lambda, Cin, Cout, Degree) :-
  % Term decomposition
  compound(Term1), 
  compound(Term2), 
  !,
  Term1 =.. [Functor1|Args1],
  Term2 =.. [Functor2|Args2],
  length(Args1, Arity),
  length(Args2, Arity),
  (Functor1 == Functor2
   ->
    Cin1 = Cin,
    DegreeFunctor = 1.0
   ;
    ord_member_unify(sim(Functor1, Functor2, Block, DegreeFunctor), Equations),
    DegreeFunctor >= Lambda,
    evaluator:sat_a3([Functor1:Block, Functor2:Block], Cin, Cin1)
  ),
  weak_unify_args_a3(Args1, Args2, Equations, Lambda, Cin1, Cout, DegreeArgs),
  evaluator:t_norm_op(DegreeFunctor, DegreeArgs, Degree).
  
weak_unify_a3(Term, Variable, _Equations, _Lambda, Cin, Cin, 1.0) :-
  % Term/variable swap + Variable removal
  nonvar(Term), 
  var(Variable), 
  !,
  Variable = Term.
  
weak_unify_a3(Variable, Term, _Equations, _Lambda, Cin, Cin, 1.0) :-
  % Variable removal / Trivial equation removal
  var(Variable),
  Variable = Term.


%% weak_unify_args_a3(?Args1, ?Args2, +Equations, +Lambda, +Cin, -Cout, ?Degree)
%
%     Checks if the terms in the lists Args1 and Args2 can unify one
%     with each other and returns the minimum approximation Degree of
%     the unifications.
%

weak_unify_args_a3([], [], _Equations, _Lambda, Cin, Cin, 1.0).

weak_unify_args_a3([Arg1|MoreArgs1], [Arg2|MoreArgs2], Equations, Lambda, Cin, Cout, Degree) :-
  weak_unify_a3(Arg1, Arg2, Equations, Lambda, Cin, Cin1, DegreeArg),
  weak_unify_args_a3(MoreArgs1, MoreArgs2, Equations, Lambda, Cin1, Cout, DegreeMoreArgs),
  evaluator:t_norm_op(DegreeArg, DegreeMoreArgs, Degree).


% ord_member_unify(+Elem, +OrdSet)
% True if Elem unifies with an element of OrdSet (a sorted list without duplicates).
ord_member_unify(Elem, [Head|Tail]) :-
    (   Elem = Head
    ->  true
    ;   Elem @< Head
    ->  fail
    ;   ord_member_unify(Elem, Tail)
    ).
 
