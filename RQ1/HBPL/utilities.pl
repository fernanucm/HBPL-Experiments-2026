%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Utility predicates used by other modules

:- module(utilities, [
		% Predicates for processing and scanning terms
		process_term/6,         % +Term, -Result, +Scanners, +Testers,
		                        %   +InData, -OutData
		disjunctive_normal_form/2,% +Term, -Result
    member_term_with_pattern/3, % +Subterm, +Term, +Pattern
		% Predicates for retrieving predicate names
		get_predicates/1,       % -PredicateList
		get_predicates_modules/2,% +ModuleList, -PredicateList
		% Predicates for simplifying a filename or an atom
		simplify_filename/2,    % +Path, -SimplifiedFilename
		simplify_atom/2,        % +Atom, -SimplifiedAtom)
		% Miscellaneous list-related predicates
		write_lines/3,          % +List, +Prefix, +Sufix
		writef_to_atom/3,       % +Format, +Data, -Atom
		extract_terms/4,        % +Prefix, +Arity, +List, -Items
		ascending_numbers/1,    % +List
		remove_prefixes/3,      % +List, -Result, +Prefix
		remove_program_prefix/2,% +Atom, -Result
		link_last_variable/2,   % +List, +Term
		% Miscellaneous string-related predicates
		remove_quotes/2,        % +Strings, ?FixedStrings
		is_quoted/2,            % +String, ?QuoteChar
		% Miscellaneous predicates for interacting with files and the OS
		home_directory/1,       % ?HomeDir
		file_is_newer/2,        % +File1, +File2
		% Other miscellaneous predicates
		builtin/1,              % +Predicate
		atom_is_variable/1,     % +Atom
		% Bousi-Prolog specific predicates
		closure_properties/3,   % +Properties, ?Closure, ?TNorm
		relation_name/2,        % ?Symbol, ?Name
		relation_evaluator/2    % ?Relation, ?Evaluator
%		atoms_in_term/2         % +Term, -Atoms
   ]).

:- use_module(library(lists)).
:- use_module(library(readutil)).
:- use_module(library(shell)).
% Add all modules used by wn module. 
:- use_module(library(ordsets)).

% Use additional modules for detecting builtins.
:- ((member(M, [ansi_term,arithmetic,broadcast,listing,occurs,prolog_clause,prolog_source,prolog_stack,settings]), use_module(library(M)), fail) ; !).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- set_prolog_flag(double_quotes, codes).

checkwnenv(WNDB) :-
    (   getenv('WNDB', WNDB)
    ->  true
    ;  (current_prolog_flag(windows, true)
    %   Default directories:
    ->  WNDB = 'C:\\WordNet3.0'
    ;   WNDB = '/usr/local/WordNet-3.0'),
        setenv('WNDB', WNDB)
    ).
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicates for processing and scanning terms
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% process_term(+Term, -Result, +Scanners, +Testers, +InData, -OutData)
%
%     Generic higher-order predicate that can be used to scan and/or
%     process a Term with some InData in order to get a Result term and
%     some OutData. This predicate uses two different lists of
%     predicates (which can be empty):
%
%      * Scanners: predicates with signature "(+Term, -Result, +InData,
%        -OutData)" that must not fail.
%      * Testers: unary predicates with signature "(+Term)" that may
%        optionally fail.
%
%     A term of the form '$'(Term) is not scanned with Term as Result
%
%     The behavior of the process_term/6 predicate is defined by means
%     of the following algorithm:
%
%      * 1: Call the Scanners with the initial Term and InData to get
%           a Result and some OutData.
%      * 2: If Result is not a compound term, return Result and
%           OutData.
%      * 3: If Result is a compound term:
%        * 3.1: Call the Testers with the Result.
%        * 3.2: If any of the Testers fail, return Result and OutData.
%        * 3.3: If all the Testers succeed:
%          * 3.3.1: Call this predicate recursively with each of the
%                   arguments of Result. OutData will be passed as
%                   InData on the first call to get a new OutData, then
%                   this OutData will be passed as InData on the second
%                   call and so on.
%          * 3.3.2: Return a new term with the Result functor and
%                   the arguments returned by the recursive calls, and
%                   also the OutData returned by the last recursive
%                   call.
%

%% process_term_aux(+Terms, -Results, +Scanners, +Testers, +InData, -OutData)
%
%     Internal predicate used by process_term/6 in which Terms and
%     Results are not single terms but lists.
%
%     @see process_term/4
%

process_term(Term, Result, Scanners, Testers, InData, OutData) :-
	process_term_aux([Term], [Result], Scanners, Testers, InData, OutData).

process_term_aux([], [], _Scanners, _Testers, OutData, OutData).

process_term_aux([Term|MoreTerms], [Result|MoreResults], Scanners, Testers, InData, OutData) :-
	execute_scanners(Term, FirstResult, Scanners, InData, FirstOutData),
	((compound(FirstResult), 
	  FirstResult == Term, % Don't try to reprocess a processed term
	  execute_testers(FirstResult, Testers))
  ->
		FirstResult =.. [Functor|Args],
		process_term_aux(Args, ResultArgs, Scanners, Testers, FirstOutData, LastOutData),
		Result =.. [Functor|ResultArgs]
	;
		Result = FirstResult,
		LastOutData = FirstOutData
	),
	process_term_aux(MoreTerms, MoreResults, Scanners, Testers, LastOutData, OutData).

% process_term(Term, Result, Scanners, Testers, InDataList, OutDataList) :-
% 	process_term_list([Term], [Result], Scanners, Testers, InDataList, OutDataList).

% process_term_list(_Terms, _Results, _Scanners, _Testers, [], []) :- !.
% process_term_list(Terms, Results, Scanners, Testers, [InData|InDataList], OutDataList) :-
% 	process_term_aux(Terms, Results, Scanners, Testers, InData, OutDataList1),
% 	process_term_list(Terms, Results, Scanners, Testers, InDataList, OutDataList2),
% 	append(OutDataList1, OutDataList2, OutDataList).


% %% append_for_each_first_list(+List, +ListOfLists, -Result)
% %
% %    Appends List to each sublist in ListOfLists and returns the result in Result.
% %

% append_for_each_first_list([], _, []).

% append_for_each_first_list([List1|Rest], List2, [NewSubList|NewRest]) :-
%     append(List1, List2, NewSubList),
%     append_for_each_first_list(Rest, List2, NewRest).


% append_for_each_second_list(_, [], []).

% append_for_each_second_list(List1, [List2|Rest], List) :-
% 	append_for_each_first_list(List1, List2, NewRest1),
% 	append_for_each_second_list(List1, Rest, NewRest2),
% 	append(NewRest1, NewRest2, List).

	

% %% process_term_aux(+Terms, -Results, +Scanners, +Testers, +InData, -OutDataList1)

% process_term_aux([], [], _Scanners, _Testers, InData, [InData]).

% process_term_aux([Term|MoreTerms], [Result|MoreResults], Scanners, Testers, InData, OutDataList) :-
% 	execute_scanners(Term, FirstResult, Scanners, InData, FirstOutData),
% 	((compound(FirstResult),
%       FirstResult =.. [';', Arg1, Arg2])
% 		->
% 		   process_term_aux([Arg1], [ResultArg1], Scanners, Testers, FirstOutData, OutDataList1),
% 		   process_term_aux([Arg2], [ResultArg2], Scanners, Testers, FirstOutData, OutDataList2),
% 		   Result =.. [';', ResultArg1, ResultArg2],
% 		   % LastOutDataList = [OutDataList1, OutDataList2]
% 		   append(OutDataList1, OutDataList2, LastOutDataList)
% 		;
% 			((compound(FirstResult), 
% 			FirstResult == Term, % Don't try to reprocess a processed term
% 			execute_testers(FirstResult, Testers))
% 				->
% 					FirstResult =.. [Functor|Args],
% 					process_term_aux(Args, ResultArgs, Scanners, Testers, FirstOutData, LastOutDataList),
% 					Result =.. [Functor|ResultArgs]
% 				;
% 					Result = FirstResult,
% 					LastOutDataList = [FirstOutData]
% 			)
% 	),
% 	process_term_list(MoreTerms, MoreResults, Scanners, Testers, LastOutDataList, OutDataList).


%% execute_testers(+Term, +Testers)
%
%     Applies Term to each of the predicates in the Testers list.
%

execute_testers(_Term, []).

execute_testers(Term, [Tester|MoreTesters]) :-
	apply(Tester, [Term]),
	execute_testers(Term, MoreTesters).


%% execute_scanners(+Term, -Result, +Scanners, +InData, -OutData)
%
%     Applies Term and InData to the first predicate of the Scanners
%     list in order to get a temporary Result and OutData. Then, these
%     Result and OutData are passed as Term and InData to the second
%     predicate of the Scanners list, and so on. In the last call, the
%     resulting values are unified with Result and OutData.
%

execute_scanners(Term, Term, [], OutData, OutData).

execute_scanners(Term, Result, [Scanner|MoreScanners], InData, OutData) :-
	apply(Scanner, [Term, NextTerm, InData, NextInData]),
	execute_scanners(NextTerm, Result, MoreScanners, NextInData, OutData).



%% disjunctive_normal_form(+Term, -DNF)
%
%    Transforms a term with conjunctions and disjunctions into its
%    disjunctive normal form (DNF).
%

disjunctive_normal_form(Term, DNF) :-
	disjunctive_normal_form_aux(Term, DNFList),
	list_to_disjunction(DNFList, DNF).
  
  %% disjunctive_normal_form_aux(+Term, -DNFList)
  %
  %    Helper predicate that transforms a term into a list of conjunctions
  %    representing its DNF.
  %
  
disjunctive_normal_form_aux(A, [[A]]) :-
  var(A), % Higher-order call
  !.

disjunctive_normal_form_aux((A, B), DNFList) :-
	!,
	disjunctive_normal_form_aux(A, DNFListA),
	disjunctive_normal_form_aux(B, DNFListB),
	combine_conjunctions(DNFListA, DNFListB, DNFList).
  
disjunctive_normal_form_aux((A ; B), DNFList) :-
	!,
	disjunctive_normal_form_aux(A, DNFListA),
	disjunctive_normal_form_aux(B, DNFListB),
	append(DNFListA, DNFListB, DNFList).
  
disjunctive_normal_form_aux(A, [[A]]).
  
  %% combine_conjunctions(+ListA, +ListB, -CombinedList)
  %
  %    Helper predicate that combines two lists of conjunctions.
  %
  
  combine_conjunctions([], _, []).
  
  combine_conjunctions([ConjA|RestA], ListB, CombinedList) :-
	combine_with_each(ConjA, ListB, CombinedConjs),
	combine_conjunctions(RestA, ListB, RestCombinedList),
	append(CombinedConjs, RestCombinedList, CombinedList).
  
  %% combine_with_each(+ConjA, +ListB, -CombinedConjs)
  %
  %    Helper predicate that combines a single conjunction with each
  %    conjunction in a list.
  %
  
  combine_with_each(_, [], []).
  
  combine_with_each(ConjA, [ConjB|RestB], [CombinedConj|RestCombinedConjs]) :-
	append(ConjA, ConjB, CombinedConj),
	combine_with_each(ConjA, RestB, RestCombinedConjs).
  
  %% list_to_disjunction(+List, -Disjunction)
  %
  %    Helper predicate that converts a list of conjunctions into a
  %    disjunction of conjunctions.
  %
  
  list_to_disjunction([], false).
  
  list_to_disjunction([Conj], Conjunction) :-
	!,
	list_to_conjunction(Conj, Conjunction).
  
  list_to_disjunction([Conj|Rest], (Conjunction ; RestDisjunction)) :-
	list_to_conjunction(Conj, Conjunction),
	list_to_disjunction(Rest, RestDisjunction).
  
  %% list_to_conjunction(+List, -Conjunction)
  %
  %    Helper predicate that converts a list of terms into a conjunction.
  %
  
  list_to_conjunction([Term], Term).
  
  list_to_conjunction([Term|Rest], (Term, RestConjunction)) :-
	list_to_conjunction(Rest, RestConjunction).
  
  
%% disjunction_to_list(+Disjunction, -List)
%
%    Converts a disjunction into a list of its disjuncts.
%

disjunction_to_list(Disjunction, List) :-
    disjunction_to_list(Disjunction, [], List).


%% disjunction_to_list(+Disjunction, +Acc, -List)
%
%    Helper predicate that performs the tail-recursive conversion.
%

disjunction_to_list((A ; B), Acc, List) :-
    !,
    disjunction_to_list(A, Acc, ListA),
    disjunction_to_list(B, ListA, List).

disjunction_to_list(A, Acc, [A|Acc]).


%% member_term_with_pattern(+SubTerm, +Term, +Pattern)
%
%    True if SubTerm is a sub-term of Term where 
%    Pattern = [X, Condition_on_X] and 
%    Condition_on_X holds for the subterm.
%

member_term_with_pattern(X,T,_Pattern) :-
  var(T),
  var(X),
  !,
  X==T.
member_term_with_pattern(_X,T,_Pattern) :-
  var(T),
  !,
  fail.
member_term_with_pattern(T,T,[T,Pattern]) :-
  Pattern.
member_term_with_pattern(X,T,Pattern) :-
  T =.. [_F|As],
  member_term_with_pattern_list(X,As,Pattern).

member_term_with_pattern_list(_X,[],_Pattern) :-
  !,
  fail.
member_term_with_pattern_list(X,[T|_Ts],Pattern) :-
  member_term_with_pattern(X,T,Pattern).
member_term_with_pattern_list(X,[_T|Ts],Pattern) :-
  member_term_with_pattern_list(X,Ts,Pattern).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicates for retrieving predicate names
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% get_predicates(-PredicateList)                                is det
%
%     Unifies PredicateList with the list of the names of all the
%     predefined predicates in SWI-Prolog.
%

get_predicates(Predicates) :-
	% Gets the list of SWI-Prolog modules
	setof(Mod, current_module(Mod), Modules),
	subtract(Modules, [bousi, bplHelp, bplShell, directivesBpl, evaluator,
	                   flags, foreign, parser, translator, utilities],
	         PrologModules),
	% Retrieves the full list of predicate names
	get_predicates_modules(PrologModules, UnsortedPredicates),
	% Sorts predicate names and removes duplicates
	sort(UnsortedPredicates, Predicates).


%% get_predicates_modules(+ModuleList, -PredicateList)
%
%     Unifies PredicateList with the list of the names of the
%     predicates that are available in each of the modules of the
%     ModuleList.
%

get_predicates_modules([], []).

get_predicates_modules([Module|MoreModules], Predicates) :-
	setof(Pred, Arity ^ current_predicate(Module:Pred/Arity), ModulePreds), !,
	get_predicates_modules(MoreModules, MorePredicates),
	append(ModulePreds, MorePredicates, Predicates).

get_predicates_modules([_Module|MoreModules], MorePredicates) :-
	% This rule is executed only if the predicates of Module can't
	% be retrieved; in that case the module is ignored
	get_predicates_modules(MoreModules, MorePredicates).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Predicates for simplifying a filename or an atom
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% simplify_filename(+Path, -SimplifiedFilename)
%
%     Extracts the filename part of Path, applies the simplify_atom/2
%     to it and unifies the resulting filename with SimplifiedFilename.
%
%     @see simplify_atom/2
%

simplify_filename(Path, SimplifiedFilename) :-
	file_base_name(Path, BaseFileWithExt),
	file_name_extension(BaseFile, _Extension, BaseFileWithExt),
	simplify_atom(BaseFile, SimplifiedFilename).


%% simplify_atom(+Atom, -SimplifiedAtom)
%
%     Replaces all the non-alphanumeric characters of Atom with
%     underscores, modifies its first character if it's not a lowercase
%     letter and returns the resulting atom in SimplifiedAtom.
%

simplify_atom(Atom, SimplifiedAtom) :-
	atom_chars(Atom, OriginalChars),
	simplify_chars(OriginalChars, SimplifiedChars),
	atom_chars(SimplifiedAtom, SimplifiedChars).


%% simplify_chars(+Chars, -SimplifiedChars)
%
%     Replaces all the non-alphanumeric characters of the Chars list
%     with underscores, changes the first character if it's not a
%     lowercase letter and returns the resulting character list in
%     SimplifiedChars.
%

%% simplify_chars_aux(+Chars, -SimplifiedChars, +FirstChar)
%
%     Internal predicate used by simplify_chars/2 which includes an
%     extra argument that indicates whether the next char in the Chars
%     list is going to be the first character of an atom.
%
%     @see simplify_chars/2
%

simplify_chars(OriginalChars, SimplifiedChars) :-
	simplify_chars_aux(OriginalChars, SimplifiedChars, yes).

simplify_chars_aux([], [], _First).

simplify_chars_aux([Char|MoreChars], [Char|MoreSimplifiedChars], _First) :-
	% Lowercase letters are always copied to the destination list
	char_type(Char, lower), !,
	simplify_chars_aux(MoreChars, MoreSimplifiedChars, no).

simplify_chars_aux([UpperChar|MoreChars], [LowerChar|MoreSimplifiedChars], yes) :-
	% Uppercase letters are replaced with their lowercase
	% counterparts if they're the first character of an atom
	char_type(UpperChar, upper(LowerChar)), !,
	simplify_chars_aux(MoreChars, MoreSimplifiedChars, no).

simplify_chars_aux([_Char|MoreChars], ['a'|MoreSimplifiedChars], yes) :-
	% Any character that isn't a letter is replaced with a lowercase letter
	% (in this case, 'a') when they're the first character of an atom
	simplify_chars_aux(MoreChars, MoreSimplifiedChars, no).

simplify_chars_aux([Char|MoreChars], [Char|MoreSimplifiedChars], no) :-
	% Uppercase letters and digits are allowed only if
	% they're not the first character of an atom
	(char_type(Char, upper) ; char_type(Char, digit)), !,
	simplify_chars_aux(MoreChars, MoreSimplifiedChars, no).

simplify_chars_aux([_Char|MoreChars], ['_'|MoreSimplifiedChars], no) :-
	% Any non-alphanumeric character is replaced with an underscore
	simplify_chars_aux(MoreChars, MoreSimplifiedChars, no).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous list-related predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% write_lines(+List, +Prefix, +Sufix)
%
%     Writes a list of terms in current output stream. Prefix and Sufix
%     strings will be added before and after every term, respectively.
%

write_lines([], _Prefix, _Sufix).

write_lines([Item], Prefix, Sufix) :-
 	write(Prefix), write(Item), write(Sufix).
%	write(Prefix), writeq(Item), write(Sufix).

write_lines([Item|List], Prefix, Sufix) :-
	List \== [],
	write_lines([Item], Prefix, Sufix), nl,
	write_lines(List, Prefix, Sufix).


writeq_lines([], _Prefix, _Sufix).

writeq_lines([Item], Prefix, Sufix) :-
	write(Prefix), writeq(Item), write(Sufix).

writeq_lines([Item|List], Prefix, Sufix) :-
	List \== [],
	writeq_lines([Item], Prefix, Sufix), nl,
	writeq_lines(List, Prefix, Sufix).


write_non_sim_equations([]).

write_non_sim_equations([sim(_,_,_)|Equations]) :-
  !,
  write_non_sim_equations(Equations).
  
write_non_sim_equations([Equation|Equations]) :-
  write(Equation), write('.'), nl,
%  writeq(Equation), write('.'), nl,
  write_non_sim_equations(Equations).
  

%% extract_terms(+Prefix, +Arity, +List, -Items)
%
%     Extracts all the compound terms from List that match template
%     "Prefix/Arity" and returns them in the Items list.
%
%     For example, given Prefix = 'sim' and Arity = 3, this predicate
%     will only return "sim(_, _, _)" terms.
%
%     @compat iso
%

extract_terms(Prefix, Arity, List, Items) :-
	atom(Prefix), integer(Arity),
	functor(Template, Prefix, Arity),
	findall(Template, member(Template, List), Items).


%% ascending_numbers(+List)                                      is det
%
%      Succeeds only if all the items of List are integer numbers and
%      they're in ascending order too.
%
%      @compat iso
%

%% ascending_numbers(+List, +Highest)
%
%      Internal predicate used by ascending_numbers/1 that includes
%      the highest number found.
%
%      @compat iso
%      @see ascending_numbers/1
%

ascending_numbers([]).

ascending_numbers([First|Values]) :-
	ascending_numbers(Values, First).

ascending_numbers([], _Highest).

ascending_numbers([Value|MoreValues], Highest) :-
	integer(Value),
	Value >= Highest,
	ascending_numbers(MoreValues, Value).


%% remove_prefixes(+List, -Result, +Prefix)
%
%     Extracts all the atoms of List that begin with Prefix sub-atom,
%     removes Prefix from all those atoms and returns them in Result.
%
%     For example, given List = ['atom1', 'other', 'atom_ex'] and
%     Prefix = 'atom', this predicate will return Result = ['1', '_ex'].
%
%     @compat iso
%

remove_prefixes([], [], _Prefix).

remove_prefixes([Atom|MoreAtoms], [AtomNoPrefix|MoreAtomsNoPrefix], Prefix) :-
    sub_atom(Atom, 0, Len, _, Prefix), !,
	% Atom begins with Prefix
	sub_atom(Atom, Len, _, 0, AtomNoPrefix),
	remove_prefixes(MoreAtoms, MoreAtomsNoPrefix, Prefix).

remove_prefixes([_Atom|MoreAtoms], MoreAtomsNoPrefix, Prefix) :-
	% Atom doesn't begin with Prefix
	remove_prefixes(MoreAtoms, MoreAtomsNoPrefix, Prefix).

	
%% remove_program_prefix(+Atom, -Result)
%
%     Removes the current program prefix from Atom and returns in Result.
%     If Atom does not include the program prefix, just returns Atom.
%

remove_program_prefix(Atom, Result) :-
  parser:program_prefix(Prefix),
  atom_concat(Prefix, '_', PrefixUS),
  atom_concat(PrefixUS, Result, Atom),
  !.
  
remove_program_prefix(Atom, Atom).


%% var_subtract(+Set, +Delete, -Result)
%
%     Similar to subtract(+Set, +Delete, -Result), but distinguishing
%     variables

var_subtract([], _, []) :-
  !.

var_subtract([A|C], B, D) :-
  var_memberchk(A, B), !,
  var_subtract(C, B, D).

var_subtract([A|B], C, [A|D]) :-
  var_subtract(B, C, D).


%% var_memberchk(?Elem, +List)
%
%     Similar to memberchk(?Elem, +List), but distinguishing
%     variables

var_memberchk(A, [B|_]) :- 
  A == B,
  !.

var_memberchk(A, [_|L]) :- 
  var_memberchk(A, L).



%% cond_filter_element(+Cond, +List, -FilteredList)
%
%    Filters out all occurrences of element from List that complies with Cond and returns the result in FilteredList.
%

cond_filter_element(_, [], []).

cond_filter_element(Cond, [Element|Rest], FilteredList) :-
	apply(Cond, [Element]),
    !,
    cond_filter_element(Cond, Rest, FilteredList).

cond_filter_element(Cond, [Other|Rest], [Other|FilteredList]) :-
    cond_filter_element(Cond, Rest, FilteredList).


var_or_empty_list(X) :-
  var(X),
  !.

var_or_empty_list([]).

%% link_last_variable(+List, +Term)
%
% Links (unifies) the last variable in List with Term
%
link_last_variable(List, Var) :-
  (List == [] ->
    true % Nothing to link with
   ;
    append(_, [Var], List),
    !
  ).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous string-related predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% remove_quotes(+String, ?FixedString)
%
%     Removes the initial and final quote characters of String and
%     returns the result in FixedString. If String is a list, this
%     predicate will copy all their items to FixedString, removing
%     the initial and final quote characters of every quoted string.
%

remove_quotes(String, FixedString) :-
	atom(String),
	is_quoted(String, '\''),
	sub_atom(String, 1, _, 1, FixedString), !.

remove_quotes(String, FixedString) :-
	atom(String),
	is_quoted(String, '\"'),
	sub_atom(String, 1, _, 1, FixedString), !.

remove_quotes(String, String) :-
	atom(String).

remove_quotes([], []).

remove_quotes([String|MoreStrings], [FixedString|MoreFixedStrings]) :-
	remove_quotes(String, FixedString),
	remove_quotes(MoreStrings, MoreFixedStrings).


%% is_quoted(+String, ?QuoteChar)
%
%     Succeeds if String starts and ends with QuoteChar character.
%

is_quoted(String, QuoteChar) :-
	sub_atom(String, 0, 1, _, QuoteChar),
	sub_atom(String, _, 1, 0, QuoteChar).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Miscellaneous predicates for interacting with files and the OS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% home_directory(?HomeDir)
%
%     Unifies HomeDir with the path to the user's home directory, which
%     is taken from $HOME environment variable on Unix/Linux or from
%     %HOMEDRIVE% and %HOMEPATH% environment variables on Windows.
%

home_directory(HomeDir) :-
	% Windows home folder
	current_prolog_flag(windows, true), !,
	getenv('HOMEDRIVE', HomeDrive), getenv('HOMEPATH', HomePath),
	concat_atom([HomeDrive, HomePath], HomeDir).

home_directory(HomeDir) :-
	% Unix/Linux home folder
	getenv('HOME', HomeDir).


%% file_is_newer(+File1, +File2)
%
%     Succeeds only if File1 is newer than File2, i.e., File1 has been
%     modified after File2.
%

file_is_newer(File1, File2) :-
	time_file(File1, ModTime1),
	time_file(File2, ModTime2),
	ModTime1 >= ModTime2.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Other miscellaneous predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% builtin(+Predicate)                                       is semidet
%
%     Succeeds only if Predicate is the head of a SWI-Prolog predefined
%     predicate or a predicate declared in any of the currently loaded
%     modules.
%
%     Since the user program is loaded in the evaluator module, user
%     predicates have to be identified as non-builtin.
%

builtin(Predicate) :-
	functor(Predicate, Functor, Arity),
	not(number(Functor)),
  ( builtin_encapsulated(Functor, Arity),
    !
    ;
    current_module(Module),
    Module \== test_prolog, % Needed for running the tests
    current_predicate(Module:Functor/Arity), 
    ( Module == evaluator,
      parser:program_prefix(Prefix), 
      atom_concat(Prefix, '_', UserModule),
      atom_concat(UserModule, _, Functor), % A user predicate is not a builtin
      !,
      fail
    ;
  	  !)).


builtin_encapsulated(eval_negation, 2).
builtin_encapsulated(bpl_maplist, 2).
builtin_encapsulated(bpl_apply, 2).

%% atom_is_variable(+Atom)                                   is semidet
%
%     Succeeds if Atom is an atomic term which starts with an uppercase
%     letter or an underscore character (_).
%

atom_is_variable(Atom) :-
	atomic(Atom),
  sub_atom(Atom, 0, 1, _, FirstChar),
	% atom_chars(Atom, [FirstChar|_]),
	(FirstChar == '_', ! ; char_type(FirstChar, upper)).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bousi-Prolog specific predicates
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% closure_properties(+Properties, ?Closure, ?TNorm)
%
%     Scans a list with the closure Properties of a fuzzy relation and
%     returns its Closure and TNorm numeric values, which can then be
%     used to invoke the ext_closure/5 foreign predicate.
%
%     Valid fuzzy relation properties are 'symmetric', 'reflexive' and
%     'transitive(TNorm)', where TNorm can be 'yes', 'no', 'min',
%     'product', 'luka', 'drastic', 'nilpotent' or 'hamacher'.
%

closure_properties(Properties, Closure, TNorm) :-
	is_list(Properties), !,
	% Extracts closure properties and t-norm name from list; fuzzy
	% relation properties are specified by a number which is a
	% combination of one or more of these flags:
	%  1 - Reflexive
	%  2 - Symmetric
	%  4 - Transitive
	% These are three common fuzzy binary relations:
	%  3 - Proximity relation (reflexive and symmetric)
	%  5 - Partial order (reflexive and transitive)
	%  7 - Similarity relation (reflexive, symmetric and transitive)
	(member(transitive(TNormName), Properties) ->
		(TNormName \== no ->
			NTransitive is 0b100
		;
			NTransitive is 0
		)			
	;
		(member(transitive, Properties) ->
			NTransitive is 0b100
		;
			NTransitive is 0
		)
	),
	(member(symmetric, Properties) ->
		NSymmetric is 0b010
	;
		NSymmetric is 0
	),
	(member(reflexive, Properties) ->
		NReflexive is 0b001
	;
		NReflexive is 0
	),
	Closure is NTransitive + NSymmetric + NReflexive,
	% Sets default t-norm if it doesn't appear in properties list
	(var(TNormName) ->
		TNormName = yes
	;
		true
	),
	% Gets t-norm identifier
	(TNormName == product ->
		TNorm is 2
	;
	(TNormName == luka ->
		TNorm is 3
	;
	(TNormName == drastic ->
		TNorm is 4
	;
	(TNormName == nilpotent ->
		TNorm is 5
	;
	(TNormName == hamacher ->
		TNorm is 6
	;
	% TNormName == yes / no / min
		TNorm is 1
	))))).


%% relation_name(?Symbol, ?Name)
%
%     Succeeds if Name is the internal name of the relation defined by
%     Symbol in BPL files.
%

relation_name('~', sim).
relation_name('<~', lEqThan).
relation_name('~>', gEqThan).
relation_name('~1~', frel1).
relation_name('~2~', frel2).
relation_name('~3~', frel3).
relation_name('~~', Name) :-
	flags:get_bpl_flag(weak_unification(Algorithm)),
  atomic_list_concat(['weak_unify_',Algorithm], Name).


%% relation_evaluator(?Relation, ?Evaluator)
%
%     Succeeds if Evaluator is the name of the predicate that is used
%     internally to compare two terms using a certain Relation.
%

relation_evaluator(lEqThan, e_lEqThan).
relation_evaluator(gEqThan, e_gEqThan).
relation_evaluator(frel1, e_frel1).
relation_evaluator(frel2, e_frel2).
relation_evaluator(frel3, e_frel3).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% append_goals(+Goals1,+Goals2,-Goals) Appends the two input
%   goals, returning a concatenated goal and excluding
%   true goals
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

append_goals(true, (A,B), C) :-
  !,
  append_goals(A,B,C).
append_goals((A,B), true, C) :-
  !,
  append_goals(A,B,C).
append_goals(true, true, true) :-
  !.
append_goals(true, A, A) :-
  !.
append_goals(A,true, A) :-
  !.
append_goals((A,B), C, E) :-
  !, 
  append_goals(B, C, D),
  append_goals(A, D, E).
append_goals(A, (B,C), (A,D)) :-
  !,
  append_goals(B, C, D).
append_goals(A, B, (A,B)).

append_goals_list([A],A).
append_goals_list([A,B|Gs],G) :-
  append_goals(A,B,C),
  append_goals_list([C|Gs],G).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% append_head_list(+List1,+List2,-List3) Appends each element
%   in List1 as the head of each list in List2,  
%   giving List3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

append_head_list([],[],[]).
append_head_list([X|Xs], [L2|L2s], [[X|L2]|L3s]) :-
  append_head_list(Xs, L2s, L3s).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% unzip(+List(Operator(LeftOp,RightOp)) +List(LeftOp) +List(RightOp))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

unzip([],[],[]).
unzip([P|Ps],[A|As],[B|Bs]) :-
  P=..[_Z,A,B],
  unzip(Ps,As,Bs).
  
  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% zip_with_cons_cons(+List(LeftOp), +List(RightOp), -List(List(Operator(LeftOp,RightOp))))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

zip_with_cons_cons([],_Bs,[]).
zip_with_cons_cons([_A|_As],[],[]).
zip_with_cons_cons([A|As],[B|Bs],[[[A,B]]|Ps]) :-
  zip_with_cons_cons(As,Bs,Ps).
  
  
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% map_1(+Goal, +List)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Map to exactly one argument (that can be a list)
map_1(_X,[]).
map_1(X,[Y|Ys]) :-
  my_apply(X,Y),
  map_1(X,Ys).

my_apply(my_apply(X,Y),Z) :-
  !,
  add_tup_arg(X,Y,T),
  my_apply(T,Z).
my_apply(X,Y) :-
  add_tup_arg(X,Y,T),
  call(T).

add_tup_arg(X,Y,T) :-
  X=..LX,
  append(LX,[Y],Ts),
  T=..Ts.


  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% n_copy_list(+List, +N, -Copies)
% Make n copies of List
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n_copy_list(_List, N, []) :-
  N=<0,
  !.

n_copy_list(List, N, [List|Copies]) :- 
  N>0,
  N1 is N-1,
  n_copy_list(List, N1, Copies).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% replace_first_functor_list_list(+List, +Functors, -ReplacedList)
% Replace the first functor in the first element of a list in a list
% by each functor in Functors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

replace_first_functor_list_list([], [], []).
replace_first_functor_list_list([[U|Us]|Xs], [F|Fs], [[V|Us]|Ys]) :-
  U =.. [_|Ts],
  V =.. [F|Ts],
  replace_first_functor_list_list(Xs, Fs, Ys).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% writef_to_atom(+Format, +Data, -Atom)
%   The output of (formatted) writef is sent to Atom
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

writef_to_atom(Format, Data, Atom) :-
	with_output_to(atom(Atom), writef(Format, Data)).


