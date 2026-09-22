% Generate the parametric benchmark stocks-s....pl
:- use_module(library(apply)).

:- initialization(gen).

gen :-
  getenv('Equations',AtomEquations),
  getenv('Rules',AtomRules),
  getenv('Assumptions',AtomAssumptions),
  atom_number(AtomEquations, Equations),
  atom_number(AtomRules, Rules),
  atom_number(AtomAssumptions, Assumptions),
  gen(Equations, Rules, Assumptions),
  !.
    
gen(Equations, Rules, Assumptions) :-
  generate_benchmark('stocks-s', Equations, Rules, Assumptions).

% generate_benchmark(+OutputFile, +E, +R, +A)
% Generates the complete benchmark file parameterized by:
% - OutputFile: Name of the generated file 
% - E: Number of equations
% - R: Number of base facts (rule base)
% - A: Depth of the nested hypothetical assumptions
generate_benchmark(OutputFile, E, R, A) :-
    atomic_list_concat([OutputFile, '_', E, '_', R, '_', A, '.bpl'], ParamOutputFile),
    \+ exists_file(ParamOutputFile),
    !,
    format('Generating benchmark ~w...~n', [ParamOutputFile]),
    open(ParamOutputFile, write, Stream),
    write_header(Stream),
    write_proximity_equations(Stream, E),
    write_database_facts(Stream, R),
    write_rules(Stream),
    write_nested_query_goal(Stream, A),
    close(Stream).
generate_benchmark(OutputFile, E, R, A) :-
    atomic_list_concat([OutputFile, '_', E, '_', R, '_', A, '.bpl'], ParamOutputFile),
    format('Benchmark already exists: ~w.~n',ParamOutputFile).

% 1. Write HBPL system directives
write_header(Stream) :-
    format(Stream, ":- hypothetical(true).~n", []),
    format(Stream, ":- weak_unification(a3).~n", []),
    format(Stream, ":- indexing(false).~n~n", []).

% % 2. Write the proximity relation matrix
% =========================================================================
% write_proximity_equations(+Stream, +Equations)
%
% Generates a fully transitively closed connected component (clique) 
% between 'young', 'middle', and all intermediate 'middleI' nodes.
% Parameterized by the number of step equations.
% =========================================================================
write_proximity_equations(Stream, Equations) :-
    format(Stream, "% Proximity relation matrix inducing a fully connected transitive component~n", []),
    % Fixed baseline equation from the stock market example
    format(Stream, "middle ~~ old = 0.5.~n", []),
    
    % Generate all unique pairs (I, J) such that 0 <= I < J <= Equations
    forall(
        (between(0, Equations, I), between(0, Equations, J), I < J),
        write_transitively_closed_arc(Stream, I, J, Equations)
    ),
    format(Stream, "~n", []).

% --- Helper Predicates for Transitive Closure Generation ---

% Generates and prints a single arc between node index I and node index J
write_transitively_closed_arc(Stream, I, J, Total) :-
    % 1. Map numerical indices to their corresponding HBPL identifiers
    node_identifier(I, Total, NodeA),
    node_identifier(J, Total, NodeB),
    
    % 2. Calculate the transitive degree (minimum of all intermediate steps)
    calculate_transitive_degree(I, J, Degree),
    
    % 3. Print the formatted proximity equation to the stream
    format(Stream, "~w ~~ ~w = ~2f.~n", [NodeA, NodeB, Degree]).

% Maps indices to text representations: 0 -> young, Total -> middle, others -> middleI
node_identifier(0, _, young) :- !.
node_identifier(Total, Total, middle) :- !.
node_identifier(I, _, NodeName) :-
    atom_concat(middle, I, NodeName).

% Computes the correct fuzzy degree under the minimum t-norm for any shortcut path
calculate_transitive_degree(I, J, Degree) :-
    % Collect the baseline weights of all single-step links between I and J
    findall(StepWeight, (
        between(I, J, K), 
        K < J, 
        base_step_weight(K, StepWeight)
    ), Weights),
    % The transitive composition under Gödel logic is the minimum of the path weights
    min_list(Weights, Degree).

% Deterministic baseline weight generator for each single-step link (K -> K+1)
base_step_weight(K, Weight) :-
    Weight is 0.6 + (0.02 * ((K + 1) mod 5)).



% 3. Write database facts scaled by N
write_database_facts(Stream, N) :-
    format(Stream, "% Scaled Database Facts (N = ~d)~n", [N]),
    format(Stream, "middle(paul).~n", []),
    format(Stream, "old(mary).~n~n", []),
    % Original baseline facts
    format(Stream, "shareholder(paul, google).~n", []),
    format(Stream, "shareholder(paul, greek_bonds).~n", []),
    format(Stream, "shareholder(mary, google).~n~n", []),
    format(Stream, "stock_up(google) with 0.9.~n", []),
    format(Stream, "stock_up(greek_bonds) with 0.2.~n", []),
    % Injection of mass scale facts to stress the weak unification algorithm
    forall(between(1, N, I), (
        format(Stream, "shareholder(paul, stock_~d).~n", [I]),
        format(Stream, "stock_up(stock_~d) with 0.2.~n", [I])
    )),
    format(Stream, "~n", []).

% 4. Write static core program rules
write_rules(Stream) :-
    format(Stream, "% Core Rules~n", []),
    format(Stream, "keep_stock(Name, Stock) :- shareholder(Name, Stock), (stock_up(Stock); young(Name)).~n", []),
    format(Stream, "sell_stock(Name, Stock) :- shareholder(Name, Stock), stock_down(Stock), old(Name).~n~n", []).

% 5. Write the target goal with deeply nested implications (Depth K)
write_nested_query_goal(Stream, K) :-
    format(Stream, "% RQ2 Target Goal: Nested Implication Structure (Depth K = ~d)~n", [K]),
    format(Stream, "bench :- findall(S,~n", []),
    % Recursively construct the structural layout of the body
    build_nested_string(K, K, NestedString),
    format(Stream, "    ~w,~n    Answers), length(Answers, L), write('Number of answers: '), writeln(L), setenv('Answers', L).", [NestedString]).

% Base case: At the bottom of the nesting chain, invoke the final consequent
build_nested_string(_, 0, " keep_stock(paul, S)") :- !. % No assumptions
build_nested_string(0, _, "=> keep_stock(paul, S)") :- !.
% Recursive case: Build "Assumption => (Next_Layer)"
build_nested_string(K, N, Result) :-
    K > 0,
    K1 is K - 1,
    (K=N -> Join='' ; Join = ' /\\'),
    build_nested_string(K1, N, Inner),
    % Dynamically vary the graded certainty weight in each layer to avoid static caching
    Grade is 0.5 + (0.05 * (K mod 5)), 
    format(string(Result), "~w shareholder(paul, amazon_~d) /\\ (stock_up(amazon_~d) with ~1f) ~w", [Join, K, K, Grade, Inner]).
