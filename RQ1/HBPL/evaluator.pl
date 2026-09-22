%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bousi-Prolog interpreter

:- module(evaluator, [
		load_tpl/1,             % +File
		load_tpls/1,            % +File
		solve_goal/1,           % :Goal
		get_sim_equations/1,    % -Equations
		add_sim_equations/1,    % +Equations
    update_sim_equations/1, % +Equations
    build_block_equations/2 % +Equations, -BlockEquations
%    retract_all_dyn_predicates/0
   ]).

:- use_module(directives).
:- use_module(utilities).
:- use_module(flags).
:- use_module(dcg,[my_phrase/3]).
:- use_module(library(ordsets)).
:- use_module(library(snowball)).

% The following libraries aren't used by this module, but are imported
% in case they are needed by Bousi-Prolog programs or queries
:- use_module(library(help)).
:- use_module(library(lists)).
:- use_module(library(readutil)).
:- use_module(library(statistics)).




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- set_prolog_flag(double_quotes, codes).

% Called from module directives, ensure_loaded_wn loads in evaluator the WornNet needed modules when loading a BPL program at run-time
ensure_loaded_wn :-
  ensure_loaded(wn(wn)),
  ensure_loaded(wn(wn_synsets)),
  ensure_loaded(wn(wn_hypernyms)),
  ensure_loaded(wn(wn_hyponyms)),
  ensure_loaded(wn(wn_similar_adjectives)),
  ensure_loaded(wn(wn_sim_measures)),
  ensure_loaded(wn(wn_ic_measures)),
  ensure_loaded(wn(wn_rel_measures)), % library(snowball) not found in the executable, but found in the interpreted code
  ensure_loaded(wn(wn_gen_prox_equations)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Public predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% load_tpl(+File)
%
%     Loads a translated Bousi-Prolog (TPL) file directly into memory,
%     unloading the last file loaded with this predicate first. If File
%     is an empty string, the current loaded file will be removed from
%     the database but no file will be loaded afterwards.
%

load_tpl(File) :-
  retract_all_dyn_predicates,
	(current_predicate(unload_file/1) ->
		% The unload_file/1 predicate is available only in SWI-Prolog
		% 5.10.0 and later
		current_file(OldFile),
		(OldFile \== '' ->
			unload_file(OldFile)
		;
			true
		),
		retract(current_file(OldFile)),
		assert(current_file(File))
	;
		% User-defined predicates can't be erased using retractall/1
		% because they're not dynamic; as a result, SWI-Prolog will
		% show a warning if the same program is loaded twice
		true
	),
	(File \== '' ->
		% Loads the new program
		%consult(File)
		ensure_loaded(File),
    directives:set_hypothetical_operators
	;
		% Initializes the symmetric fuzzy relations so they can be
		% used without having a program loaded
		assert(frel1(X, X, 1.0)),
		assert(frel2(X, X, 1.0)),
		assert(frel3(X, X, 1.0))
	).

retract_all_dyn_predicates :-
	% Removes all dynamic predicates from the previous loaded program
	retractall(sim(_, _, _)),
	retractall(sim(_, _, _, _)),
	retractall(lEqThan(_, _, _)),
	retractall(gEqThan(_, _, _)),
	retractall(frel1(_, _, _)),
	retractall(frel2(_, _, _)),
	retractall(frel3(_, _, _)).


%% load_tpls(+File)
%
%     Loads a translated Bousi-Prolog state (TPLS) file directly into memory,
%     unloading the last file loaded with this predicate first. If File
%     is an empty string, the current loaded file will be removed from
%     the database but no file will be loaded afterwards.

load_tpls(File) :-
	current_file(OldFile),
	(OldFile \== '' ->
		unload_file(OldFile)
	;
		true
	),
	(File \== '' ->
		% Loads the new program
		consult(File)
	;
		true
	).


%% solve_goal(:Goal, -Deterministic)
%
%     Executes the specified Goal under this module, using the rules
%     and relations of the currently loaded program. Formally, this
%     predicate succeeds if there's a refutation for Goal with a
%     certain approximation degree.
%     Returns true in Deterministic if the goal has no more solutions;
%     otherwise, returns false
%

solve_goal(Goal, Deterministic) :-
  evaluator:reset_di, % Reset hypothetical database context identifier
	retractall(evaluator:reg(_, _, _)), % Retract hypothetical registered rules
	catch((
		Goal,
		deterministic(Deterministic)

	% (catcher)
	), error(existence_error(procedure, Predicate), context(Context, Extra)), (
		% When an undefined predicate is called, SWI-Prolog throws an
		% exception that contains the internal name of some predicates
		% (e.g. given "undefined/2", the exception message will include
		% "evaluator:prefix_undefined/3"); here we get the actual names
		% of the predicates and throws a new exception with them		
		get_actual_predicate_definition(Predicate, ActualPredicate),
		get_actual_predicate_definition(Context, ActualContext),
		throw(error(existence_error(procedure, ActualPredicate), context(ActualContext, Extra)))
	)).


solve_goal(Goal) :-
  solve_goal(Goal, _Deterministic).


%% get_sim_equations(-Equations)
%
%     Unifies Equations with the list of currently defined
%     proximity/similarity equations, that is, sim/3 terms.
%     Equations are lexicographically ordered
%

get_sim_equations(Equations) :-
	setof(sim(Sym1, Sym2, Degree), sim(Sym1, Sym2, Degree), Equations),
  !.

get_sim_equations([]).


%% add_sim_equations(+Equations)
%
%     Asserts a list of proximity/similarity equations, that is, sim/3
%     terms. Equations that are already defined or aren't sim/3 terms
%     won't be added to the database.
%

add_sim_equations(Equations) :-
  add_sim_equations(Equations, _Added).


%% add_sim_equations(+Equations, -Added)
%
%     As add_sim_equations, but adding a flag signalling whether there
%     was anyone actually added. If so, Added=yes, else Added=no
%

add_sim_equations([], Added) :-
  var(Added),
  !,
  Added = no.
  
add_sim_equations([], _Added). % If not a var, _Added should be 'yes'

add_sim_equations([sim(Sym1, Sym2, Value)|MoreEquations], Added) :-
	sim(Sym1, Sym2, OldValue),
	OldValue >= Value,
	% If the equation is already defined with a greater or equal degree,
	% no need to define it again
	!,
	add_sim_equations(MoreEquations, Added).

add_sim_equations([sim(Sym1, Sym2, Value)|MoreEquations], Added) :-
	% Equation isn't defined, so it must be asserted
	!,
	assert(sim(Sym1, Sym2, Value)),
	Added = yes,
	add_sim_equations(MoreEquations, Added).

add_sim_equations([_|MoreEquations], Added) :-
	% Equation which is not a sim/3 term
	!,
	add_sim_equations(MoreEquations, Added).


%% update_sim_equations(+Equations)
%
%     Asserts a list of proximity/similarity equations sim/3 using 
%     add_sim_equations, and recomputes sim/4 for the weak unification
%     algorithm a3.
%     Closures for sim/3 are not computed.
%

update_sim_equations(Equations) :-
  update_sim_equations(Equations, _Updated).
  

%% update_sim_equations(+Equations, +Updated)
%
%     As update_sim_equations, but adding a flag signalling whether there
%     was anyone updated. If so, Updated=yes, else Updated=no
%

update_sim_equations(Equations, Updated) :-
  flags:bpl_flags(weak_unification(a3)),
  !,
  add_sim_equations(Equations, Updated),
  retractall(sim(_,_,_,_)),
	build_block_equations(Equations, _BlockEquations).

update_sim_equations(Equations, Updated) :-
  add_sim_equations(Equations, Updated).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Building block equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% build_block_equations(+Equations, -BlockEquations)
%
%     If the flag weak_unification is set to 'a3', it builds the 
%     corresponding block equations from the input list of sim 
%     equations. Otherwise, it returns no block equations.
%     The block equations can be built either with Prolog code
%     (flag ext_block_equs set to false) or C code (flag set to true)
%     The relation sim/3 is expected to be already generated and
%     stored in the dynamic database.
%     The relation sim/4 (for the weak unification algorithm a3) is 
%     *not* expected to be stored in the dynamic database.
%     Upon completion of this predicate, both relations sim/3 and 
%     sim/4 will be stored in the dynamic database.


build_block_equations(Equations, BlockEquations) :-
	flags:get_bpl_flag(weak_unification('a3')),
	flags:get_bpl_flag(ext_block_equs('false')),
	!,
  evaluator:add_sim_equations(Equations),
  gen_rb(BlockEquations).
 
build_block_equations(Equations, BlockEquations) :-
	flags:get_bpl_flag(weak_unification('a3')),
	!,
 	findall(sim(X,Y,D), member(sim(X,Y,D), Equations), SimEquations), % There are other non-sim equations in Equations, such as frel1,2,3
	copy_term(SimEquations, CopyEquations), % WARNING: Workaround to avoid instantiations in Equations due to foreign:ext_block_equs. Remove the copy when fixed
	get_sim_equations(StoredEquations),
	ord_union(StoredEquations, CopyEquations, AllEquations),
	foreign:ext_block_equs(0, AllEquations, sim, BlockEquations),
  retractall(sim(_,_,_,_)),
  maplist(assert, BlockEquations).

build_block_equations(_Equations, []).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Generating the Extended Proximity Relation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% gen_rb(-BlockEquations)
%
%    Generates the extended proximity relation RB from the proximity
%    relation R already asserted. Notice that the proximity relation R 
%    is implemented with the predicate sim/3 and the extended proximity 
%    relation RB is implemented with the predicate sim/4.
%    sim/3 is expected to be in the dynamic database, whereas sim/4 do not.
%    sim/4 is asserted with gen_rb.
%

gen_rb(BlockEquations) :-
  setof(F, T^D^(evaluator:sim(F, T, D)), G),  % Nodes
  allMaxCliques(G, LC),
  build_ctrs(LC, Ctrs),        % Build annotations Symbol:Block as an ordered list
  gen_entries(Ctrs),
  setof(sim(F, T, B, D), evaluator:sim(F, T, B, D), BlockEquations),
  !.
  
gen_rb([]).

                          
build_ctrs(LC,Cout) :-
  build_ctrs(LC,0,[],Cout).    
   
build_ctrs([],_B,Cin,Cin).
build_ctrs([Cs|LC],B,Cin,Cout) :-
  ctrs_from_block(Cs,B,Cin,Cin1),
  B1 is B+1,
  build_ctrs(LC,B1,Cin1,Cout).
  
ctrs_from_block([],_B,Cin,Cin).
ctrs_from_block([C|Cs],B,Cin,Cout) :-
  ord_union([C:B],Cin,Cin1), 
  ctrs_from_block(Cs,B,Cin1,Cout).

ord_ctr_member(X,[X|_Xs]). 
ord_ctr_member(X:B,[Y:_|Xs]) :-
  X@>=Y,
  ord_ctr_member(X:B,Xs). 
  
gen_entries(Ctrs) :-
  evaluator:sim(F,T,D),
  ord_ctr_member(F:B,Ctrs),
  ord_ctr_member(T:B,Ctrs),
  assert(evaluator:sim(F,T,B,D)),
  fail.
gen_entries(_Ctrs).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Maximal cliques from the graph defined by the 'sim' relation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

/****************************************************************************
****************************************************************************/


/****************************************************************************
BronKerbosch2(R,P,X):
    if P and X are both empty:
         report R as a maximal clique 
    choose a pivot vertex u in P ? X 
    for each vertex v in P \ N(u):
         BronKerbosch2(R ? {v}, P ? N(v), X ? N(v)) 
         P := P \ {v}
         X:=X ? {v}
*****************************************************************************/

allMaxCliques(LC) :-
  setof(F, T^D^(evaluator:sim(F, T, D)), Fs),
  allMaxCliques(Fs,LC).

%% allMaxCliques(G,LC): LC is a list of all maximal cliques of a graph G 
%% (passed as a set of nodes). G must be ordered.
allMaxCliques(G, LC) :-
%  list_to_ord_set(G,OG),         % Use this alternative when
%  setof(C, maxClique(OG,C), LC). % G is not expected to be ordered
  setof(C, maxClique(G, C), LC).

%% GOAL EXAMPLE
% g(LC) :- allMaxCliques([1,2,3,4,5,6],LC).

%% maxClique(G,C): C is a maximal clique of a graph G passed as a set of nodes.
%% G must be ordered
maxClique(G, C) :-
  maxClique(G, [], [], C).

%% maxClique(P,X,A,R): 
/*
Finds the maximal cliques that include all of the vertices in R, some of the 
vertices in P, and none of the vertices in X. In each call to maxClique/4, 
P and X are disjoint sets whose union consists of those vertices that form 
cliques when added to R. 
When P and X are both empty there are no further elements that can be added to R, 
so R is a maximal clique and maxClique/4 outputs R.

A is an accumulator parameter where R is built step by step.

Notice: maxClique/4 implements BronKerbosch2 but with variations; for instance, the 
instructions P := P \ {v} and X:=X ? {v} are not considered; perhaps, by this reason 
the implementation is more inefficient, obtaining many redundant answers. 
*/

%% R is a maximal clique for a graph G
%% maxClique/4 obtains a clique for each V in DP=(P \ N(u))
%% (Many redundancies; then, low efficiency).
maxClique([],[],R,OR) :-
  !, % FSP
  list_to_ord_set(R,OR).
maxClique(P,X,A,R) :-
  ord_union(P,X,PX), 
  pivot(PX,U),  
  neighborSet(U,NU), 
  ord_subtract(P,NU,DP), 
  member(V,DP), 
  neighborSet(V,NV), 
  ord_intersection(P,NV,PNV), 
  ord_intersection(X,NV,XNV), 
  maxClique(PNV,XNV,[V|A],R). 


% Neighbor set of vertex V in G
neighborSet(V,NV) :-
  setof(N, D^(evaluator:sim(V, N, D)), NV). % Explicit Symmetry
%  setof(N, D^(sim(V,N,D) ; sim(N,V,D)), NV). % Implicit Symmetry


% Neighbor set of vertex V in the set PX
% NOT USED.
% neighborSet(V,PX,NVPX) :-
%   setof(N, D^sim(V,N,D), NV), 
%   intersect(PX,NV, NVPX).


%%pivot(PX,U)
%% IMPORTANT: We choose a pivot U that maximizes N(U), i.e., the neighbor 
%% set of U.
%% 
pivot(PX,U) :-
  pivot(PX,0,[],U).
  
pivot([],_,[A],A).
pivot([V|Vs],AN,_,U) :-
  neighborSet(V,NV), 
  length(NV,L), 
  L>AN, 
  !, 
  pivot(Vs,L,[V],U).
pivot([_|Vs],AN,[A],U) :-
  pivot(Vs,AN,[A],U).

/*****************************************
%% IMPORTANT: When we follow Tomita's option, consisting in
%% maximizing P ? N(U), this program does not work. Do not ask why.
%%
%%pivot(PX,P,U)
%% 
pivot(PX,P,U) :- pivot(PX,P,0,[],U).
pivot([],_,_,[A],A).
pivot([V|Vs],P,AN,_,U) :- neighborSet(V,NVP), %neighborSet(V,P,NVP),
                    length(NVP,L), L>AN, !, pivot(Vs,P,L,[V],U).
pivot([_|Vs],P,AN,[A],U) :- pivot(Vs,P,AN,[A],U).
*******************************************/



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Weak unification algorithm 'a1'. Used for bpl_flag(weak_unification(a1))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% weak_unify_a1(?Term1, ?Term2, +Lambda, ?DegreeIn, ?DegreeOut)
%
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     applying the degree optimization algorithm.

weak_unify_a1(Atomic1, Atomic2, Lambda, DegreeIn, DegreeOut) :-
  weak_unify_a1(Atomic1, Atomic2, Lambda, Degree),
  degree_composition([DegreeIn, Degree], DegreeOut).


%
%% weak_unify_a1(?Term1, ?Term2, +Lambda, ?Degree)
%
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     and returns the approximation Degree in which both terms unify.
%     Lambda is the lower bound allowed for the approximation degree
%     of the weak unifications.
%

weak_unify_a1(Atomic1, Atomic2, Lambda, Degree) :-
	% Atom (constant) unification
	atomic(Atomic1), 
	atomic(Atomic2), 
	!,
  (Atomic1 == Atomic2
   ->
    Degree = 1.0
   ;
    sim(Atomic1, Atomic2, Degree),
    Degree >= Lambda
  ).

weak_unify_a1(Xs, Ys, Lambda, Degree) :-
  is_list(Xs),
  is_list(Ys),
  !,
	weak_unify_args_a1(Xs, Ys, Lambda, Degree).

weak_unify_a1(Term1, Term2, Lambda, Degree) :-
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
    DegreeFunctor = 1.0
   ;
    sim(Functor1, Functor2, DegreeFunctor),
    DegreeFunctor >= Lambda
  ),
	weak_unify_args_a1(Args1, Args2, Lambda, DegreeArgs),
  t_norm_op(DegreeFunctor, DegreeArgs, Degree).

weak_unify_a1(Term, Variable, _Lambda, 1.0) :-
	% Term/variable swap + Variable removal
	nonvar(Term), 
	var(Variable), 
	!,
	Variable = Term.

weak_unify_a1(Variable, Term, _Lambda, 1.0) :-
	% Variable removal / Trivial equation removal
	var(Variable),
	Variable = Term.


%% weak_unify_args_a1(?Args1, ?Args2, +Lambda, ?Degree)
%
%     Checks if the terms in the Args1 and Args2 lists can unify one
%     with each other and returns the minimum approximation Degree of
%     the unifications.
%

weak_unify_args_a1([], [], _Lambda, 1.0).

weak_unify_args_a1([Arg1|MoreArgs1], [Arg2|MoreArgs2], Lambda, Degree) :-
	weak_unify_a1(Arg1, Arg2, Lambda, DegreeArg),
	weak_unify_args_a1(MoreArgs1, MoreArgs2, Lambda, DegreeMoreArgs),
  t_norm_op(DegreeArg, DegreeMoreArgs, Degree).


	
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Weak unification algorithm 'a2'
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Declaration of the proximity constraint operator used as a notation 
% for proximity constraints. A proximity constraint (of level L), 
% 'a -- b', is a non-ordered pair of symbols {a,b}, holding: 
% sim(a, b, D) with D >= L.

:- op(750, yfx, '--').

:- dynamic '--'/2.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% weak_unify_a2(?Term1, ?Term2, +Lambda, ?Cin, ?Cout, ?Degree)
%
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     and returns the approximation Degree in which both terms unify.
%     Lambda is the lower bound allowed for the approximation degree
%     of the weak unifications. Cin is the input constraint store of 
%     proximity constraints, and Cout the output constraint store.

%% weak_unify_a2(?Term1, ?Term2, +Lambda, ?Cin, ?Cout, ?DegreeIn, ?DegreeOut)
%
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     for the degree accumulator optimization.

weak_unify_a2(Atomic1, Atomic2, Lambda, Cin, Cout, DegreeIn, DegreeOut) :-
  weak_unify_a2(Atomic1, Atomic2, Lambda, Cin, Cout, Degree),
  degree_composition([DegreeIn, Degree], DegreeOut).


weak_unify_a2(Atomic1, Atomic2, Lambda, Cin, Cout, Degree) :-
  % Atom (constant) unification
  atomic(Atomic1), 
  atomic(Atomic2), 
  !,
  (Atomic1==Atomic2
   ->
    Degree=1.0,
    Cout=Cin
   ;
    sim(Atomic1, Atomic2, Degree),
    Degree >= Lambda,
    sat_a2(Atomic1--Atomic2, Cin, Cout)
  ).

weak_unify_a2(Xs, Ys, Lambda, Cin, Cout, Degree) :-
  is_list(Xs),
  is_list(Ys),
  !,
	weak_unify_args_a2(Xs, Ys, Lambda, Cin, Cout, Degree).

weak_unify_a2(Term1, Term2, Lambda, Cin, Cout, Degree) :-
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
    sim(Functor1, Functor2, DegreeFunctor),
    DegreeFunctor >= Lambda,
    sat_a2(Functor1--Functor2, Cin, Cin1)
  ),
  weak_unify_args_a2(Args1, Args2, Lambda, Cin1, Cout, DegreeArgs),
  t_norm_op(DegreeFunctor, DegreeArgs, Degree).

weak_unify_a2(Term, Variable, _Lambda, Cin, Cin, 1.0) :-
  % Term/variable swap + Variable removal
  nonvar(Term), 
  var(Variable), 
  !,
%  occur_check(Variable, Term),
  Variable = Term.

weak_unify_a2(Variable, Term, _Lambda, Cin, Cin, 1.0) :-
  % Variable removal / Trivial equation removal
  var(Variable),
%  occur_check(Variable, Term),
  Variable = Term.

%% weak_unify_args_a2(?Args1, ?Args2, +Lambda, +Cin, -Cout, ?Degree)
%
%     Checks if the terms in the lists Args1 and Args2 can unify one
%     with each other and returns the minimum approximation Degree of
%     the unifications.
%

weak_unify_args_a2([], [], _Lambda, Cin, Cin, 1.0).

weak_unify_args_a2([Arg1|MoreArgs1], [Arg2|MoreArgs2], Lambda, Cin, Cout, Degree) :-
  weak_unify_a2(Arg1, Arg2, Lambda, Cin, Cin1, DegreeArg),
  weak_unify_args_a2(MoreArgs1, MoreArgs2, Lambda, Cin1, Cout, DegreeMoreArgs),
  t_norm_op(DegreeArg, DegreeMoreArgs, Degree).

% occur_check(Variable, Term) :-
%   term_variables(Term, Variables),
%   \+ memberchk_eq(Variable,Variables). % Needs library hprolog.pl



%%%
% This solution does not use the lambda cut to avoid having to introduce 
% entries in the proximity relation between elements with a proximity degree of 0



%%%%%%%%%%%%%%%
%% sat_a2_ctrs(C): Checks if a set of proximity constraints C is consistent. That is, if
% there is no divergent paths in the graph of proximity constraints. A path between the
% vertexes X and Y is divergent if X is close to Y with degree D (sim(X,Y,D)) and D is 
% less than the Lambda-cut (D<L).
%%% NOTICE THAT  for two elements to belong to the same Lambda-block it is necessary
% that sim(X,Y,D) and D>=L. Then, if sim(X,Y,D) and D<L is because X belongs to a block 
% and Y to another. This is signaling out that an inner element in the divergent path
% is playing two roles.
%%% ALSO NOTICE THAT if there is no divergent paths, the condition 
%             (ctrs_path(X,Y), sim(X,Y,D), D<L)
% generates the transitive closure of the relation defined by the set of proximity 
% constraints by backtracking. On the other hand, it is not necessary to compute the 
% whole transitive closure, it suffices to detect the first divergent path and fail.

sat_a2(E1--E2, Cin, Cout) :- 
  (var(Cin) -> Cin = [] ; true),
	uniPCS([E1--E2], Cin, Cout), 
	sat_a2_ctrs(Cout),
	!. 

sat_a2_ctrs(C) :- 
	load_ctrs(C),
	((ctrs_path(X,Y), \+sim(X,Y,_D)) %%(ctrs_path(X,Y), sim(X,Y,D), D<L) %%
	->
	clear_ctrs,
	false
	;
	clear_ctrs,
	true	
	).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%       AUXILIARY PREDICATES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%  PROXIMITY CONSTRAINT SET (PCS) PROCESSING  %%%%%%%%%%%%%%%%%%%%

% Member of a block constraint set
membPCS(S1--S2, [S1--S2|_]). 
membPCS(S1--S2, [S2--S1|_]). 
membPCS(S1--S2, [_|L]) :- membPCS(S1--S2, L).

% Subset of a block constraint set
subPCS([], _).
subPCS([S1--S2|R], C) :- membPCS(S1--S2, C), subPCS(R, C).

% 
equalPCS(A, B) :- subPCS(A, B), subPCS(B, A).

% Union	
uniPCS([], C, C).
uniPCS([S1--S2|R], C2, C) :- membPCS(S1--S2, C2), !, uniPCS(R, C2, C).
uniPCS([S1--S2|R], C2, [S1--S2|C]) :- uniPCS(R, C2, C).

% Intersection
interPCS([], _, []).
interPCS([S1--S2|R], C2, [S1--S2|C]) :- membPCS(S1--S2, C2), !, interPCS(R, C2, C).
interPCS([_|R], C2, C) :- interPCS(R,C2, C).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%           CONSTRAINT GRAPHS                %%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%
%% load_ctrs(C): asserts the list of proximity constraints C.
load_ctrs([]).
load_ctrs([X--Y|Cs]) :- assert(X--Y), assert(Y--X), load_ctrs(Cs).


%% clear_ctrs: retracts all the loaded proximity constraints.
clear_ctrs:- retractall(_X--_Y).


%%%%%%%%%%%%%%%
%% ctrs_path(X,Y): True if there is a path between the vertexes X and Y in the graph of 
%% proximity constraints. X must be different from Y.
ctrs_path(X,Y) :- ctrs_path(X,Y, _).

ctrs_path(X,Y, P) :- ctrs_path(X,Y,[X],P).

ctrs_path(X,Y, A, [Y|A]) :- X--Y, \+member(Y,A). 
ctrs_path(X,Y, A, P) :- X--Z, \+member(Z,A), ctrs_path(Z,Y,[Z|A],P).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Weak unification algorithm 'a3'. Used for bpl_flag(weak_unification(a3))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% weak_unify_a3(?Term1, ?Term2, +Lambda, +Cin, -Cout, ?DegreeIn, ?DegreeOut)
%
%     Unifies Term1 and Term2 using unification by proximity
%     applying the degree optimization algorithm.

weak_unify_a3(Atomic1, Atomic2, Lambda, Cin, Cout, DegreeIn, DegreeOut) :-
  weak_unify_a3(Atomic1, Atomic2, Lambda, Cin, Cout, Degree),
  degree_composition([DegreeIn, Degree], DegreeOut).


%% weak_unify_a3(?Term1, ?Term2, +Lambda, +Cin, -Cout, ?Degree)
%
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     and returns the approximation Degree in which both terms unify.
%     Lambda is the lower bound allowed for the approximation degree
%     of the weak unifications. Cin is the input constraint store of 
%     block constraints, and Cout the output constraint store.

weak_unify_a3(Atomic1, Atomic2, Lambda, Cin, Cout, Degree) :-
  % Atom (constant) unification
  atomic(Atomic1), 
  atomic(Atomic2), 
  !,
  (Atomic1 == Atomic2
   ->
    Degree = 1.0,
    Cout=Cin
   ;
    sim(Atomic1, Atomic2, Block, Degree),
    Degree >= Lambda,
    sat_a3([Atomic1:Block, Atomic2:Block], Cin, Cout)
  ).

weak_unify_a3(Xs, Ys, Lambda, Cin, Cout, Degree) :-
  is_list(Xs),
  is_list(Ys),
  !,
	weak_unify_args_a3(Xs, Ys, Lambda, Cin, Cout, Degree).

weak_unify_a3(Term1, Term2, Lambda, Cin, Cout, Degree) :-
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
    sim(Functor1, Functor2, Block, DegreeFunctor),
    DegreeFunctor >= Lambda,
    sat_a3([Functor1:Block, Functor2:Block], Cin, Cin1)
  ),
  weak_unify_args_a3(Args1, Args2, Lambda, Cin1, Cout, DegreeArgs),
  t_norm_op(DegreeFunctor, DegreeArgs, Degree).
  
weak_unify_a3(Term, Variable, _Lambda, Cin, Cin, 1.0) :-
  % Term/variable swap + Variable removal
  nonvar(Term), 
  var(Variable), 
  !,
  Variable = Term.
  
weak_unify_a3(Variable, Term, _Lambda, Cin, Cin, 1.0) :-
  % Variable removal / Trivial equation removal
  var(Variable),
  Variable = Term.


%% weak_unify_args_a3(?Args1, ?Args2, +Lambda, +Cin, -Cout, ?Degree)
%
%     Checks if the terms in the lists Args1 and Args2 can unify one
%     with each other and returns the minimum approximation Degree of
%     the unifications.
%

weak_unify_args_a3([], [], _Lambda, Cin, Cin, 1.0).

weak_unify_args_a3([Arg1|MoreArgs1], [Arg2|MoreArgs2], Lambda, Cin, Cout, Degree) :-
  weak_unify_a3(Arg1, Arg2, Lambda, Cin, Cin1, DegreeArg),
  weak_unify_args_a3(MoreArgs1, MoreArgs2, Lambda, Cin1, Cout, DegreeMoreArgs),
  t_norm_op(DegreeArg, DegreeMoreArgs, Degree).

  
%% sat_a3(+Constraints, +InConstraints, +OutConstraints)
%
%     Checks the satisfiabality of Constraints w.r.t. InConstraints.
%     If so, it returns the union of Constraints and InConstraints,
%     otherwise it fails.
%

sat_a3(Ctrs, Cin, Cout) :-
  var(Cin),
  !,
  empty_assoc(Cin),
  sat_a3_aux(Ctrs, Cin, Cout).
sat_a3(Ctrs, Cin, Cout) :-
  sat_a3_aux(Ctrs, Cin, Cout).

sat_a3_aux([], Cin, Cin).
sat_a3_aux([Ctr|Ctrs], Cin, Cout) :-
  sat_a3_ctr(Ctr, Cin, Cin1),
  sat_a3_aux(Ctrs, Cin1, Cout).

sat_a3_ctr(Symbol:Block, Cin, Cin) :-
  get_assoc(Symbol, Cin, Block1),
  !,
  Block=Block1.
sat_a3_ctr(Symbol:Block, Cin, Cout) :-
  put_assoc(Symbol, Cin, Block, Cout).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Unification by proximity/similarity
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% unify_a1(?Term1, ?Term2, ?Degree)
%
%     Algorithm 'a1'.
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     and returns the approximation Degree in which both terms unify.
%

unify_a1(Term1, Term2, Degree) :-
	flags:get_bpl_flag(lambda_cut(Lambda)),
	weak_unify_a1(Term1, Term2, Lambda, Degree).


%% unify_a2(?Term1, ?Term2, +Cin, -Cout, ?Degree)
%
%     Algorithm 'a2'.
%     Unifies Term1 and Term2 using unification by proximity with
%     algorithm a2, and returns the approximation Degree in which both 
%     terms unify.
%

unify_a2(Term1, Term2, Cin, Cout, Degree) :-
	flags:get_bpl_flag(lambda_cut(Lambda)),
	weak_unify_a2(Term1, Term2, Lambda, Cin, Cout, Degree).

unify_a2(Term1, Term2, Degree) :-
  parser:init_ctr_store([Cin]),
  unify_a2(Term1, Term2, Cin, _Cout, Degree).
  
	
%% unify_a3(?Term1, ?Term2, +Cin, -Cout, ?Degree)
%
%     Algorithm 'a2'.
%     Unifies Term1 and Term2 using unification by proximity with
%     algorithm a2, and returns the approximation Degree in which both 
%     terms unify.
%

unify_a3(Term1, Term2, Cin, Cout, Degree) :-
	flags:get_bpl_flag(lambda_cut(Lambda)),
	weak_unify_a3(Term1, Term2, Lambda, Cin, Cout, Degree).

unify_a3(Term1, Term2, Degree) :-
  parser:init_ctr_store([Cin]),
  unify_a3(Term1, Term2, Cin, _Cout, Degree).
  

%% unify_a1(?Term1, ?Term2, +Comparer, ?Value)                  is semidet
%
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     with algorithm a1.
%     Succeeds only if the resulting approximation degree satisfies
%     the expression "degree Comparer Value" (for example, "degree >
%     0.5"). Comparer can be any Prolog arithmetic comparison operator
%     (=:=, =\=, >=, =<, >, <) or the unification operator (in the
%     latter case, Value will be unified with the approximation
%     degree).
%

unify_a1(Term1, Term2, Comparer, Value) :-
	unify_a1(Term1, Term2, Degree),
	apply(Comparer, [Degree, Value]),
	!.


%% unify_a2(?Term1, ?Term2, +Comparer, ?Value)                  is semidet
%
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     with algorithm a2.

unify_a2(Term1, Term2, Comparer, Value) :-
	unify_a2(Term1, Term2, Degree),
	apply(Comparer, [Degree, Value]),
	!.


%% unify_a3(?Term1, ?Term2, +Comparer, ?Value)                  is semidet
%
%     Unifies Term1 and Term2 using unification by proximity/similarity
%     with algorithm a3.

unify_a3(Term1, Term2, Comparer, Value) :-
	unify_a3(Term1, Term2, Degree),
	apply(Comparer, [Degree, Value]),
	!.


%% unify_arguments_a1(?Problems)
%
%     Solves several unification Problems using the weak unification
%     algorithm a1. Problems must be a list containing sublists with 
%     three items: two terms and a variable where the approximation 
%     degree of the terms will be stored. If any of the weak 
%     unifications fail, the whole predicate will fail.
%

unify_arguments_a1([]).

unify_arguments_a1([[Term1, Term2, Degree]|MoreProblems]) :-
	unify_a1(Term1, Term2, Degree),
	unify_arguments_a1(MoreProblems).

	
%% unify_arguments_a2(?Problems)
%
%     Solves several unification Problems using the weak unification
%     algorithm a2.  

unify_arguments_a2([]).

unify_arguments_a2([[Term1, Term2, Cin, Cout, Degree]|MoreProblems]) :-
  unify_a2(Term1, Term2, Cin, Cout, Degree),
  unify_arguments_a2(MoreProblems).


%% unify_arguments_a3(?Problems)
%
%     Solves several unification Problems using the weak unification
%     algorithm a2.  

unify_arguments_a3([]).

unify_arguments_a3([[Term1, Term2, Cin, Cout, Degree]|MoreProblems]) :-
  unify_a3(Term1, Term2, Cin, Cout, Degree),
  unify_arguments_a3(MoreProblems).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Extension of user-defined fuzzy relations to terms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% e_frel1(?Term1, ?Term2, ?Degree)                           is nondet
%
%     Compares Term1 and Term2 using '~1~' fuzzy relation and returns
%     the approximation Degree of the result (if it's greater or equal
%     than the lambda-cut).
%

e_frel1(Term1, Term2, Degree) :-
	flags:get_bpl_flag(lambda_cut(Lambda)),
	compare_terms(frel1, Term1, Term2, Lambda, Degree).


%% e_frel1(?Term1, ?Term2, +Comparer, ?Value)                is semidet
%
%     Compares Term1 and Term2 using '~1~' fuzzy relation and succeeds
%     only if the resulting approximation degree satisfies the
%     expression "degree Comparer Value" (for example, "degree > 0.5"),
%     where degree must be greater or equal than the lambda cut.
%     Comparer can be any Prolog arithmetic comparison operator (=:=,
%     =\=, >=, =<, >, <) or the unification operator (in the latter
%     case, Value will be unified with the approximation degree).
%

e_frel1(Term1, Term2, Comparer, Value) :-
	e_frel1(Term1, Term2, Degree),
	apply(Comparer, [Degree, Value]),
	!.


%% e_frel2(?Term1, ?Term2, ?Degree)                           is nondet
%
%     Compares Term1 and Term2 using '~2~' fuzzy relation and returns
%     the approximation Degree of the result (if it's greater or equal
%     than the lambda-cut).
%

e_frel2(Term1, Term2, Degree) :-
	flags:get_bpl_flag(lambda_cut(Lambda)),
	compare_terms(frel2, Term1, Term2, Lambda, Degree).


%% e_frel2(?Term1, ?Term2, +Comparer, ?Value)                is semidet
%
%     Compares Term1 and Term2 using '~2~' fuzzy relation and succeeds
%     only if the resulting approximation degree satisfies the
%     expression "degree Comparer Value" (for example, "degree > 0.5"),
%     where degree must be greater or equal than the lambda cut.
%     Comparer can be any Prolog arithmetic comparison operator (=:=,
%     =\=, >=, =<, >, <) or the unification operator (in the latter
%     case, Value will be unified with the approximation degree).
%

e_frel2(Term1, Term2, Comparer, Value) :-
	e_frel2(Term1, Term2, Degree),
	apply(Comparer, [Degree, Value]),
	!.


%% e_frel3(?Term1, ?Term2, ?Degree)                           is nondet
%
%     Compares Term1 and Term2 using '~3~' fuzzy relation and returns
%     the approximation Degree of the result (if it's greater or equal
%     than the lambda-cut).
%

e_frel3(Term1, Term2, Degree) :-
	flags:get_bpl_flag(lambda_cut(Lambda)),
	compare_terms(frel3, Term1, Term2, Lambda, Degree).


%% e_frel3(?Term1, ?Term2, +Comparer, ?Value)                is semidet
%
%     Compares Term1 and Term2 using '~3~' fuzzy relation and succeeds
%     only if the resulting approximation degree satisfies the
%     expression "degree Comparer Value" (for example, "degree > 0.5"),
%     where degree must be greater or equal than the lambda cut.
%     Comparer can be any Prolog arithmetic comparison operator (=:=,
%     =\=, >=, =<, >, <) or the unification operator (in the latter
%     case, Value will be unified with the approximation degree).
%

e_frel3(Term1, Term2, Comparer, Value) :-
	e_frel3(Term1, Term2, Degree),
	apply(Comparer, [Degree, Value]),
	!.


%% e_gEqThan(?Term1, ?Term2, ?Degree)                         is nondet
%
%     Compares Term1 and Term2 using '~>' ("less general than" /
%     "greater or equal than") fuzzy relation and returns the
%     approximation Degree of the result (if it's greater or equal
%     than the lambda-cut).
%

e_gEqThan(Term1, Term2, Degree) :-
	flags:get_bpl_flag(lambda_cut(Lambda)),
	compare_terms(gEqThan, Term1, Term2, Lambda, Degree).


%% e_gEqThan(?Term1, ?Term2, +Comparer, ?Value)              is semidet
%
%     Compares Term1 and Term2 using '~>' ("less general than" /
%     "greater or equal than") fuzzy relation and succeeds only if the
%     resulting approximation degree satisfies the expression
%     "degree Comparer Value" (for example, "degree > 0.5"),
%     where degree must be greater or equal than the lambda cut. 
%     Comparer can be any Prolog arithmetic comparison operator (=:=,
%     =\=, >=, =<, >, <) or the unification operator (in the latter
%     case, Value will be unified with the approximation degree).
%

e_gEqThan(Term1, Term2, Comparer, Value) :-
	e_gEqThan(Term1, Term2, Degree),
	apply(Comparer, [Degree, Value]),
	!.


%% e_lEqThan(?Term1, ?Term2, ?Degree)                         is nondet
%
%     Compares Term1 and Term2 using '<~' ("more general than" /
%     "less or equal than") fuzzy relation and returns the
%     approximation Degree of the result (if it's greater or equal
%     than the lambda-cut).
%

e_lEqThan(Term1, Term2, Degree) :-
	flags:get_bpl_flag(lambda_cut(Lambda)),
	compare_terms(lEqThan, Term1, Term2, Lambda, Degree).


%% e_lEqThan(?Term1, ?Term2, +Comparer, ?Value)              is semidet
%
%     Compares Term1 and Term2 using '<~' ("more general than" /
%     "less or equal than") fuzzy relation and succeeds only if the
%     resulting approximation degree satisfies the expression
%     "degree Comparer Value" (for example, "degree > 0.5"),
%     where degree must be greater or equal than the lambda cut. 
%     Comparer can be any Prolog arithmetic comparison operator (=:=,
%     =\=, >=, =<, >, <) or the unification operator (in the latter
%     case, Value will be unified with the approximation degree).
%

e_lEqThan(Term1, Term2, Comparer, Value) :-
	e_lEqThan(Term1, Term2, Degree),
	apply(Comparer, [Degree, Value]),
	!.


%% compare_terms(+Relation, ?Term1, ?Term2, +Lambda, ?Degree)
%
%     Compares Term1 and Term2 using the specified fuzzy Relation and
%     Lambda-cut value, and returns the approximation Degree in which
%     both terms are similar.
%

compare_terms(Relation, Term1, Term2, _Lambda, Degree) :-
	% Variable-Variable comparison (two variables are related with
	% approximation degree 1 only if they're exactly the same variables
	% and the fuzzy relation is reflexive)
	var(Term1), var(Term2), !,
	Term1 == Term2,
	apply(Relation, [Term1, Term2, Degree]),
	var(Term1), var(Term2).

compare_terms(Relation, Term1, Term2, Lambda, Degree) :-
	% Atomic-Atomic comparison
	atomic(Term1), atomic(Term2), !,
	apply(Relation, [Term1, Term2, Degree]),
	Degree >= Lambda.

compare_terms(Relation, Term1, Term2, Lambda, Degree) :-
	% Compound-Compound comparison
	compound(Term1), compound(Term2), !,
	Term1 =.. [Functor1|Args1],
	Term2 =.. [Functor2|Args2],
	length(Args1, Arity),
	length(Args2, Arity),
	apply(Relation, [Functor1, Functor2, DegreeFunctor]),
	DegreeFunctor >= Lambda,
	compare_args(Args1, Args2, Relation, Lambda, DegreeArgs),
	Degree is min(DegreeFunctor, DegreeArgs).


%% compare_args(?Args1, ?Args2, +Relation, +Lambda, ?Degree)
%
%     Checks if the terms in the lists Args1 and Args2 are similar one
%     with each other using the given fuzzy Relation, and returns the
%     minimum approximation Degree of the results.
%

compare_args([], [], _Relation, _Lambda, 1.0).

compare_args([Arg1|MoreArgs1], [Arg2|MoreArgs2], Relation, Lambda, Degree) :-
	compare_terms(Relation, Arg1, Arg2, Lambda, DegreeArg),
	compare_args(MoreArgs1, MoreArgs2, Relation, Lambda, DegreeMoreArgs),
	Degree is min(DegreeArg, DegreeMoreArgs). % WARNING: a1, a2, a3



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Helper predicates used by TPL programs
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% set_first_not_solution(+AtomGoal, +NewHypoRules)
%   Annotates that a solution for AtomGoal was computed
%   only when it was computed. Do nothing for further
%   alternatives.
%
%  AtomGoal must be an atom: since it is asserted, a cyclic term
%  may raise an exception.
%

set_first_not_solution(NewGoal, NewHypoRules) :-
  flags:get_bpl_flag(first_not_solution(NewGoal, NewHypoRules, no)),
  !,
  flags:remove_bpl_flag(first_not_solution(NewGoal, NewHypoRules, no)),
  flags:add_bpl_flag(first_not_solution(NewGoal, NewHypoRules, yes)).

set_first_not_solution(_NewGoal, _NewHypoRules).


%% clear_eval_negation(+NewGoal, +NewHypoRules)
%
%     Removes the first_not_solution flag for NewGoal and
%     NewHypoRules, and retracts the rules in NewHypoRules.
%

clear_eval_negation(NewGoal, NewHypoRules) :-
  flags:remove_bpl_flag(first_not_solution(NewGoal, NewHypoRules, _)),
  bplShell:retract_rules(NewHypoRules),
  !.



%% over_lambdacut(+Degree)                                   is semidet
%
%     Succeeds if the specified approximation Degree is greater than the
%     current lambda-cut value.
%

over_lambdacut(Degree) :-
	flags:get_bpl_flag(lambda_cut(Lambda)),
	Degree >= Lambda.
	
	
%% degree_composition(+List, -Degree)             is det
%
%     Returns the approximation degree for the sim relation as the 
%     composition of approximation degrees in List.
%

%% degree_composition_aux(+List, -MinDegree)
%
%     Internal predicate used to avoid backtracking.
%
%     @see degree_composition/2
%

degree_composition(List, Degree) :-
	degree_composition_aux(List, Degree), 
	!.

degree_composition_aux([], 1.0).

degree_composition_aux([Number|List], Degree) :-
	number(Number), 
	!,
	degree_composition_aux(List, PartialDegree),
	t_norm_current_op(Number, PartialDegree, Degree).

degree_composition_aux([_NotANumber|List], Degree) :-
	degree_composition_aux(List, Degree).
	

%% t_norm_current_op(+Degree1, +Degree2, -Degree)
%
%     Computes the t-norm of two values when
%     computing the approximation degree for 
%     a resolution step.
%     This internal predicate is used to avoid 
%     backtracking and is updated whenever the t-norm
%     changes by the directive fuzzy_logic.
%
%     @see t_norm/2
%

:- dynamic(t_norm_current_op/3).

t_norm_current_op(D1, D2, D) :-    
  D is min(D1, D2).  

%% t_norm_op(+TNorm, +Degree1, +Degree2, -Degree)
%
%     t-norm binary operator: Given a t-norm and two degrees, 
%     returns the computed result degree
%     This predicate is used for the unification
%     algorithms.
%

t_norm_op(yes, D1, D2, D) :- % 'yes', 'no', 'min' and 'goedel' use min
  D is min(D1, D2).  
t_norm_op(no, D1, D2, D) :-
  D is min(D1, D2).  
t_norm_op(min, D1, D2, D) :-    
  D is min(D1, D2).  
t_norm_op(product, D1, D2, D) :-
  D is D1*D2.  
%  clpq_solve(D1*D2, D).
t_norm_op(luka, D1, D2, D) :-
  D is max(0, D1+D2-1.0).
%  clpq_solve(D1+D2-1.0, DT),
%  D is max(0, DT).
t_norm_op(drastic, D1, D2, D) :-
  (D1==1.0, D=D2, !) ; (D2==1.0, D=D1, !) ; (D=0.0).
t_norm_op(nilpotent, D1, D2, D) :-
  (D1+D2>1.0, D is min(D1, D2), !) ; (D=0.0).
t_norm_op(hamacher, D1, D2, D) :-
  (D1==0.0, D2==0.0, D=0.0, !) ; (D1+D2>0.0, D is D1*D2/(D1+D2-D1*D2)).
%  (D1=0.0, D2=0.0, D=0.0, !) ; (D1+D2>0.0, clpq_solve(D1*D2/(D1+D2-D1*D2), D)).


%% t_norm_op(+Degree1, +Degree2, -Degree)
%
%     t-norm binary operator for the default relation: ~
%     Given a t-norm and two degrees, 
%     returns the computed result degree.
%     This predicate is used for the unification
%     algorithms.
%

t_norm_op(Degree1, Degree2, Degree) :-
  t_norm('~', TNorm),
  t_norm_op(TNorm, Degree1, Degree2, Degree).
  
% Default t_norm (only useful when no program is loaded)
:- flags:default_t_norm('~', TNorm),
   assertz(t_norm('~',TNorm)).


%% ho_call(+HOList, +Compiled, +Body, +ConstraintVariables, +DegreeVars, +DegreeIn, +DegreeOut)
%
%     Makes a higher order call for the predicate in the head of 
%     HOList, with arguments the rest of elements in HOList and 
%     the rest of arguments of ho_call.
%
%     This differentiates the several possibilities due to
%     optimizations, which can be enabled and disabled at will.
%

%% ho_call(+HOList, +Compiled, +Body, +ConstraintVariables, +DegreeVars, -Degree)
%

% Version without degree accumulator optimization and a1
ho_call(HOList, Compiled, Body, DegreeVars, Degree) :-
  append(HOList, [Compiled, Body, DegreeVars, Degree], GoalList),
  Goal =.. GoalList,
  call(Goal).

% Version without degree accumulator optimization and a2/a3
ho_call(HOList, Compiled, Body, ConstraintVariables, DegreeVars, Degree) :-
  flags:get_bpl_flag(weak_unification(a3)),
  !,
  append(HOList, [Compiled, Body, ConstraintVariables, DegreeVars, Degree], GoalList),
  Goal =.. GoalList,
  call(Goal).

% Version with degree accumulator optimization and a1
ho_call(HOList, Compiled, Body, DegreeVars, DegreeIn, DegreeOut) :-
  append(HOList, [Compiled, Body, DegreeVars, DegreeCall], GoalList),
  Goal =.. GoalList,
  call(Goal),
  degree_composition([DegreeIn, DegreeCall], DegreeOut).

% Version with degree accumulator optimization and a2/a3
% Cin and Cout are not needed for the negation call because
% Body already includes them
ho_call(HOList, Compiled, Body, ConstraintVariables, DegreeVars, DegreeIn, DegreeOut) :-
  append(HOList, [Compiled, Body, ConstraintVariables, DegreeVars, DegreeCall], GoalList),
  Goal =.. GoalList,
  call(Goal),
  degree_composition([DegreeIn, DegreeCall], DegreeOut).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Higher order BPL predicates 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Negation: Crisp and weak   %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% eval_negation(+NegType, +Compiled, :Goal, +ConstraintVariables, +DegreeVars, -Degree)
%
%     Executes Goal and returns the approximation Degree of its
%     negation depending on the selected negation type ('not' or '\+').
%     DegreeVars is the list of degree variables that appears in Goal,
%     which is used to compute the approximation Degree of the result.
%
%     If Goal has not been compiled at compile-time, it is now 
%     compiled at run-time.
%

%
% Crisp Negation 
%
% Weak unification algorithm a1
eval_negation(Negation, Compiled, Goal, DegreeVars, Degree) :-
  eval_negation(Negation, Compiled, Goal, _ConstraintVariables, DegreeVars, Degree).


% Crisp unification algorithms a2 and a3
eval_negation(\+, Compiled, Goal, [Cin|_ConstraintVariables], DegreeVars, _Degree) :-
  % Cout of Goal must not be linked to Cout of crisp negation.
  % Thus, a copy term suffices to avoid this
  runtime_compile_goal(Compiled, Goal, NewGoal, [Cin|_GoalConstraintVariables], DegreeVars, NewHypoRules),
  bplShell:assert_rules(NewHypoRules),
  term_to_atom(NewGoal, AtomNewGoal),
  flags:add_bpl_flag(first_not_solution(AtomNewGoal, NewHypoRules, no)),
  % Crisp Negation As Failure
	( call(NewGoal),
    degree_composition(DegreeVars, DegreeGoal),
    DegreeGoal =:= 1,
    clear_eval_negation(NewGoal, NewHypoRules),
    !,
    fail
  ;
    clear_eval_negation(NewGoal, NewHypoRules)
  ).

%
% Weak Negation 
%
eval_negation(not, Compiled, Goal, ConstraintVariables, DegreeVars, Degree) :-
  runtime_compile_goal(Compiled, Goal, NewGoal, ConstraintVariables, DegreeVars, NewHypoRules),
  bplShell:assert_rules(NewHypoRules),
  term_to_atom(NewGoal, AtomNewGoal),
  flags:add_bpl_flag(first_not_solution(AtomNewGoal, NewHypoRules, no)),
  % Weak Negation As Failure
  (
    % Try to get a solution for NewGoal
    call(NewGoal),
    set_first_not_solution(AtomNewGoal, NewHypoRules),
    degree_composition(DegreeVars, DegreeGoal),
    (DegreeGoal =:= 1
     -> fail
     ;  Degree is 1 - DegreeGoal)
    % This branch may leave both the hypothetical rules and flag
    % They must be removed after goal solving
  ;
    % No more solutions for NewGoal
    flags:get_bpl_flag(first_not_solution(AtomNewGoal, NewHypoRules, yes)),
    clear_eval_negation(NewGoal, NewHypoRules),
    !,
    fail
  ;
    % No single solution for NewGoal
    flags:get_bpl_flag(first_not_solution(AtomNewGoal, NewHypoRules, no)),
    clear_eval_negation(NewGoal, NewHypoRules)
  ).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 	Higher-order predicates with signature "name(:Goal)":
%      call/1, once/1, ignore/1, time/1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% bpl_call(+Compiled, :Goal, +ConstraintVariables, +DegreeVars, -Degree)
%
%     Extension of the call/1 predicate for Bousi-Prolog. This
%     predicate just executes its argument under this module if
%     it is either a call to a Prolog predefined predicate
%     or a predicate currently loaded into this module.
%     Otherwise, it is treated as a BPL'll be
%     translated should it was not at compile-time.
%

%% bpl_call(:Goal) is intended for:
%     - test calls
bpl_call(Goal) :-
  bpl_call(no, Goal, _ConstraintVariables, _DegreeVars, _Degree).


%% bpl_call(+Compiled, :Goal, +DegreeVars, -Degree) is intended for:
%     - Weak unification algorithm a1
bpl_call(Compiled, Goal, DegreeVars, Degree) :-
  bpl_call(Compiled, Goal, _ConstraintVariables, DegreeVars, Degree).


bpl_call(yes, Goal, _ConstraintVariables, DegreeVars, Degree) :-
  !,
	% Executes the new goal and computes the approximation degree
	call(Goal),
  degree_composition(DegreeVars, Degree).

bpl_call(no, Goal, [Cin, Cout], DegreeVars, Degree) :-
  runtime_compile_goal(no, Goal, NewGoal, [Cin|ConstraintVariables], DegreeVars, NewHypoRules),
  parser:link_last_variable(ConstraintVariables, Cout),
  % Assert new hypothetical rules
  % They will be discarded at the top-level when quitting solving
  bplShell:assert_rules(NewHypoRules),  
	% Executes the new goal and computes de approximation degree
	call(NewGoal),
  degree_composition(DegreeVars, Degree).


%% Other higher-order predicates with signature "name(:Goal)":
%
%     once/1, ignore/1, time/1
%

% Weak unification algorithms a2 and a3
once(Compiled, Goal, ConstraintVariables, DegreeVars, Degree) :-
  once(bpl_call(Compiled, Goal, ConstraintVariables, DegreeVars, Degree)).

ignore(Compiled, Goal, ConstraintVariables, DegreeVars, Degree) :-
  ignore(bpl_call(Compiled, Goal, ConstraintVariables, DegreeVars, Degree)).

time(Compiled, Goal, ConstraintVariables, DegreeVars, Degree) :-
  time(bpl_call(Compiled, Goal, ConstraintVariables, DegreeVars, Degree)).

% Weak unification algorithm a1
once(Compiled, Goal, DegreeVars, Degree) :-
  once(bpl_call(Compiled, Goal, DegreeVars, Degree)).

ignore(Compiled, Goal, DegreeVars, Degree) :-
  ignore(bpl_call(Compiled, Goal, DegreeVars, Degree)).

time(Compiled, Goal, DegreeVars, Degree) :-
  time(bpl_call(Compiled, Goal, DegreeVars, Degree)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Higher-order predicates with signature "name(:Goal, +List)":
%    apply/2, maplist/2 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% bpl_apply(:Goal, +List)
%
%     Extension of the apply/2 predicate for Bousi-Prolog. This
%     predicate does exactly the same as apply/2, but executes the
%     resulting terms using bpl_call/1 instead of call/1.
%

% Weak unification algorithms a2 and a3
bpl_apply(List, no, Term, ConstraintVariables, DegreeVars, Degree) :-
	Term =.. [Functor|Args],
	append(Args, List, NewArgs),
	Goal =.. [Functor|NewArgs],
  bpl_call(no, Goal, ConstraintVariables, DegreeVars, Degree).


% Weak unification algorithm a1
bpl_apply(List, no, Term, DegreeVars, Degree) :-
	bpl_apply(Term, List, no, Term, _ConstraintVariables, DegreeVars, Degree).


%% bpl_maplist(:Goal, +List)
%
%     Extension of the maplist/2 predicate for Bousi-Prolog. This
%     predicate does exactly the same as maplist/2, but executes the
%     resulting terms using bpl_call/1 instead of call/1.
%

% Weak unification algorithms a2 and a3
bpl_maplist(List, no, Term, Constraints, Degrees, Degree) :-
  bpl_maplist(List, no, Term, Constraints, Degrees, _DegreeIn, Degree).


bpl_maplist([], no, _Term, [Cin, Cin], _Degrees, Degree, Degree).

bpl_maplist([Item|MoreItems], no, Term, [Cin, Cout], Degrees, DegreeIn, DegreeOut) :-
	Term =.. [Functor|Args],
	append(Args, [Item], NewArgs),
	Goal =.. [Functor|NewArgs],
	bpl_call(no, Goal, [Cin|Constraints], _Degrees, CallDegree),
  link_last_variable(Constraints, Cnew),
  degree_composition([DegreeIn, CallDegree], NewDegree),
	bpl_maplist(MoreItems, no, Term, [Cnew, Cout],  Degrees, NewDegree, DegreeOut).


% Weak unification algorithm a1
bpl_maplist(List, no, Term, DegreeVars, Degree) :-
  bpl_maplist(List, no, Term, _ConstraintVariables, DegreeVars, Degree).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Higher-order predicates with signature "name(:Goal, :Goal)":
%    forall/2 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% forall(+Compiled, :Goal, ?ConstraintVariables, ?DegreeVars, ?Degree)
%     Crisp predicate because it applies a failure-driven loop, thus
%     the output degree is not used, but input degrees and constraints are
%     used to solve Goal. 

% Weak unification algorithms a2 and a3
forall(Compiled, (Goal1, Goal2), ConstraintVariables, DegreeVars, 1.0) :-
  !,
  forall(bpl_call(Compiled, Goal1, ConstraintVariables, DegreeVars, _Degree1), 
         bpl_call(Compiled, Goal2, ConstraintVariables, DegreeVars, _Degree2)),
  ConstraintVariables = [Cin, Cin].

% Weak unification algorithm a1
forall(Compiled, (Goal1, Goal2), DegreeVars, 1.0) :-
  !,
  forall(bpl_call(Compiled, Goal1, DegreeVars, _Degree1), 
         bpl_call(Compiled, Goal2, DegreeVars, _Degree2)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Higher-order predicates with signature "name(:Goal, +Catcher, :Recover)":
%    catch/3 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% catch(+Catcher, +Compiled, :Goal, ?DegreeVars, ?Degree)
%     

% Weak unification algorithms a2 and a3
catch(Catcher, Compiled, (Goal1; Goal2), ConstraintVariables, DegreeVars, Degree) :-
  !,
  catch(bpl_call(Compiled, Goal1, ConstraintVariables, DegreeVars, Degree),
        Catcher,
        bpl_call(Compiled, Goal2, ConstraintVariables, DegreeVars, Degree)).

% Weak unification algorithm a1
catch(Catcher, Compiled, (Goal1; Goal2), DegreeVars, Degree) :-
  catch(Catcher, Compiled, (Goal1; Goal2), _ConstraintVariables, DegreeVars, Degree).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Higher-order predicates with signature "name(+Template, :Goal, -Bag)":
%    findall/3, bagof/3, setof/3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% findall(+Template, +Bag, +Compiled, :Goal, +ConstraintVariables, +DegreeVars, -Degree)
%
%     Crisp predicate because it applies a failure-driven loop
%     The last two arguments are not used and simply
%     differentiates 'findall' from the built-in Prolog
%     predicate findall/3. 
%

% Weak unification algorithms a2 and a3
findall(Template, Bag, Compiled, Goal, ConstraintVariables, DegreeVars, Degree) :-
  !,
  findall(Template, bpl_call(Compiled, Goal, ConstraintVariables, DegreeVars, Degree), Bag).


% Weak unification algorithm a1
findall(Template, Bag, Compiled, Goal, DegreeVars, Degree) :-
  !,
  findall(Template, bpl_call(Compiled, Goal, DegreeVars, Degree), Bag).


%% bagof(+Template, +Bag, +Bindings, +Compiled, +Goal, +ConstraintVariables, +DegreeVars, -Degree)
%     Crisp predicate because it applies a failure-driven loop
%     The last two arguments are not used and simply
%     differentiates 'findall' from the built-in Prolog
%     predicate findall/3.
%

% Weak unification algorithms a2 and a3
bagof(Template, Bag, Bindings, Compiled, Goal, ConstraintVariables, DegreeVars, Degree) :-
  bag_set_of(bagof, Template, Bag, Bindings, Compiled, Goal, ConstraintVariables, DegreeVars, Degree).

% Weak unification algorithm a1
bagof(Template, Bag, Bindings, Compiled, Goal, DegreeVars, Degree) :-
  bag_set_of(bagof, Template, Bag, Bindings, Compiled, Goal, DegreeVars, Degree).


%% setof(+Template, +Bag, +Compiled, +Goal, +ConstraintVariables, +DegreeVars, -Degree)
%     Crisp predicate because it applies a failure-driven loop
%     The last two arguments are not used and simply
%     differentiates 'findall' from the built-in Prolog
%     predicate findall/3. 

% Weak unification algorithms a2 and a3
setof(Template, Bag, Bindings, Compiled, Goal, ConstraintVariables, DegreeVars, Degree) :-
  bag_set_of(setof, Template, Bag, Bindings, Compiled, Goal, ConstraintVariables, DegreeVars, Degree).

% Weak unification algorithm a1
setof(Template, Bag, Bindings, Compiled, Goal, DegreeVars, Degree) :-
  bag_set_of(setof, Template, Bag, Bindings, Compiled, Goal, DegreeVars, Degree).

%% bag_set_of(+BagSetOf, +Template, +Bag, +Compiled, +Goal, +ConstraintVariables, +DegreeVars, -Degree)
%     Predicate used by both bagof/6 and setof/6

% Weak unification algorithms a2 and a3

% This clause is for a compiled bagof/setof call
bag_set_of(BagSetOf, Template, Bag, Bindings, yes, Goal, ConstraintVariables, DegreeVars, Degree) :-
  !,
  append([Degree|DegreeVars], Bindings, AllBindings),
  parser:bind_term(AllBindings, bpl_call(yes, Goal, ConstraintVariables, DegreeVars, Degree), NewGoal),
  Call =.. [BagSetOf, Template, NewGoal, Bag],
  call(Call).

% This clause is for a bagof/setof call which needs compilation at run-time
bag_set_of(BagSetOf, Template, Bag, Bindings, no, Goal, ConstraintVariables, _DegreeVars, _Degree) :-
  !,
  % Compiles the goal
  runtime_compile_goal(no, Goal, NewGoal1, ConstraintVariables, _DegreeVars1, NewHypoRules),
  % Adds existential quantifiers
  term_variables(Goal, GoalVars),
  term_variables(NewGoal1, NewGoalVars),
  utilities:var_subtract(NewGoalVars, GoalVars, CtrDegBindings),
  append(CtrDegBindings, Bindings, NewBindings),
  parser:bind_term(NewBindings, NewGoal1, NewGoal),
  % Assert possible new hypothetical rules due to goal compilation
  bplShell:assert_rules(NewHypoRules),  
  Call =.. [BagSetOf, Template, NewGoal, Bag],
	% Executes the new goal, catching its possible exception
	catch(Call, Exception, true),
	% Retracts asserted hypothetical rules
	% It is safe to do this here because there are no pending
	% alternatives to either bagof or setof
  bplShell:retract_rules(NewHypoRules),
  % Raises the exception, if any
  (nonvar(Exception)
   -> throw(Exception)
   ;  true).

% Weak unification algorithm a1

% This clause is for a compiled bagof/setof call
bag_set_of(BagSetOf, Template, Bag, Bindings, yes, Goal, DegreeVars, Degree) :-
  !,
  append([Degree|DegreeVars], Bindings, AllBindings),
  parser:bind_term(AllBindings, bpl_call(yes, Goal, DegreeVars, Degree), NewGoal),
  Call =.. [BagSetOf, Template, NewGoal, Bag],
  call(Call).

% This clause is for a bagof/setof call which needs compilation at run-time
bag_set_of(BagSetOf, Template, Bag, Bindings, no, Goal, _DegreeVars, _Degree) :-
  !,
  % Compiles the goal
  runtime_compile_goal(no, Goal, NewGoal1, _DegreeVars1, NewHypoRules),
  % Adds existential quantifiers
  term_variables(Goal, GoalVars),
  term_variables(NewGoal1, NewGoalVars),
  utilities:var_subtract(NewGoalVars, GoalVars, CtrDegBindings),
  append(CtrDegBindings, Bindings, NewBindings),
  parser:bind_term(NewBindings, NewGoal1, NewGoal),
  % Assert possible new hypothetical rules due to goal compilation
  bplShell:assert_rules(NewHypoRules),  
  Call =.. [BagSetOf, Template, NewGoal, Bag],
	% Executes the new goal, catching its possible exception
	catch(Call, Exception, true),
	% Retracts asserted hypothetical rules
	% It is safe to do this here because there are no pending
	% alternatives to either bagof or setof
  bplShell:retract_rules(NewHypoRules),
  % Raises the exception, if any
  (nonvar(Exception)
   -> throw(Exception)
   ;  true).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Higher-order predicates with signature "name(+Rule)":
%    assert/1, retract
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% bpl_retract(+Rule) 
%
%     Version of retract/1 predicate for Bousi-Prolog. 
%     Under indexing optimization, the body of
%     a fact can become simply true and retracting it must be
%     specifically handled via weak unification. For example,
%     p(a) -> p(a, Cin, Cout, DegIn, DegOut).
%     retract(p(X)) -> 
%       retract((p(Y, Cin, Cout, DegIn, DegOut) :-
%                  unify_arguments_a3([[Y, X, Cin, C, D0]]),
%                  degree_composition([DegIn, D1], DegOut)))


bpl_retract((Head :- Body)) :-
  flags:get_bpl_flag(indexing(true)),
  clause(Head, true),
  Body,
  retract(Head).
    
bpl_retract(Clause) :-
  retract(Clause).


%% retract(+Compiled, ?Rules) 

retract(yes, Rules) :-
  !,
  findall(_, (member([Rule|_], Rules), retract(Rule)), _).

retract(no, [Rule]) :-
  parser:translate_rule(Rule, [0, 0], RuleRules),
  evaluator:get_sim_equations(Equations),
	build_block_equations(Equations, BlockEquations),
  assert(translator:equations(Equations)),
  assert(translator:block_equations(BlockEquations)),
  translator:retract_translator_scanner(retract(yes, RuleRules), Retracts, _, _),
  !,
  retractall(translator:equations(Equations)),
  retractall(translator:block_equations(BlockEquations)),
  call(Retracts).


%% assert(+Compiled, ?Rules) 

assert(yes, Rules) :-
  !,
  findall(_, (member([Rule|_], Rules), assert(Rule)), _).

assert(no, [Rule]) :-
  parser:translate_rule(Rule, [0, 0], RuleRules),
  evaluator:get_sim_equations(Equations),
	build_block_equations(Equations, BlockEquations),
  assert(translator:equations(Equations)),
  assert(translator:block_equations(BlockEquations)),
  translator:assert_translator_scanner(assert(yes, RuleRules), Asserts, _, _),
  retractall(translator:equations(Equations)),
  retractall(translator:block_equations(BlockEquations)),
  call(Asserts),
  !.


  
%% truth_degree(-Degree, +Compiled, :Goal, +ConstraintVariables, +DegreeVars, -MetaCallDegree)
%
%     Returns in Degree the approximation degree of Goal for all its solutions.
%     If the goal fails, the returned Degree is 0.0.
%     The approximation degree MetaCallDegree of this metacall is always 1.0
%

% Weak unification algorithms a2 and a3
truth_degree(Degree, Compiled, Goal, ConstraintVariables, DegreeVars, 1.0)  :-
  bpl_call(Compiled, Goal, ConstraintVariables, DegreeVars, Degree).

truth_degree(0.0, Compiled, Goal, ConstraintVariables, DegreeVars, 1.0)  :-
  \+ bpl_call(Compiled, Goal, ConstraintVariables, DegreeVars, _Degree),
  ConstraintVariables = [Cin, Cin],
  (flags:get_bpl_flag(degree_accumulator(true))
   -> DegreeVars = [Din|_],
      link_last_variable(DegreeVars, Din)
   ;  true).

% Weak unification algorithm a1
truth_degree(Degree, Compiled, Goal, DegreeVars, 1.0)  :-
  bpl_call(Compiled, Goal, DegreeVars, Degree).

truth_degree(Degree, Compiled, Goal, DegreeVars, 1.0)  :-
  \+ bpl_call(Compiled, Goal, DegreeVars, Degree).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% get_actual_predicate_definition(+InternalPredicate, -ActualPredicate)
%
%     Converts a TPL predicate definition into its original BPL predicate
%     definition, which doesn't include the "evaluator" module nor the
%     program prefix and has a smaller arity. If the predicate definition
%     isn't recognised as a TPL predicate, it'll be returned as is.
%

get_actual_predicate_definition(InternalPredicate, ActualPred/ActualArity) :-
	% Removes the "evaluator" module (if it's present), the program
	% prefix and decreases the arity; for example, if the currently
	% loaded program is "file.bpl", given "evaluator:file_procedure/3",
	% this predicate will return "procedure/2"
	(
		InternalPredicate = evaluator:Pred/Arity
	;
		InternalPredicate = Pred/Arity
	),
	flags:get_bpl_flag(program_prefix(Prefix)),
	atom_length(Prefix, PrefixLength),
	FullPrefixLength is PrefixLength + 1,
	sub_atom(Pred, 0, PrefixLength, _, Prefix),
	sub_atom(Pred, FullPrefixLength, _, 0, ActualPredAux),
	translator:actual_rule_arity(Arity, ActualArityAux),
	(
		% Sometimes, undefined BPL predicates are translated twice; in
		% that cases, here we remove the program prefix and decrease
		% the arity again
    atom_concat(Prefix, '_', PrefixUnderscore),
		sub_atom(ActualPredAux, 0, FullPrefixLength, _, PrefixUnderscore),
		sub_atom(ActualPredAux, FullPrefixLength, _, 0, ActualPred),
		translator:actual_rule_arity(ActualArityAux, ActualArity)
	;
		ActualPred = ActualPredAux,
		ActualArity = ActualArityAux
	),
	!.

get_actual_predicate_definition(evaluator:Pred/Arity, Pred/Arity) :-
	% Just removes the "evaluator" module from the predicate definition
	!.

get_actual_predicate_definition(Predicate, Predicate).
	% Returns the input predicate definition


%% runtime_compile_goal(+Compiled, :Goal, -NewGoal, ?ConstraintBlockVars, +DegreeVars, -NewHypoRules)
%
%    Compiles Goal to NewGoal if Compiled is 'no', returning new 
%    hypothetical rules, if any, due to assumptions. Otherwise, 
%    return the same goal and an empty list of rules. 
%
runtime_compile_goal(no, Goal, NewGoal, ConstraintBlockVars, DegreeVars, NewHypoRules) :-
  % Build the corresponding query, with prefix, degree and constraint variables
  parser:build_goal(Goal, [NewGoal, ConstraintBlockVars, DegreeVars], HypoRules),
  !,
	flags:get_bpl_flag(program_prefix(ProgramPrefix)),
	evaluator:get_sim_equations(Equations),
  build_block_equations(Equations, BlockEquations),
	translator:expand_rules(HypoRules, ExpandedHypoRules, ProgramPrefix, Equations, BlockEquations),
	translator:parsed_term_to_term(ExpandedHypoRules, NewHypoRules, _Bindings).

% Invalid goal. Evaluation should take care of error
runtime_compile_goal(no, Goal, Goal, _ConstraintBlockVars, _DegreeVars, []).

runtime_compile_goal(yes, Goal, Goal, _ConstraintBlockVars, _DegreeVars, []).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynamic predicates loaded from TPL files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% sim(?Sym1, ?Sym2, ?Degree)                                is dynamic
%
%     Dynamic predicate which stores the proximity or similarity
%     equations defined in the current Bousi-Prolog program.
%

:- dynamic sim/3.


%% sim(?Sym1, ?Sym2, ?Block, ?Degree)                       is dynamic
%
%     Dynamic predicate which stores the proximity or similarity
%     equations defined in the current Bousi-Prolog program and
%     labelled with its block.
%

:- dynamic sim/4.


%% lEqThan(?Sym1, ?Sym2, ?Degree)                            is dynamic
%
%     Dynamic predicate which stores the "more general than" ("less or
%     equal than") equations defined in the current Bousi-Program
%     program.
%

:- dynamic lEqThan/3.


%% gEqThan(?Sym1, ?Sym2, ?Degree)                            is dynamic
%
%     Dynamic predicate which stores the "less general than" ("greater
%     or equal than") equations defined in the current Bousi-Program
%     program.
%

:- dynamic gEqThan/3.


%% frel1(?Sym1, ?Sym2, ?Degree)                              is dynamic
%
%     Dynamic predicate which stores the '~1~' fuzzy binary equations
%     defined in the current Bousi-Prolog program.
%

:- dynamic frel1/3.


%% frel2(?Sym1, ?Sym2, ?Degree)                              is dynamic
%
%     Dynamic predicate which stores the '~2~' fuzzy binary equations
%     defined in the current Bousi-Prolog program.
%

:- dynamic frel2/3.


%% frel3(?Sym1, ?Sym2, ?Degree)                              is dynamic
%
%     Dynamic predicate which stores the '~3~' fuzzy binary equations
%     defined in the current Bousi-Prolog program.
%

:- dynamic frel3/3.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Other dynamic predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% current_file(?File)                                       is dynamic
%
%     Dynamic predicate which contains the name of the last TPL file
%     loaded with load_tpl/1.
%
%     @see load_tpl/1
%

:- dynamic current_file/1.

current_file('').



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hypothetical reasoning predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% chk(+D1, +D2)
%
% Check if the database D1 is visible in D2.
%
chk(D1, D2) :-
  append(_, D1, D2),
  !.


%% applicable(+RuleId, +SharedVs, +DC)
%
%     Checks whether the rule identified by RuleId is applicable in the 
%     context DC, i.e., the rule has been registered in the current or 
%     a parent context.
%
applicable(RuleId, SharedVs, DC) :-
  reg(RuleId, SharedVs, RC),
  chk(RC, DC).


% '=>'(+IdsVs, :Goal, -DI, ?DC)
%
%     Solving the embedded implication.
%
'=>'(IdsVs, Goal, DI, DC) :-
  get_di(DI),
  register_rules(IdsVs, DI, DC),
  Goal.

%% register_rules(+IdsVs, +DI, +DC)
%
%     Registers the rules IdsVs in the database with identifier DI
%     and the context DC. The rule identifiers are stored in the 
%     dynamic predicate reg/3.
%
register_rules([], _DI, _DC).
register_rules([IdVs|IdsVs], DI, DC) :-
  register_rule(IdVs, DI, DC),
  register_rules(IdsVs, DI, DC).

register_rule(RuleId-SharedVs, DI, DC) :-
  assertz(reg(RuleId, SharedVs, [DI|DC])).

get_di(DI) :-
  retract(di(DI)),
  DI1 is DI+1,
  assertz(di(DI1)),
  !.
  
reset_di :-
  retractall(di(_)),
  assertz(di(0)),
  !.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Dynamic predicates for hypothetical reasoning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% reg(RuleId, SharedVs, DC)                             is dynamic
%
%     Dynamic predicate which stores the rules registered in the
%     current Bousi-Prolog program. The rules are identified by
%     RuleId and the shared variables are stored in SharedVs.
%     The context identifier is stored in DC.
%

:- dynamic reg/3.


%% di(DI)                                                is dynamic
%
% Identifier for next database context identifier
%

:- dynamic di/1. 
