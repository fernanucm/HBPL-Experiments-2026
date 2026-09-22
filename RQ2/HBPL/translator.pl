%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bousi-Prolog to Prolog (TPL) translator

:- module(translator, [
		translate_program/4,    % +InputProgram, +InputOntology,
		                        %  +OutputFile, +StateFile
		translate_query/5       % +String, -Query, -NewHypoRules, -Bindings,
		                        % -Degree
   ]).

:- use_module(parser).
:- use_module(evaluator).
:- use_module(flags).
:- use_module(utilities).

:- use_module(library(lists)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- set_prolog_flag(double_quotes, codes).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translation of Bousi-Prolog files
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% translate_program(+InputProgram, +InputOntology, +OutputFile, +StateFile)
%
%     Reads a Bousi-Prolog program together with a Bousi-Prolog
%     ontology, performs a lexical, syntactic and semantic analysis,
%     and generates an intermediate TPL file that can directly be
%     loaded into Prolog. InputOntology can be '' (an empty string) if
%     no ontology is needed. Current flags are saved in StateFile.
%
%     If the compilation of the program or the ontology causes an
%     error, this predicate will fail and won't generate anything.
%

translate_program(InputProgram, InputOntology, OutputFile, StateFile) :-
	% Parses the specified program and ontology files and gets all the
	% directives, rules and equations that are defined in them
	parser:parse_program(InputProgram, InputOntology, Directives, Rules,
	                     Equations, LingTerms, Messages),
	!,
	% Builds a list with the text of the messages returned by parser
	Template = [_File, _Line, _Column, Text, _Type],
	findall(Text, member(Template, Messages), TextMessages),
	% Checks if parser generated any error
	(member([_, _, _, _, error], Messages) ->
		% Shows errors and warnings and then stops translation
		forall(member(Message, TextMessages), (write(Message), nl)),
		fail
	;
		% Warnings aren't shown here because they'll be shown when
		% loading the TPL file
		true
	),
	% Builds the list of t-norms for the different relations
	build_t_norms(Directives,TNorms),
	% Adds the linguistic terms to the list of fuzzy subsets found in
	% source code
	add_linguistic_terms(LingTerms, AddedSubsets),
	% Computes the closure of each fuzzy relation 
	expand_equations([sim, gEqThan, lEqThan, frel1, frel2, frel3],
	                 Equations, ExpEquations1),
	% Converts the fuzzy sets into a list of equations of the binary fuzzy relation	sim
	translate_fuzzy_sets([], ExpEquations2),
	append(ExpEquations1, ExpEquations2, UnsortedExpEquations),
	sort(UnsortedExpEquations, ExpEquations),
	build_block_equations(ExpEquations, ExpBlockEquations),
	% Expands the list of rules using the proximity/similarity relation
	utilities:simplify_filename(InputProgram, ProgramPrefix),
	expand_rules(Rules, ExpRules, ProgramPrefix, ExpEquations, ExpBlockEquations),
	build_fuzzy_builtins_rules(Directives, BuiltIns),
	% Writes TPL code to output file
	telling(CurrentOutput),
	tell(OutputFile),
	writeq((:- style_check([-singleton, -discontiguous]))), write('.'), nl,
	writeq((:- abolish(t_norm/2))), write('.'), nl,
	(Messages == [] ->
		true
	;
		% Writes warnings in TPL file to show them each time the file is loaded
		create_writes(TextMessages, Writes),
		writeq((:- initialization(Writes))), write('.'), nl
	),
	utilities:write_lines(Directives, '', '.'), nl,
	utilities:write_lines(TNorms, '', '.'), nl,
	(AddedSubsets == [] ->
		true
	;
		% Adds new fuzzy_set/2 directives to define the linguistic terms
		% built with the '#' operator found in the BPL code
		write_fuzzy_set_directives(AddedSubsets)
	),
	(flags:get_bpl_flag(weak_unification('a3'))
	 ->
	  nl, writeln('sim(X,Y,D) :- sim(X,Y,_B,D).'), nl, nl,
	  utilities:write_non_sim_equations(ExpEquations), nl,
	  utilities:writeq_lines(ExpBlockEquations, '', '.'), nl
	;
  	  nl, utilities:writeq_lines(ExpEquations, '', '.'), nl
	),
	nl,
	utilities:write_lines(ExpRules, '', '.'), nl,
	write_fuzzy_builtins(BuiltIns),
	told,
	tell(CurrentOutput),
	tell(StateFile),
	current_bpl_flags(Flags),
	writef('%w.\n%w.\n', [':- multifile tpl_flags/1', tpl_flags(Flags)]),
	told.


%% build_t_norms(+Directives,-TNorms)
%
%     Returns the list of terms t_norm(Relation,TNorm)
%     representing the t-norm for each Relation.
%     If no directive is available for a given relation,
%     its default t-norm is used instead.
%     These terms are added to the tpl program, so that
%     they define the predicate t_norm/2.
%

build_t_norms(Directives,TNorms) :-
  findall(t_norm(Relation,Type),
            (member((':-'(fuzzy_rel(Relation,Properties))), Directives),
             member(transitive(Type),Properties)
            ;
             member((':-'(directive(transitivity,[Type]))), Directives)
            ),
          FTNorms
          ),
  (member(t_norm('~',_Type),FTNorms) -> % '~' must be present in any BPL-program
     TNorms=FTNorms
   ;
     flags:default_t_norm('~',Type),
     TNorms=[t_norm('~',Type)|FTNorms]
  ).
  

%% create_writes(+Messages, -Writes)
%
%     Builds a conjunction of write/1 and nl/0 predicates that can be
%     later used to show the specified list of Messages.
%

create_writes([], true).

create_writes([Message|MoreMessages], Writes) :-
	SingleWrite = (write(Message), nl),
	create_writes(MoreMessages, MoreWrites),
	(MoreWrites == true ->
		Writes = SingleWrite
	;
		Writes = (SingleWrite, MoreWrites)
	).


%% write_fuzzy_set_directives(+Subsets)
%
%     Writes a directive ':- directive(fuzzy_set, Item).' in current
%     output stream for each Item in Subsets list.
%

write_fuzzy_set_directives([]).

write_fuzzy_set_directives([Subset|MoreSubsets]) :-
	writeq((:- directive(fuzzy_set, Subset))), write('.'), nl,
	write_fuzzy_set_directives(MoreSubsets).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translation of Bousi-Prolog queries
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% translate_query(+String, -Query, -NewHypoRules, -Bindings, -Degree)
%
%     Reads the query contained in String, performs a lexical,
%     syntactic and semantic analysis, and returns the following:
%
%      * A term that can be used to execute the query.
%      * A list of new rules due to assumptions in embedded implications.
%      * A list with the variable bindings (bindings of variables
%        starting with an underscore character are not returned).
%      * The variable in which the approximation degree of the query
%        will be stored after launching it.
%
%     If the query contains assumptions, they are returned in 
%     NewHypoRules.
%
%     If the translation of the query causes an error, this predicate
%     will fail.
%

translate_query(String, Query, NewHypoRules, Bindings, Degree) :-
	% Parses the specified query to get an executable term
	flags:get_bpl_flag(program_prefix(ProgramPrefix)),
	parser:parse_query(ProgramPrefix, String, ParsedQuery, ParsedHypoRules, LingTerms, Messages),
	% Builds a list with the text of the error messages returned by parser
	Template = [_File, _Line, _Column, Text, error],
	findall(Text, member(Template, Messages), TextMessages),
	% Checks if parser generated any error
	(TextMessages \== [] ->
		% Shows errors and then stops translation
		forall(member(Message, TextMessages), (write(Message), nl)),
		fail
	;
		true
	),
	% Adds the linguistic terms found in the query to the current
	% list of fuzzy subsets
	add_linguistic_terms(LingTerms, AddedSubsets),
	(AddedSubsets == [] ->
		% All of the subsets were already on the list, no further
		% translation is needed
		true
	;
		% New subsets were found, so new proximity/similarity equations
		% must be computed and asserted into the SWI-Prolog database
		translate_fuzzy_sets(AddedSubsets, Equations),
%		evaluator:add_sim_equations(Equations)
		evaluator:update_sim_equations(Equations, Updated),
		bplShell:reload_on_extra_equations(Equations, Updated)
	),
	% Translates assert/1 and retract/1 predicates
	evaluator:get_sim_equations(ExpEquations),
	build_block_equations(ExpEquations, ExpBlockEquations),
	translate_asserts_retracts(ParsedQuery, ParsedQueryAux, ProgramPrefix, ExpEquations, ExpBlockEquations),
	% Converts the executable term into a string and then reads it
	% to get the list of variable bindings
	parsed_term_to_term(ParsedQueryAux, QueryTerm, AllBindings),
	% Removes bindings of unimportant variables (those starting with '_')
	findall((VarName = Var),
	        (member((VarName = Var), AllBindings), atom_chars(VarName, ['_'|_Chars])),
	        UnimportantBindings),
	subtract(AllBindings, UnimportantBindings, Bindings),
	% Adds the computation of the approximation degree to the query
	QueryTerm = [RealQuery, _BlockConstraintsVars, DegreeVars],
	Query = (RealQuery, degree_composition(DegreeVars, Degree)),
	% Expand hypothetical rules added in the query
	expand_rules(ParsedHypoRules, HypoRules, ProgramPrefix, ExpEquations, ExpBlockEquations),
	parsed_term_to_term(HypoRules, NewHypoRules, _Bindings).


% parsed_term_to_term(+ParsedTerm, -Term, -Bindings)
parsed_term_to_term(ParsedTerm, Term, Bindings) :-
	swritef(TermString, '%w.', [ParsedTerm]),
	catch((
		atom_to_term(TermString, Term, Bindings)
	% (catcher)
	), _Exception, (
		fail
	)).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Expansion of rules
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% expand_rules(+Rules, -ExpandedRules, +ProgramPrefix, +Equations, +BlockEquations)
%
%     Scans a list of Rules returned by Bousi-Prolog parser and, for
%     each symbol that is similar to each clause's head (attending to
%     BlockEquations list), builds a translated clause and stores it 
%     in the ExpandedRules list. Rules that aren't clauses are copied
%     as is in the output list.
%
%     For example, given ProgramPrefix = 'prog', the same rule as in
%     the example of the 'parser' module, [(prog_a(X, DG) :-
%     prog_b(X, D1), prog_c(D2), true), [D1, D2]], and the equations
%     [sim(a, p, 0.5), sim(X, X, 1)], this predicate will return the
%     following set of rules:
%
%      * prog_a(A1, DG) :- unify_arguments_a1[[A1, X, DA1]]),
%                          prog_b(X, D1), prog_c(D2), true,
%                          min_degree([D1, D2, DA1], DG).
%      * prog_p(A1, DG) :- over_lambdacut(0.5),
%                          unify_arguments_a1[[A1, X, DA1]]),
%                          prog_b(X, D1), prog_c(D2), true,
%                          min_degree([D1, D2, DA1, 0.5], DG).
%
%     @see expand_rule/12
%

expand_rules([], [], _ProgramPrefix, _Equations, _BlockEquations).

expand_rules([[Rule, RuleWeight, HeadConstraintBlockVars, BodyConstraintBlockVars, HeadDegreeVars, BodyDegreeVars, HypoData]|MoreRules], ExpandedRules, ProgramPrefix, Equations, BlockEquations) :-
	(Rule = (Head :- Body)
	 ->
		% Removes the program prefix from the rule's head
		functor(Head, FunctorWithPrefix, _Arity),
		atom_chars(ProgramPrefix, PrefixChars),
		atom_chars(FunctorWithPrefix, FunctorWithPrefixChars),
		append(PrefixChars, ['_'], PrefixChars2),
		append(PrefixChars2, FunctorChars, FunctorWithPrefixChars),
		atom_chars(Functor, FunctorChars),
		% Translates the assert/1 and retract/1 predicates of the rule's body
		(Body \== true ->
			translate_asserts_retracts(Body, NewBody, ProgramPrefix, Equations, BlockEquations)
		;
			NewBody = true
		),
		% Extracts all the symbols that are similar to this rule's head
		similar_symbols(Functor, Equations, BlockEquations, List),
		% Expands this rule using the resulting list
		expand_rule([[Functor, _Block, 1.0]|List], Functor, (Head :- NewBody), RuleWeight, HeadConstraintBlockVars, BodyConstraintBlockVars, HeadDegreeVars, BodyDegreeVars, HypoData, ProgramPrefix, Equations, ExpandedRules1)
	;
		% Rules that aren't clauses don't need expansion
		% (note that facts must have 'true' as their body)
		ExpandedRules1 = [Rule]
	),
	% Expands the remaining rules
	expand_rules(MoreRules, ExpandedRules2, ProgramPrefix, Equations, BlockEquations),
	append(ExpandedRules1, ExpandedRules2, ExpandedRules).


%% similar_symbols(+Functor, +Equations, +BlockEquations, -List)
%
%     Returns a list of a 3-element list of:
%     a symbol similar to Functor, its block and approximation degree.
%	 This is used in expand_rule/10 to expand a rule for each similar symbol.
%
similar_symbols(Functor, _Equations, BlockEquations, List) :-
	flags:get_bpl_flag(weak_unification('a3')),
	!,
    findall([Sim, Block, Degree], member(sim(Functor, Sim, Block, Degree), BlockEquations), List).
	
similar_symbols(Functor, Equations, _BlockEquations, List) :-
    findall([Sim, _Block, Degree], member(sim(Functor, Sim, Degree), Equations), List).


%% expand_rule(+SimBlockDegrees, +Functor, +Clause, +RuleWeight, +HeadConstraintBlockVars, +BodyConstraintBlockVars, +HeadDegreeVars, +BodyDegreeVars, +HypoData, +ProgramPrefix, +Equations, -ExpandedClauses)
%
%     Expands a single Clause for a predicate with a functor name Functor.
%     SimBlockDegrees must be the list consisting of lists with three items:
%     a symbol, a block and an approximation degree.
%     This predicate returns a list of expanded clauses by traversing the
%     list of similar symbols and building new clauses for each of them.
%
%     @see expand_rules/4
%
expand_rule([], _Functor, _Clause, _RuleWeight, _HeadConstraintBlockVars, _BodyConstraintBlockVars, _HeadDegreeVars, _BodyDegreeVars, _HypoData, _ProgramPrefix, _Equations, []).

expand_rule([[Symbol, Block, Degree]|MoreSimBlockDegrees], Functor, Clause, RuleWeight, HeadConstraintBlockVars, BodyConstraintBlockVars, HeadDegreeVars, BodyDegreeVars, hypo(HypoSharedVs, HypoNewSharedVs, RI, RD, CD), ProgramPrefix, Equations, [ExpClause|MoreExpClauses]) :-
%   flags:get_bpl_flag(degree_accumulator(false)),
%   !,
	Clause = (Head :- Body),
	% Create a copy for the next call to expand_rule
	copy_term([Clause, RuleWeight, HeadConstraintBlockVars, BodyConstraintBlockVars, HeadDegreeVars, BodyDegreeVars],
	          [CClause, CRuleWeight, CHeadConstraintBlockVars, CBodyConstraintBlockVars, CHeadDegreeVars, CBodyDegreeVars]),
	% Creates the lists of variables and approximation degrees that
	% will be used in the weak unifications of each rule's argument
	Head =.. [_HeadFunctor|HeadArgsWithCtrsAndDegree],
	length(HeadArgsWithCtrsAndDegree, ExtendedRuleArity),
    actual_rule_arity(ExtendedRuleArity, RuleArity),
	length(HeadArgs, RuleArity),
	append(HeadArgs, CtrsAndDegreeVar, HeadArgsWithCtrsAndDegree),
	(flags:get_bpl_flag(degree_accumulator(false))
	 -> 
      append(_HeadCtrs,[OldHeadDegreeVar],CtrsAndDegreeVar),
      ((nonvar(OldHeadDegreeVar), Degree<1)
       ->
        true %var(HeadDegreeVar) % Degree is already fixed: use a fresh var for the new degree of the similar predicate (Degree<1)
       ;
        HeadDegreeVar = OldHeadDegreeVar)
     ;
      HeadDegreeVars = [HeadDegreeVar, HeadOutDegreeVar],
      append(_HeadCtrs, HeadDegreeVars, CtrsAndDegreeVar) ),
	  extract_unification_problems(HeadArgs, Equations, NewHeadArgs, Cuin1, Cuout, NormalUnifDegrees, NormalUnificationProblems),
	  (flags:get_bpl_flag(hypothetical(true))
	   % Weak unification on shared variables are not really needed
	   %   as I thought for fixing the error in Example 4 (HPPL PROLE). The error 
	   %   came from not applying correctly the indexing optimizaci�n (TBD)
%    -> create_unification_problems(HypoNewSharedVs, HypoSharedVs, Cuin, Cuin1, HypoUnifDegrees, HypoUnificationProblems),
%       append(HypoUnificationProblems, NormalUnificationProblems, UnificationProblems),
%       append(HypoUnifDegrees, NormalUnifDegrees, UnifDegrees)
   -> HypoNewSharedVs = HypoSharedVs, 
      Cuin = Cuin1, 
      HypoUnifDegrees = [], 
      HypoUnificationProblems = [],
      append(HypoUnificationProblems, NormalUnificationProblems, UnificationProblems),
      append(HypoUnifDegrees, NormalUnifDegrees, UnifDegrees)
   ;  Cuin1 = Cuin,
      UnificationProblems = NormalUnificationProblems,
      UnifDegrees = NormalUnifDegrees ),
	% Links head and body block constraints variables through the 
	% unification problems
	link_rule_block_constraint_variables(HeadConstraintBlockVars, Cpin, Cpout, Cuin, Cuout, BodyConstraintBlockVars),
	% Links head degree variables with body variables
	link_rule_degree_variables(HeadDegreeVars, BodyDegreeVars, DegreeCompVar),
	% Builds the new rule's head with the symbol that is similar to the
	% original functor and the variables of the HeadVars list
	append(NewHeadArgs, CtrsAndDegreeVar, NewHeadArgsWithCtrsAndDegree),
	concat_atom([ProgramPrefix, '_', Symbol], SymbolWithPrefix),
	NewHead =.. [SymbolWithPrefix|NewHeadArgsWithCtrsAndDegree],
	build_hypothetical_condition_goals(HypoNewSharedVs, RI, RD, CD, HypoGoals),
    build_predicate_sat_goal(Symbol, Functor, Block, PredicateSatGoal, Cpin, Cpout),
	build_unify_arguments_goal(UnificationProblems, UnifyArgsGoal),
	(Degree < 1 ->
		% Builds the new rule's body with a check of the lambda-cut value 
		% (if needed),
		% the weak unification of the arguments, the original body and the
		% computation of the approximation degree
% 		append(BodyDegreeVars, HeadDegreeVars, DegreeVarsAux),
% 		append(DegreeVarsAux, [Degree], DegreeVars),
		build_pre_over_lambda_cut_goal(Degree, PreOverLCGoal),
		degree_vars_to_compose(HeadDegreeVars, BodyDegreeVars, UnifDegrees, Degree, DegreeVars),
        build_degree_composition_goal(RuleWeight, DegreeVars, DegreeCompVar, DegreeCompGoal),
		build_post_over_lambda_cut_goal(DegreeCompVar, DegreeCompVar, DegreeCompGoal, PostOverLCGoal),
	  (flags:get_bpl_flag(degree_accumulator(false))
	   ->
	    % Link degree composition var with the degree outcome at the head
	    DegreeCompVar = HeadDegreeVar,
  		utilities:append_goals_list([
  		                   PreOverLCGoal,
  		                   PredicateSatGoal,
  		                   HypoGoals,
  		                   UnifyArgsGoal,
  		                   Body,
  		                   DegreeCompGoal,
  		                   PostOverLCGoal], 
  		                  NewBody)
  	 ;
      (BodyDegreeVars == [] ->
        DegreeCompVar = HeadOutDegreeVar ; 
        BodyDegreeVars = [DegreeCompVar|_]),
  		utilities:append_goals_list([
  		                   PreOverLCGoal,
  		                   PredicateSatGoal,
  		                   HypoGoals,
  		                   UnifyArgsGoal,
  		                   DegreeCompGoal,
  		                   PostOverLCGoal,
  		                   Body], 
  		                  NewBody)
    )
	;
		% Builds the new rule's body with the weak unification of the
		% arguments, the original body and the computation of the
		% approximation degree
		degree_vars_to_compose(HeadDegreeVars, BodyDegreeVars, UnifDegrees, 1.0, DegreeVars),
        build_degree_composition_goal(RuleWeight, DegreeVars, DegreeCompVar, DegreeCompGoal),
		build_post_over_lambda_cut_goal(HeadDegreeVar, DegreeCompVar, DegreeCompGoal, PostOverLCGoal),
	  (flags:get_bpl_flag(degree_accumulator(false))
	   ->
	    % Link degree composition var with the degree outcome at the head
	    DegreeCompVar = HeadDegreeVar,
	    var(HeadOutDegreeVar), % Avoid warning
  		utilities:append_goals_list([
  		                   PredicateSatGoal,
  		                   HypoGoals,
  		                   UnifyArgsGoal,
  		                   Body,
  		                   DegreeCompGoal,
  		                   PostOverLCGoal], 
  		                  NewBody)
     ;
	    % Link degree composition var with either the out-degree of the head or the in-degree of the first goal
      (BodyDegreeVars == [] ->
        DegreeCompVar = HeadOutDegreeVar ; 
        BodyDegreeVars = [DegreeCompVar|_]),
  		utilities:append_goals_list([
  		                   PredicateSatGoal,
  		                   HypoGoals,
  		                   UnifyArgsGoal,
  		                   DegreeCompGoal,
  		                   PostOverLCGoal,
  		                   Body], 
  		                  NewBody)
    )
	),
	(NewBody == true ->
	  ExpClause = (NewHead)
	 ;
	  ExpClause = (NewHead :- NewBody)
	),
	% Scans the remaining symbols
	expand_rule(MoreSimBlockDegrees, Functor, CClause, CRuleWeight, CHeadConstraintBlockVars, CBodyConstraintBlockVars, CHeadDegreeVars, CBodyDegreeVars, hypo(HypoSharedVs, HypoNewSharedVs, RI, RD, CD), ProgramPrefix, Equations, MoreExpClauses).


% degree_vars_to_compose(+HeadDegreeVars, +BodyDegreeVars, +UnifDegrees, +Degree, -DegreeVars)
degree_vars_to_compose(_HeadDegreeVars, BodyDegreeVars, UnifDegrees, Degree, DegreeVars) :-
  flags:get_bpl_flag(degree_accumulator(false)),
  !,
  append_degrees([Degree|BodyDegreeVars], UnifDegrees, DegreeVars).

degree_vars_to_compose([HeadDegreeInVar, _HeadDegreeOutVar], _BodyDegreeVars, UnifDegrees, Degree, DegreeVars) :-
  append_degrees([Degree], [HeadDegreeInVar|UnifDegrees], DegreeVars).


% append_degrees(+Xs, +Ys, -Zs)
% Appends degrees, removing 1.0's
append_degrees([], [], []) :-
  !.
  
append_degrees([], Ys, Zs) :-
  append_degrees(Ys, [], Zs).

append_degrees([X|Xs], Ys, Zs) :-
  X==1.0,
  !,
  append_degrees(Xs, Ys, Zs).
  
append_degrees([X|Xs], Ys, [X|Zs]) :-
  append_degrees(Xs, Ys, Zs).

  
%% build_hypothetical_condition_goals(+SharedVs, +RI, +RD, +CD, -Body)
%

build_hypothetical_condition_goals(_SharedVs, _RI, _RD, _CD, true) :-
  flags:get_bpl_flag(hypothetical(false)),
  !.

build_hypothetical_condition_goals(_SharedVs, _RI, RD, _CD, true) :-
  RD == [],
  !.

build_hypothetical_condition_goals(SharedVs, RI, _RD, CD, (reg(RI, SharedVs, RC), chk(RC, CD))) :-
  !.



%% build_predicate_sat_goal(+Symbol1, +Symbol2, +Block, -PredicateSatGoal, ?Cin, ?Cout)
%
%     Creates a goal for applying the satisfaction function
%     for the unification of two program symbols.
%     This is used to confront two similar predicates,
%     and it only applies when either A2 or A3 is selected.
%     Cin and Cout are the input and output block constraint 
%     stores for the goal sat_a2/sat_a3.
%
build_predicate_sat_goal(Symbol, Symbol, _Block, true, Cin, Cin) :- % Implicit Reflexivity. Nothing to do
  !.
  
build_predicate_sat_goal(_Symbol1, _Symbol2, _Block, true, Cin, Cin) :-
  flags:get_bpl_flag(weak_unification(a1)),
  !.
  
build_predicate_sat_goal(Symbol1, Symbol2, _Block, sat_a2('--'(Symbol1,Symbol2), Cin, Cout), Cin, Cout) :-
  flags:get_bpl_flag(weak_unification(a2)),
  !.
  
build_predicate_sat_goal(Symbol1, Symbol2, Block, sat_a3([Symbol1:Block, Symbol2:Block], Cin, Cout), Cin, Cout).
%  flags:get_bpl_flag(weak_unification(a3)),
%  evaluator:sim(Symbol1, Symbol2, Block, _Degree).
    

	            
%% build_unify_arguments_goal(+UnificationProblems, -Goal)
%
%     Creates a goal for computing the unification of the
%     predicate arguments, expressed as a list of unification
%     problems.
%      
build_unify_arguments_goal([], true) :-
  !.
  
build_unify_arguments_goal(UnificationProblems, UnifyArgsGoal) :-
	flags:get_bpl_flag(weak_unification(Algorithm)),
  atom_concat('unify_arguments_', Algorithm, GoalName),
  UnifyArgsGoal =.. [GoalName, UnificationProblems].
%  unify_arguments_a1(UnificationProblems)


%% build_pre_over_lambda_cut_goal(+Degree, -Goal)
%
%     Creates a goal for the rule's lambda-cut threshold. 
%     If filtering is enabled, there is no need for this 
%     goal, as proximity equations are filtered and rules 
%     below such threshold are not generated.
%      

build_pre_over_lambda_cut_goal(_Degree, true) :-
	flags:get_bpl_flag(filtering(true)),
	!.
    
build_pre_over_lambda_cut_goal(Degree, over_lambdacut(Degree)).


%% build_degree_composition_goal(+RuleWeight, +DegreeVars, +HeadDegreeVar, -Goal)
%
%     Creates a goal for computing the composition of goal degrees, 
%     and the head degree of the clause.
%      
build_degree_composition_goal(1.0, [], 1.0, true) :-
  !. 
  
build_degree_composition_goal(1.0, [D], D, true) :-
  !. 
  
build_degree_composition_goal(1.0, DegreeVars, HeadDegreeVar, degree_composition(DegreeVars, HeadDegreeVar)) :-
  !.
  
build_degree_composition_goal(RuleWeight, DegreeVars, HeadDegreeVar, degree_composition([RuleWeight|DegreeVars], HeadDegreeVar)).


%% build_post_over_lambda_cut_goal(+HeadDegree, +CompDegree, +DegreeCompGoal, -Goal)
%
%     Creates a goal for a lambda-cut threshold needed  
%     for each t-norm whose composition may deal a degree
%     less than the degrees in the composition.
%     If there is no composition (true composition goal),
%     then there is no need for the test.
%      

build_post_over_lambda_cut_goal(_HeadDegree, _CompDegree, true, true) :-
	!.
    
build_post_over_lambda_cut_goal(_HeadDegree, _CompDegree, _, true) :-
	flags:get_bpl_flag(fuzzy_logic(min)),
	flags:get_bpl_flag(filtering(true)),
	!.
    
build_post_over_lambda_cut_goal(HeadDegree, _CompDegree, _, over_lambdacut(HeadDegree)) :-
  flags:get_bpl_flag(degree_accumulator(false)),
  !.
build_post_over_lambda_cut_goal(_HeadDegree, CompDegree, _, over_lambdacut(CompDegree)).


%% link_rule_block_constraint_variables(?HeadConstraintBlockVars, ?Cpin, ?Cpout, ?Cuin, ?Cuout, ?BodyConstraintBlockVars)
%
%
%    If the body has no constraint block variables (e.g., calls to built-ins):
%
%       - Cin of head with Cin of predicate sat.
%       - Cout of predicate sat with Cin of unification problems.
%       - Cout of unification problems with Cout of head.
%
%    Otherwise, links head, sat, unify and body block constraints variables:
%      
%       - Cin of head with Cin of predicate sat.
%       - Cout of predicate sat with Cin of unification problems.
%       - Cout of unification problems with Cin of body.
%       - Cout of body with Cout of head.

link_rule_block_constraint_variables([], Cp, Cp, Cu, Cu, []) :-
  flags:get_bpl_flag(weak_unification(a1)),
  !.

link_rule_block_constraint_variables(HeadConstraintBlockVars, Cpin, Cpout, Cuin, Cuout, []) :-
	HeadConstraintBlockVars = [Cpin|_],        % Cin of head with Cin of predicate sat.
	Cpout = Cuin,                              % Cout of predicate sat with Cin of unification problems.
	append(_,[Cuout],HeadConstraintBlockVars). % Cout of unification problems with Cout of head
	
link_rule_block_constraint_variables(HeadConstraintBlockVars, Cpin, Cpout, Cuin, Cuout, BodyConstraintBlockVars) :-
	HeadConstraintBlockVars = [Cpin|_],        % Cin of head with Cin of predicate sat.
	Cpout = Cuin,                              % Cout of predicate sat with Cin of unification problems.
	BodyConstraintBlockVars = [Cuout|_],       % Cout of unification problems with Cin of body
	!,
	append(_,[Cout],BodyConstraintBlockVars),  % Cout of body with 
	append(_,[Cout],HeadConstraintBlockVars).  % Cout of head

		
% Links head degree variables with body variables
% link_rule_degree_variables(+HeadDegreeVars, +BodyDegreeVars, -DegreeCompositionVar)

link_rule_degree_variables(_HeadDegreeVars, _BodyDegreeVars, _DegreeCompositionVar) :-
	flags:get_bpl_flag(degree_accumulator(false)),
	!.

link_rule_degree_variables([_DegreeInVar, DegreeOutVar], [], DegreeOutVar) :-
  !.

link_rule_degree_variables(HeadDegreeVars, BodyDegreeVars, DegreeCompositionVar) :-
  HeadDegreeVars = [_DegreeInVar, DegreeOutVar],
  BodyDegreeVars = [DegreeCompositionVar|_],
  append(_, [DegreeOutVar], BodyDegreeVars).


%% extract_unification_problems(+Args, +Equations, -NewArgs, +Cin, -Cout, -Degrees, -UnificationProblems)
%
%
%    From the list of arguments Args, extract all the unification problems.
%
%    When indexing is enabled, symbols which are not similar to any other 
%    are not weak unified, so they will remain in the head.
%    Additionally, only the second and further occurrences of the same variable
%    are linearised.
%    WARNING: Better use difference lists.

extract_unification_problems(Args, Equations, NewArgs, Cin, Cout, Degrees, UnificationProblems) :-
  flags:get_bpl_flag(indexing(true)),
  % Do not apply indexing optimization when hypothetical is turned on
  %   It remains to adjust the indexing opt. in such a case
  flags:get_bpl_flag(hypothetical(false)), 
  !,
  empty_assoc(Vin),
  extract_unification_problems_indexing(Args, Equations, NewArgs, Cin, Cout, [], Degrees, [], UnificationProblems, Vin, _Vout).
extract_unification_problems(Args, _Equations, Vars, Cin, Cout, Degrees, UnificationProblems) :-
  length(Args,L),
  length(Vars,L),
  create_unification_problems(Vars, Args, Cin, Cout, Degrees, UnificationProblems).

%% extract_unification_problems_indexing(+Args, +Equations, -NewArgs, +Cin, -Cout, +Din, -Dout, +Uin, -Uout, +Vin, -Vout)
%
%    Create unification problems when indexing is enabled.
%
%    Vin is the AVL tree of variables which have been already scanned. If a given
%    variable is in this tree, it means that the current scanned variable must be 
%    linearised (i.e., a unification problem must be built for it). If it is the 
%    first occurrence, it is added to the tree and no unification problem is built.

extract_unification_problems_indexing([], _Equations, [], Cin, Cin, Din, Din, Uin, Uin, Vin, Vin).
extract_unification_problems_indexing([Arg|Args], Equations, [NewArg|NewArgs], Cin, Cout, Din, Dout, Uin, Uout, Vin, Vout) :-
  extract_unification_problems_indexing_term(Arg, Equations, NewArg, Cin, Cin1, Din, Din1, Uin, Uin1, Vin, Vaux),
  extract_unification_problems_indexing(Args, Equations, NewArgs, Cin1, Cout, Din1, Dout, Uin1, Uout, Vaux, Vout).


% A variable (from its second occurrence on) must be weak unified 
%   (recall that variables are parsed as atoms)
extract_unification_problems_indexing_term(AtomVar, _Equations, NewVar, Cin, Cout, Din, Dout, Uin, Uout, Vin, Vout) :-
  atom(AtomVar),
  % Try to read a variable (an atom with spaces raises an exception if read as a term)
  catch(
    read_term_from_atom(AtomVar, Var, []), % Variables are parsed as atoms to easily keep variable names
    _Catcher,
    fail),
  var(Var),
  !,
  (get_assoc(AtomVar, Vin, _)
   ->
    create_unification_problems([NewVar], [AtomVar], Cin, Cout, [Degree], [Problem]),
    append(Din, [Degree], Dout),
    append(Uin, [Problem], Uout),
    Vout = Vin
   ;
    NewVar = AtomVar,
    Cout = Cin,
    Dout = Din,
    Uout = Uin,
    put_assoc(AtomVar, Vin, AtomVar, Vout) ).
% A number is not weak unified
extract_unification_problems_indexing_term(Number, _Equations, Number, Cin, Cin, Din, Din, Uin, Uin, Vin, Vin) :-
  number(Number),
  !.
% A symbol which is not similar to any other is not weak unified
extract_unification_problems_indexing_term(Constant, Equations, Constant, Cin, Cin, Din, Din, Uin, Uin, Vin, Vin) :-
  atom(Constant),
  non_similar_under_lambda_cut(Constant, Equations),
  !.
% A functor which is not similar to any other is not weak unified, but their arguments might be
extract_unification_problems_indexing_term(Term, Equations, NewTerm, Cin, Cout, Din, Dout, Uin, Uout, Vin, Vout) :-
  Term =.. [Functor|Args],
  non_similar_under_lambda_cut(Functor, Equations),
  !,
  extract_unification_problems_indexing_term_list(Args, Equations, NewArgs, Cin, Cout, Din, Dout, Uin, Uout, Vin, Vout),
  NewTerm =.. [Functor|NewArgs].
% Default case: terms and constants which are similar to others (above the lambda cut)
extract_unification_problems_indexing_term(Term, _Equations, Var, Cin, Cout, Din, Dout, Uin, Uout, Vin, Vin) :-
  create_unification_problems([Var], [Term], Cin, Cout, [Degree], [Problem]),
  append(Din,[Degree],Dout),
  append(Uin,[Problem],Uout).
  
extract_unification_problems_indexing_term_list([], _Equations, [], Cin, Cin, Din, Din, Uin, Uin, Vin, Vin).
extract_unification_problems_indexing_term_list([Arg|Args], Equations, [NewArg|NewArgs], Cin, Cout, Din, Dout, Uin, Uout, Vin, Vout) :-
  extract_unification_problems_indexing_term(Arg, Equations, NewArg, Cin, Cin1, Din, Din1, Uin, Uin1, Vin, Vaux),
  extract_unification_problems_indexing_term_list(Args, Equations, NewArgs, Cin1, Cout, Din1, Dout, Uin1, Uout, Vaux, Vout).

non_similar_under_lambda_cut(Constant, Equations) :-
 	(
%    (flags:get_bpl_flag(weak_unification('a3'))
%   	 ->
% %      evaluator:sim(Constant, Constant2, _Block, Degree)
%       member(sim(Constant, Constant2, _Block, Degree), Equations)
%      ;
% %      evaluator:sim(Constant, Constant2, Degree)),
%       member(sim(Constant, Constant2, Degree), Equations)),
    member(sim(Constant, Constant2, Degree), Equations),
    Constant \== Constant2,
  	flags:get_bpl_flag(lambda_cut(LambdaCut)),
    Degree > LambdaCut,
    !,
    fail
   ;
  true).


%% create_unification_problems(+Vars, +Args, ?Cin, ?Cout, +Degrees, -Problems)
%
%     Returns a list of unification Problems suitable for the
%     unify_arguments_ai/1 predicate. If the selected weak unification algorithm 
%     is 'a1', then each of the returned problems will be
%     a list with an item of each of the three input lists and the input and 
%     output block constraints variables: Vars, Args, and Degrees.
%     Else, the returned problems will be of the form: Vars, Args, Cin, Cout,
%     and Degrees, where the Cout of a unification problem is the Cin of the
%     next one.
%
%     For example, given Vars = [X, Y], Args = [a, b] and
%     Degrees = [D1, D2], 
%     for 'a1' this predicate will return:
%     Problems = [[X, a, D1], [Y, b, D2]], 
%     while for 'a2' and 'a3':
%     Problems = [[X, a, Cin, C1, D1], [Y, b, C1, Cout, D2]].
%     where Cin and Cout are unbound variables.
%

create_unification_problems(Vars, Args, _Cin, _Cout, Degrees, Goals) :-
	flags:get_bpl_flag(weak_unification('a1')),
  !,
  create_unification_a1_problems(Vars, Args, Degrees, Goals).
create_unification_problems(Vars, Args, Cin, Cout, Degrees, Goals) :-
  create_unification_a2_a3_problems(Vars, Args, Cin, Cout, Degrees, Goals).

create_unification_a1_problems([], [], [], []).
create_unification_a1_problems([Var|MoreVars], [Arg|MoreArgs], [Degree|MoreDegrees],
                                [[Var, Arg, Degree]|MoreGoals]) :-
  create_unification_a1_problems(MoreVars, MoreArgs, MoreDegrees, MoreGoals).

create_unification_a2_a3_problems([], [], Cin, Cin, [], []).
create_unification_a2_a3_problems([Var|MoreVars], [Arg|MoreArgs], Cin, Cout, [Degree|MoreDegrees],
                               [[Var, Arg, Cin, Cin1, Degree]|MoreGoals]) :-
  create_unification_a2_a3_problems(MoreVars, MoreArgs, Cin1, Cout, MoreDegrees, MoreGoals).



%% actual_rule_arity(+ExpandedRuleArity, -RuleArity)
%
%     The arity of the expanded rule (with the degree variable and, 
%     possibly, with the block constraints variables) corresponds to 
%     a predicate without extended arguments. For a weak 
%     unification algorithm different from 'a1', expanded rules are 
%     added with to arguments to bring constraints. If the accumulator
%     optimization is enabled another two are required to bring the 
%     approximation degrees; otherwise, only one argument for the
%     degree is needed.
%     Its dual is expanded_rule_arity/2
%

actual_rule_arity(RuleArity, ActualRuleArity) :-
	(flags:get_bpl_flag(weak_unification('a1'))    -> Ctr = 0 ; Ctr = 2),
	(flags:get_bpl_flag(degree_accumulator(false)) -> Acc = 1 ; Acc = 2),
	(flags:get_bpl_flag(hypothetical(false))       -> Hyp = 0 ; Hyp = 1),
  !,
  ActualRuleArity is RuleArity - Acc - Ctr - Hyp. 
  

%% expanded_rule_arity(+RuleArity, -ExpandedRuleArity)
%
%  The dual predicate to actual_rule_arity/2. In this case,
%  it returns the arity of the translated (expanded) predicate.
%

expanded_rule_arity(RuleArity, ExpandedRuleArity) :-
	(flags:get_bpl_flag(weak_unification('a1'))    -> Acc = 1 ; Acc = 2),
	(flags:get_bpl_flag(degree_accumulator(false)) -> Ctr = 0 ; Ctr = 2),
	(flags:get_bpl_flag(hypothetical(false))       -> Hyp = 0 ; Hyp = 1),
  !,
  ExpandedRuleArity is RuleArity + Acc + Ctr + Hyp. 

  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Expansion of equations
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% expand_equations(+EqPrefix, +Equations, -ExpandedEquations)
%
%     Extracts all the equations from the Equations list that match
%     template "EqPrefix(_, _, _)", computes their closure (using the
%     closure properties and t-norm specified in system flags) and
%     returns the resulting equations in the ExpandedEquations list. If
%     EqPrefix is a list, this predicate will be called once for each
%     item and the union of all resulting equations will be returned.
%

expand_equations([], _Equations, []) :-
	!.

expand_equations([EqPrefix|MorePrefixes], Equations, ExpandedEquations) :-
	% Calls this predicate recursively for each prefix
	expand_equations(EqPrefix, Equations, ExpandedEquations1),
	expand_equations(MorePrefixes, Equations, ExpandedEquations2),
	append(ExpandedEquations1, ExpandedEquations2, ExpandedEquations).

expand_equations(EqPrefix, Equations, ExpandedEquations) :-
	% Extract "EqPrefix(_, _, _)" equations from list
	atom(EqPrefix),
	utilities:extract_terms(EqPrefix, 3, Equations, SubEquations),
	% Computes the reflexive, transitive, and/or symmetric closure
	flags:get_bpl_flag(relation_properties(EqPrefix, ClosureProperties)),
	utilities:closure_properties(ClosureProperties, Closure, TNorm),
	flags:get_bpl_flag(lambda_cut(LambdaCut)),
	flags:get_bpl_flag(filtering(Filtering)),
	(Filtering==true -> Threshold=LambdaCut ; Threshold=0.0),
	foreign:ext_closure(SubEquations, Closure, TNorm, EqPrefix, Threshold,
	                    ExpandedEquations).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Translation of assertions and retractions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% translate_asserts_retracts(+Clause, -TranslatedClause, +ProgramPrefix, +Equations, +BlockEquations)
%
%     Makes a copy of Clause and returns it in TranslatedClause,
%     after expanding all its assert/1 and retract/1 terms. These terms
%     are expanded using ProgramPrefix and the list of Equations in the
%     same way facts and rules are expanded.
%
%     For example, considering that "a ~ b = 0.5", a term like
%     "assert(prog_a(g, D))" would be translated into:
%     "(assert((prog_a(A1, D) :- unify_arguments_a1[[A1, g, D1]]),
%                                true,
%                                min_degree([D1], D)),
%       assert((prog_b(A1, D) :- over_lambdacut(0.5),
%                                unify_arguments_a1[[A1, g, D1]]),
%                                true,
%                                min_degree([D1], D)))"

translate_asserts_retracts(Clause, TranslatedClause, ProgramPrefix, Equations, BlockEquations) :-
	% Program prefix and list of equations and block equations are saved in dynamic
	% predicates because they're needed by the scanners called
	% by process_term/6
    Facts = [program_prefix(ProgramPrefix),
		     equations(Equations),
		     block_equations(BlockEquations)],
    %     If an exception is raised during the execution of
    %     process_term/6, cleanup_asserts/1 is called to
    %     remove the asserted facts from the database.
	catch((
		maplist(assert, Facts),
		utilities:process_term(Clause, TranslatedClause,
							[translator:assert_translator_scanner,
								translator:retract_translator_scanner],
							[], _, _)
						   ),
        (cleanup_asserts(Facts),
         raise_exception(Exception)),
        Exception),
    cleanup_asserts(Facts).


%% cleanup_asserts(+Facts)
%
%     Removes the facts in the list Facts from the database.
%
cleanup_asserts(Facts) :-
    findall(Fact,
            (member(Fact, Facts), 
             retract(Fact)), 
            _Facts).

% fail(_Term) :-
%   fail.
  

%% assert_translator_scanner(+Term, -Result, +InData, -OutData)
%
%     Scanner that can be used with process_term/6 to "expand" the
%     assert/1 terms in the same way facts and rules are expanded.
%     See translate_asserts_retracts/2 for an example. This scanner
%     ignores InData and OutData.
%
%     @see process_term/6
%     @see translate_asserts_retracts/2
%

assert_translator_scanner(Term, Asserts, _, _) :-
	nonvar(Term),
	Term = assert(yes, Rules), % Compiled rules can be translated at compile-time
	findall(TermRule, member([TermRule, _, _, _, _, _, _], Rules), TermRules),
	maplist(parser:is_total_rule, TermRules),
	parser:program_prefix(ProgramPrefix),
	equations(Equations),
	block_equations(BlockEquations),
	% Expands the asserted rule and creates a conjunction of
	% assert/1 predicates with each of the returned rules
	expand_rules(Rules, RulesToAssert, ProgramPrefix, Equations, BlockEquations),
	create_conjunction(RulesToAssert, assert, Asserts).

assert_translator_scanner(Term, Term, _, _).
	% If term isn't assert/1, it's copied as is


%% retract_translator_scanner(+Term, -Result, +InData, -OutData)
%
%     Scanner that can be used with process_term/6 to "expand" the
%     retract/1 terms in the same way facts and rules are expanded.
%     See translate_asserts_retracts/2 for an example. This scanner
%     ignores InData and OutData.
%
%     @see process_term/6
%     @see translate_asserts_retracts/2
%

retract_translator_scanner(Term, Retracts, _, _) :-
	nonvar(Term),
	Term = retract(yes, Rules), % Compiled rules can be translated at compile-time
	parser:program_prefix(ProgramPrefix),
	equations(Equations),
	block_equations(BlockEquations),
	% Expands the retracted rule and creates a conjunction of
	% retract/1 predicates with each of the returned rules
	expand_rules(Rules, ExpandedRules, ProgramPrefix, Equations, BlockEquations),
	(flags:get_bpl_flag(hypothetical(false))
	 -> RulesToRetract = ExpandedRules
	 ;  utilities:process_term(ExpandedRules, RulesToRetract,
                       [translator:retract_hypo_scanner],
                       [], _, _)),
	create_conjunction(RulesToRetract, bpl_retract, Retracts).

retract_translator_scanner(Term, Term, _, _).
	% If term isn't retract/1, it's copied as is


%% retract_hypo_scanner(+Term, -Result, +InData, -OutData)
%
%     Scanner that can be used with process_term/6 to remove groundings
%     the hypothetical term, to be able to retract the rules. This scanner
%     ignores InData and OutData.
%
%     @see process_term/6
%     @see translate_asserts_retracts/2
%

retract_hypo_scanner(Term, ResultTerm, _, _) :-
	nonvar(Term),
	Term = hypo(_, _, _, _),
	ResultTerm = hypo(_, _, _, _).

retract_hypo_scanner(Term, ResultTerm, _, _) :-
	nonvar(Term),
	Term = '=>'(_, A, B, C),
	ResultTerm = '=>'(_, A1, B, C),
	retract_hypo_scanner(A, A1, _, _).

retract_hypo_scanner(Term, ResultTerm, _, _) :-
	nonvar(Term),
	Term = reg(_, A, B),
	ResultTerm = reg(_, A, B).

retract_hypo_scanner(Term, Term, _, _).


%% create_conjunction(+Terms, +Atom, -Conjunction)
%
%     Builds a Conjunction of unary predicates using Atom as functor
%     and each of the terms in Terms as arguments.
%
%     For example, given Terms = [a, b, c] and Atom = 'write', this
%     predicate will return Conjunction = [write(a), write(b),
%     write(c)].
%

create_conjunction([], _Atom, true).

create_conjunction([Item|MoreItems], Atom, Terms) :-
	SingleTerm =.. [Atom, Item],
	create_conjunction(MoreItems, Atom, MoreTerms),
	(MoreTerms == true ->
		Terms = SingleTerm
	;
		Terms = (SingleTerm, MoreTerms)
	).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicates for handling linguistic terms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% translate_fuzzy_sets(+Sets, -Equations)
%
%     Converts a list of fuzzy sets into a binary fuzzy relation
%     defined with proximity/similarity equations, i.e., 'sim/3' terms.
%     Each fuzzy set must be a list consisting of two terms: a domain
%     name and a list of subsets. If Sets is an empty list, all the
%     current fuzzy sets stored in the BPL flags will be translated.
%

%% translate_fuzzy_sets_aux(+Sets, -Equations)
%
%     Internal predicate used by translate_fuzzy_sets/2.
%
%     @see translate_fuzzy_sets/2
%

translate_fuzzy_sets([], Equations) :-
	!,
	findall([DomainName, Subsets],
	        flags:get_bpl_flag(fuzzy_subsets(DomainName, Subsets)), AllFuzzySets),
	translate_fuzzy_sets_aux(AllFuzzySets, Equations).

translate_fuzzy_sets(FuzzySets, Equations) :-
	translate_fuzzy_sets_aux(FuzzySets, Equations).

translate_fuzzy_sets_aux([], []).

translate_fuzzy_sets_aux([[Domain, SubsetList]|MoreFuzzySets], Equations) :-
	% Gets the domain definition and its current subsets
	flags:get_bpl_flag(fuzzy_domain(Domain, [Min, Max, Unit])),
	flags:get_bpl_flag(fuzzy_subsets(Domain, FullSubsetList)),
	% Translates the subsets into a binary fuzzy relation
	foreign:ext_translate_fuzzysets([Domain, Min, Max, Unit], FullSubsetList,
	                                SubsetList, sim, DomainEquations),
	% Scans the remaining fuzzy subsets
	translate_fuzzy_sets_aux(MoreFuzzySets, MoreEquations),
	append(DomainEquations, MoreEquations, Equations).


%% add_linguistic_terms(+LinguisticTerms, -AddedSubsets)
%
%     Translates a list of linguistic terms returned by the parser
%     into a list of fuzzy subsets, and then adds them to the current
%     list of subsets stored in the system flags. AddedSubsets will be
%     unified with the list of new fuzzy subsets that were really added
%     to the flags.
%
%     Linguistic terms built with the '#' operator can be defined in two
%     ways:
%      * 1: [domain, DomainName, SubsetDefinition], if the linguistic
%        term belongs to the domain called DomainName.
%      * 2: [subset, SubsetName, SubsetDefinition], if the linguistic
%        term belongs to the domain in which a subset called SubsetName
%        is declared.
%

add_linguistic_terms(LingTerms, AddedSubsets) :-
	linguistic_terms_to_fuzzy_subsets(LingTerms, Subsets),
	add_fuzzy_subsets(Subsets, AddedSubsets).


%% linguistic_terms_to_fuzzy_subsets(+LingTerms, -Subsets)
%
%     Translates a list of linguistic terms returned by the parser into
%     a list of fuzzy subsets that can be processed by
%     ext_translate_fuzzysets/5. See add_linguistic_terms/2 for the
%     expected syntax of the LingTerms list.
%
%     @see add_linguistic_terms/2
%

linguistic_terms_to_fuzzy_subsets([], []).

linguistic_terms_to_fuzzy_subsets([[domain, DomainName, SubsetDefinition]|MoreLingTerms], Subsets) :-
	% Ensures that the specified domain exists
	flags:get_bpl_flag(fuzzy_domain(DomainName, [_Min, _Max, _Unit])), !,
	% Converts the remaining linguistic terms
	linguistic_terms_to_fuzzy_subsets(MoreLingTerms, MoreSubsets),
	append([[DomainName, [SubsetDefinition]]], MoreSubsets, Subsets).

linguistic_terms_to_fuzzy_subsets([[subset, SubsetName, SubsetDefinition]|MoreLingTerms], Subsets) :-
	% Looks for the domain in which a subset called SubsetName is declared
	flags:get_bpl_flag(fuzzy_subsets(DomainName, DomainSubsets)),
	member(WantedSubset, DomainSubsets),
	WantedSubset =.. [SubsetName|_Value],
	% Calls the previous rule replacing subset/SubsetName with domain/DomainName
	linguistic_terms_to_fuzzy_subsets([[domain, DomainName, SubsetDefinition]], NewSubset),
	% Converts the remaining linguistic terms
	linguistic_terms_to_fuzzy_subsets(MoreLingTerms, MoreSubsets),
	append(NewSubset, MoreSubsets, Subsets).

linguistic_terms_to_fuzzy_subsets([_BadLingTerm|MoreLingTerms], Subsets) :-
	% This rule is only executed if a linguistic term has an unknown
	% syntax or doesn't belong to any existing domain or fuzzy set
	linguistic_terms_to_fuzzy_subsets(MoreLingTerms, Subsets).


%% add_fuzzy_subsets(+Subsets, -AddedSubsets)
%
%     Adds a list of Subsets to the current list of subsets stored in
%     the BPL flags, and returns a list with the subsets that were not
%     already in them. Each subset must be defined with a list
%     following this syntax: [Domain, [SubsetDefinition]] (note that this
%     is the same syntax used by the fuzzy_set/2 BPL directive).
%

add_fuzzy_subsets([], []).

add_fuzzy_subsets([[Domain, [SubsetDefinition]]|MoreSubsets], AddedSubsets) :-
	% Checks if this subset is already defined
	flags:get_bpl_flag(fuzzy_subsets(Domain, DomainSubsets)),
	(member(SubsetDefinition, DomainSubsets) ->
		% Subset is alredy defined
		true,
		Added = []
	;
		% Adds the new subset to the lists of subsets of the domain
		append(DomainSubsets, [SubsetDefinition], NewDomainSubsets),
		Added = [[Domain, [SubsetDefinition]]],
		% Updates the fuzzy subsets of the domain
		flags:remove_bpl_flag(fuzzy_subsets(Domain, DomainSubsets)),
		flags:add_bpl_flag(fuzzy_subsets(Domain, NewDomainSubsets))
	),
	% Adds the remaining fuzzy subsets
	add_fuzzy_subsets(MoreSubsets, MoreAdded),
	append(Added, MoreAdded, AddedSubsets).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Built-ins
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% build_fuzzy_builtins_rules(+Directives, -BuiltIns)
%
%     Builds rules for fuzzy built-in predicates. WordNet built-ins are
%     only generated if the directive wn_connect is in Directives.
% 
%     Each built-in must include the computed degree in its last argument
%
%     Examples of built-ins are WordNet fuzzy predicates as, e.g.:
% 
%       wn_path(+Word1, +Word2)
%
%     which represents the public (crisp) predicate:
%
%       wn_path(+Word1, +Word2, -Degree)

build_fuzzy_builtins_rules(Directives, Rules) :-
  memberchk((:-directive(wn_connect, _Opts)), Directives),
  wn_fuzzy_builtin_predicates(Predicates),
  % Other future built-ins can be added here
  build_fuzzy_builtin_rules_from_predicates(Predicates, Rules),
  !.

build_fuzzy_builtins_rules(_Directives, []).

    
build_fuzzy_builtin_rules_from_predicates([], []).

build_fuzzy_builtin_rules_from_predicates([Predicate|Predicates], [Rule|Rules]) :-
  build_fuzzy_builtin_rule_from_predicate(Predicate, Rule),
  build_fuzzy_builtin_rules_from_predicates(Predicates, Rules). 

build_fuzzy_builtin_rule_from_predicate(PredName/Arity, Rule) :-
  length(Args, Arity),
  (flags:get_bpl_flag(weak_unification(a1))
   ->
    append(Args, ['D'], HeadArgs), % WARNING: ADD DEGREE ACCUMULATOR OPTIMIZATION
    Cs = [_,_,[]]
   ;
    append(Args, ['Ci','Co','Deg'], HeadArgs),
    Cs = [['Ci','Co'], [], []]
  ),
  append(Args, ['D'], BodyArgs),
  parser:program_prefix(ProgramPrefix),
	concat_atom([ProgramPrefix, '_', PredName], PrefixedPredName),
  SourceHead =.. [PrefixedPredName|HeadArgs],
  SourceBody =.. [PredName|BodyArgs],
  expand_rules( 
   [[(SourceHead:-SourceBody)|Cs]], 
   [(TPLHead:-UnifyGoal, BIGoal, degree_composition(Degrees, OutputDegree))], 
   ProgramPrefix,
   [sim(X, X, 1.0)],
   [sim(X, X, _Block, 1.0)]),
 Rule = (TPLHead:-(UnifyGoal, BIGoal, degree_composition(['D'|Degrees], OutputDegree))).


%% wn_fuzzy_builtin_predicates(+Predicates) 
%
%     Returns the list of fuzzy built-in predicates with the pattern Name/Arity
%     Arity corresponds to the user predicate arity, which becomes Arity+1 for
%     the actual predicate, which adds an extra argument for the approximation
%     degree.

wn_fuzzy_builtin_predicates([
    wn_path/2, 
    wn_wup/2,
    wn_lch/2,
    wn_res/2,
    wn_jcn/2,
    wn_lin/2,
    wn_yarm/2
    ]).

    
%% write_fuzzy_builtins(+BuiltIns)
%
%     Write rules for fuzzy built-in predicates (if any).
% 

write_fuzzy_builtins([]) :-
  !.
  
write_fuzzy_builtins(BuiltIns) :-
	utilities:write_lines(BuiltIns, '', '.'), 
	nl.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Auxiliary dynamic predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% program_prefix(?Prefix)                                   is dynamic
%
%     Auxiliary dynamic predicate used by assert_translator_scanner/1
%     and retract_translator_scanner/1 that store the prefix that must
%     be appended to the predicate names.
%

:- dynamic program_prefix/1.


%% equations(?Equations)                                     is dynamic
%
%     Auxiliary dynamic predicate used by assert_translator_scanner/1
%     and retract_translator_scanner/1 that store the list of equations
%     of the main proximity/similarity relation.
%

:- dynamic equations/1.



