%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utilities for benchmarking HBPL
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- module(bench_utils, [
    initialize_hbpl/0, 
    change_hypothetical_directive/2,
    set_host_performance/1,
    prepare_goal/3,
    create_bpl_program/2, % +ProgramNameExt, +Program
    create_pl_program/3, % +ProgramNameExt, +ExpEquations, +Program
    initialize_hypothetical_settings/0,
    sort_predicates/2,
    my_mergesort/2,
    my_mergesort/3,
    pred_lt/2,
    pred_leq/2,
    clear_module/1,
    stat_start/6,
		stat_end/12
    ]).

:- op(1050, xfy, [=>]).      % Hypothetical implication
% :- op(1020, yfx, [/\\]).     % Hypothetical conjunction
:- op(500, yfx, ['~']).      % Similarity relation

% initialize_hbpl/0
%
%% Initializes the Bousi-Prolog system

initialize_hbpl :-
	foreign:load_foreign_extension,
	flags:set_bpl_flag(continue('yes')),
	bplShell:set_system_predicates,
	flags:reset_bpl_flags,
	evaluator:load_tpl(''),
	% Gets the full path where the benchmark files are located
	working_directory(WorkingDir, WorkingDir),
	(concat_atom([_, '/'], WorkingDir) ->
		concat_atom([WorkingDir, 'benchmark'], BasePath)
	;
		concat_atom([WorkingDir, '/', 'benchmark'], BasePath)
	),
	% Remove compiled .tpl files
	concat_atom([BasePath, '/', '*.tpl*'], WildCard),
	expand_file_name(WildCard, FilesToDelete),
	maplist(rm, FilesToDelete).


% change_hypothetical_directive(+File, +Boolean)
%
%% Change the flag to Boolean in the hypothetical directive at the
%   first line of File

change_hypothetical_directive(BenchmarkFile, false) :-
  !,
  process_create(path(sed),['-i', '1s/true/false/', BenchmarkFile],[process(PID1)]),
  file_directory_name(BenchmarkFile, Path),
  concat_atom([Path,'/','sed*'], PathSedFiles),
  process_wait(PID1, _Status1),
  % sleep(0.5), % Wait for the O.S. to free files
  process_create(path(rm),[PathSedFiles],[process(PID2)]),
  process_wait(PID2, _Status2).

change_hypothetical_directive(BenchmarkFile, true) :-
  !,
  process_create(path(sed),['-i', '1s/false/true/',BenchmarkFile],[process(PID1)]),
  file_directory_name(BenchmarkFile, Path),
  concat_atom([Path,'/','sed*'], PathSedFiles),
  process_wait(PID1, _Status1),
  % sleep(0.5), % Wait for the O.S. to free files
  process_create(path(rm),[PathSedFiles],[process(PID2)]),
  process_wait(PID2, _Status2).

% set_host_performance(+Plan)
%
%% Set host performance to a given plan
%
set_host_performance(balanced) :-
    % Balanced performance
    process_create(path(powercfg),['/setactive', '381b4222-f694-41f0-9685-ff5bb260df2e'],[process(PID)]),
	process_wait(PID, _Status).                         

set_host_performance(maximum) :-
    % Maximum performance
    process_create(path(powercfg),['/setactive', '8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c'],[process(PID)]),
	process_wait(PID, _Status).


% prepare_goal(+Goal, -AtomGoal, -ListGoal)
%% Prepare a goal for its processing using HBPL sv command
%
prepare_goal(Goal, AtomGoal, Arguments) :-
	utilities:writef_to_atom('%t', [Goal], AtomGoal),
	atom_codes(AtomGoal, Codes),
	split_string(Codes, " ()", " ()", StrArgumentsWithQuotes),
	maplist([Cs, As] >> atom_codes(As, Cs), StrArgumentsWithQuotes, ArgumentsWithQuotes),
	utilities:remove_quotes(ArgumentsWithQuotes, Arguments).


% create_bpl_program(+ProgramNameExt, +Program),

create_bpl_program(ProgramNameExt, Program) :-
    open(ProgramNameExt, write, Stream, []),
    write(Stream, ':- hypothetical(true).\n\n'),
    write_clauses(Stream, Program),
    close(Stream).

% create_pl_program(+ProgramNameExt, +ExpEquations, +Program),

create_pl_program(ProgramNameExt, ExpEquations, Program) :-
    open(ProgramNameExt, write, Stream, []),
    write(Stream, ':- module(program, []).\n\n'),
    write(Stream, ':- op(1050, xfy, [=>]).      % Hypothetical implication\n'),
%    write(Stream, ':- op(1020, yfx, [/\\]).     % Hypothetical conjunction\n'),
    write(Stream, ':- op(500,  yfx, ['~']).     % Similarity relation\n\n'),
    write_clauses(Stream, ExpEquations),
    nl(Stream),
    write_clauses(Stream, Program),
    close(Stream).

% write_clauses(+Stream, +Program)
write_clauses(Stream, Program) :-
    forall(
        member(Clause, Program),
        (writeq(Stream, Clause), write(Stream, '.\n'))
    ).


% initialize_hypothetical_settings/0
%
%% Initialize hypothetical reasoning
initialize_hypothetical_settings :-
	evaluator:reset_di, % Reset hypothetical database context identifier
	retractall(evaluator:reg(_, _, _)). % Retract hypothetical registered rules



% sort_predicates(+Clauses, +OrdClauses)
%
%% Sort predicates in ascending order, keeping the original ordering of clauses in each predicate
% sort_predicates([], []) :- !.
% sort_predicates(Clauses, OrdClauses) :-
%   setof(N/A, H^B^(member((H :- B), Clauses), functor(H, N, A)), Predicates),
%   findall((H:-B), (member(N/A, Predicates), member((H:-B), Clauses), functor(H, N, A)), OrdClauses).

sort_predicates(Clauses, OrdClauses) :-
  sort_predicates_aux(Clauses, OrdClauses),
  length(Clauses, L1),
  length(OrdClauses, L2),
  ( L1 =:= L2 -> true ; throw(assertion_error('sort_predicates: output length differs from input')) ).

sort_predicates_aux([], []) :- !.
sort_predicates_aux(Clauses, OrdClauses) :-
    % Tag each clause with its predicate indicator
    maplist(
        {}/[Clause, Key-Clause]>>(
            (Clause = (H :- _) -> true ; H = Clause),
            functor(H, N, A),
            Key = N/A
        ),
        Clauses, KeyedClauses
    ),
    % Sort by predicate indicator, preserving order within each group
    keysort(KeyedClauses, SortedKeyed),
    % Remove keys
    pairs_values(SortedKeyed, OrdClauses).

% Mergesort
% Keep duplicates
% Stable
my_mergesort(L,OL) :-
  my_mergesort(L,'@=<',OL). 

my_mergesort([],_P,[]). 
my_mergesort([A],_P,[A]).
my_mergesort([A,B|Rest],P,S) :-
  ms_divide([A,B|Rest],L1,L2),
  my_mergesort(L1,P,S1),
  my_mergesort(L2,P,S2),
  ms_merge(S1,S2,P,S).
  
ms_divide([],[],[]).
ms_divide([A],[A],[]).
ms_divide([A,B|R],[A|Ra],[B|Rb]) :-
  ms_divide(R,Ra,Rb).

ms_merge(A,[],_P,A).
ms_merge([],B,_P,B).
ms_merge([A|Ra],[B|Rb],P,[A|M]) :-
%  A =< B,
  G=..[P,A,B],
  G,
  ms_merge(Ra,[B|Rb],P,M).
ms_merge([A|Ra],[B|Rb],P,[B|M]) :-
%  A > B,
  G=..[P,A,B],
  \+ G,
  ms_merge([A|Ra],Rb,P,M). 

% Predicate ordering for ms_mergesort/3
% Less than
pred_lt((X :- _),(Y :- _)) :-
  functor(X,F1,A1),
  functor(Y,F2,A2),
  (  F1 @< F2
   ; F1 == F2, A1 < A2).

% Less or equal
pred_leq((X :- _),(Y :- _)) :-
  functor(X,F1,A1),
  functor(Y,F2,A2),
  (  F1 @< F2
   ; F1 == F2, A1 =< A2).


% clear_module(+Module)
%  Retract all predicates (static and dynamic) from Module
%
clear_module(Module) :-
    current_predicate(Module:Name/Arity),
    functor(Head, Name, Arity),
    (   predicate_property(Module:Head, dynamic)
    ->  retractall(Module:Head),
        abolish(Module:Name/Arity)
    ;   abolish(Module:Name/Arity)
    ),
    fail.
clear_module(_).

%%%%%%%%%%%%%%
% This is how time and space are measured in SWI-Prolog.
%
% Garbage collection and stack trimming are performed before starting measurements
% The same is performed at the end of goal solving, so that reclaimed space represents the space used in this solving

% stat_start(-RT, -T, -I, -G, -L, -H), Initialization procedure. 
%   RT is CPU time since last, excluding time spent in garbage collection, 
%   T is user CPU time since thread was started, 
%   I is the total number of inferences
%     (passes via the call and redo ports) since the system was started,
%   G is the global stack, 
%   L is the local stack, and 
%   H is the heap used.
stat_start(RT, T, I, G, L, H) :-
    % system_swi
    garbage_collection_swi,
    statistics(runtime, [RT|_]), 
    statistics(cputime, T), 
    statistics(inferences, I),
    statistics(global_stack, [G|_]), 
    statistics(local_stack, [L|_]), 
    statistics(heapused, H).

% stat_end(+RT, +T, +I, +G, +L, +H, RTime, CTime, Inferences, Global, Local, Heap),
% RT, T, I, G, L, H must be: RT the runtime, T the user CPU time, I the total number of inferences computed, G the global stack, L the local stack, and H the heap used as computed by stat_start
stat_end(RT, T, I, G, L, H, RTime, CTime, Inferences, Global, Local, Heap) :-
    % system_swi
    garbage_collection_swi,
    %% Runtime in seconds
    statistics(runtime, [RT1|_]), RTime is (RT1-RT)/1000,
    statistics(cputime, T1), CTime is T1-T,
    statistics(inferences, I1), Inferences is I1-I,
    statistics(global_stack, [G1|_]), Global is G1-G,
    statistics(local_stack, [L1|_]), Local is L1-L,
    statistics(heapused, H1), Heap is H1-H.

garbage_collection_swi :-
    garbage_collect,
    garbage_collect_atoms,
    garbage_collect_clauses,
    trim_stacks.

    
