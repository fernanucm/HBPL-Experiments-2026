%
% WordNet Sample File
%

:- transitivity(no).

% Connect to the WordNet database. 
% It must be previously installed and the WNDB 
% environment variable must be set to its location.
% The on-line BPLweb server has all this already installed.
:- wn_connect.

% Specify which words (concepts) must be related w.r.t. 
% the similarity information extracted from WordNet.
:- wn_gen_prox_equations(wup, auto).

% Meal categories
meal_categories([pasta,flesh,fish,dessert]).

% First courses
first_course(spaghetti).
first_course(ravioli).

% Second courses
second_course(steak).
second_course(tuna).

% Desserts
dessert_course(cake).
dessert_course(apple).

% A typical meal
meal(First, Second, Dessert) :-
  first_course(First),
  second_course(Second),
  dessert_course(Dessert).


% Goal examples:
% 
% Classical Prolog:
%
% BPL> first_course(X)
% X = spaghetti
% With approximation degree: 1.0 ;
% X = ravioli
% With approximation degree: 1.0 ;
% No answers
%
% Fuzzy Prolog:
%
% pasta is hypernonym of spaghetti. Even when the fact
% first_course(pasta) does not belong to the program,
% it succeeds because of the auto-generated proximity
% equation
%
% BPL> first_course(pasta)
% Yes
% With approximation degree: 0.9473684210526315 .
% Yes
%
