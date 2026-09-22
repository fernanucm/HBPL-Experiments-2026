% Generate the parametric benchmark stocks-r....pl
:- use_module(library(apply)).

:- initialization(gen).

gen :-
  getenv('Equations',AtomEquations),
  getenv('Rules',AtomRules),
  getenv('HypoRules',AtomHypoRules),
  getenv('Assumptions',AtomAssumptions),
  atom_number(AtomEquations, Equations),
  atom_number(AtomRules, Rules),
  atom_number(AtomHypoRules, HypoRules),
  atom_number(AtomAssumptions, Assumptions),
  gen(Equations, Rules, HypoRules, Assumptions),
  !.
    
gen(Equations, Rules, HypoRules, Assumptions) :-
  generate_benchmark('stocks-r', Equations, Rules, HypoRules, Assumptions).

% generate_benchmark(+OutputFile, +E, +R, +A)
% Generates the complete benchmark file parameterized by:
% - OutputFile: Name of the generated file 
% - E: Number of equations
% - R: Number of base facts (rule base)
% - A: Depth of the nested hypothetical assumptions
generate_benchmark(OutputFile, E, R, H, A) :-
    atomic_list_concat([OutputFile, '_', E, '_', R, '_', H, '_', A, '.bpl'], ParamOutputFile),
    \+ exists_file(ParamOutputFile),
    !,
    format('Generating benchmark ~w...~n', [ParamOutputFile]),
    open(ParamOutputFile, write, Stream),
    write_header(Stream),
    write_proximity_equations(Stream, E),
    write_database_facts(Stream, R),
    write_rules(Stream),
    write_hypo_rules(Stream, H),
    write_nested_query_goal(Stream),
    close(Stream).
generate_benchmark(OutputFile, E, R, H, A) :-
    atomic_list_concat([OutputFile, '_', E, '_', R, '_', H, '_', A, '.bpl'], ParamOutputFile),
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

% 5. Write static core program rules with an hypothetical body
write_hypo_rules(Stream, H) :-
    format(Stream, "% Entry point for hypothetical rules~n", []),
    format(Stream, "invest(Name, Stock) :- invest_1(Name, Stock).~n~n", []),
    % 2. Launch the loop to print all intermediate chained rules
    format(Stream, "% Chained operational rules (H = ~d)~n", [H]),
    forall(between(1, H, I), write_single_hypo_rule(Stream, I, H)).

% Recursive Layer Case: Generates intermediate links pointing to the next layer (I + 1)
write_single_hypo_rule(Stream, I, H) :-
    I < H,
    !,
    NextLayer is I + 1,
    % Dynamically vary the graded certainty weight to add floating-point diversity
    Grade is 0.5 + (0.05 * (I mod 5)),
    format(Stream, "invest_~d(Name, Stock) :- ~n", [I]),
    format(Stream, "    shareholder(Name, stock_~d) => ~n", [I]),
    format(Stream, "    (stock_up(stock_~d) with ~1f) => ~n", [I, Grade]),
    format(Stream, "    invest_~d(Name, Stock).~n~n", [NextLayer]).

% Base Case: The final layer (I = H) terminates by pointing directly to true
write_single_hypo_rule(Stream, H, H) :-
    !,
    Grade is 0.5 + (0.05 * (H mod 5)),
    format(Stream, "invest_~d(Name, Stock) :- ~n", [H]),
    format(Stream, "    shareholder(Name, stock_~d) => ~n", [H]),
    format(Stream, "    (stock_up(stock_~d) with ~1f) => ~n", [H, Grade]),
    format(Stream, "    keep_stock(Name, Stock).~n~n", []).


% 6. Write the target goal
write_nested_query_goal(Stream) :-
    format(Stream, "% RQ2 Target Goal~n", []),
    format(Stream, "bench :- findall(S,~n", []),
    format(Stream, "         invest(paul, S),~n", []),
    format(Stream, "         Answers), length(Answers, L), write('Number of answers: '), writeln(L), setenv('Answers', L).", []).

