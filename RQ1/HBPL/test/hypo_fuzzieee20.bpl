%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tests for evaluating hypothetical reasoning in BPL
%
% Taken from the paper:
%   "A System implementing Fuzzy Hypothetical Datalog", 
%   IEEE International Conference on Fuzzy Systems (FUZZ-IEEE 2020),
%   Glasgow, UK, 2020
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- degree_accumulator(false).
:- indexing(true).
:- weak_unification(a1).
:- hypothetical(true).

%
% List of tests
%

test_suite([test_example_1, test_example_2, test_example_3]). 
%            test_example_5, test_example_7, test_example_9]).

stock_up(google) with 0.9.

stock_up(greek_bonds) with 0.2.


shareholder(paul,google).

shareholder(paul,greek_bonds).


keep_stock(Name, Stock) :-
  shareholder(Name, Stock), 
  stock_up(Stock).


profitable_stocks(Name, Stock) :-
  (((stock_up(amazon) with 0.7) /\
    shareholder(paul,amazon)) => keep_stock(Name, Stock)).

raising_google_stocks :-
  ((stock_up(google) with 0.6) => stock_up(google)).


%
% Example 1 
%

test_example_1 :-
   findall(Name-Stock-Degree, truth_degree(keep_stock(Name, Stock), Degree), [paul-google-0.9, paul-greek_bonds-0.2]).


%
% Example 2
%

test_example_2 :-
   findall(Name-Stock-Degree, truth_degree(profitable_stocks(Name, Stock), Degree), [paul-google-0.9, paul-greek_bonds-0.2, paul-amazon-0.7]).


%
% Example 3
%

test_example_3 :-
   findall(Degree, truth_degree(raising_google_stocks, Degree), [0.9, 0.6]).



