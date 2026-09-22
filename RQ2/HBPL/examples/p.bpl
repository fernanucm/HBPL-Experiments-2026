% :- filtering(false).

% :- domain(speed,0,100,knots).
% :- fuzzy_set(speed,[fast(0,0,10,20)]).

% fast(peter).
% very#fast(george).

% GOAL: somewhat#fast(X).

% :- domain(age,0,100,years).
% :- fuzzy_set(age, [young(0,0,30,50)]).

% john(young).

% young.

%:- fuzzy_logic(product).

%man~woman=0.8.
%man~ape=0.5.

%human~beast=0.7.
% :- transitivity(no).
%:- wn_connect('c:/fernan/research/BDDEDUC/DES/DESDevel/Fuzzy/WordNet/WordNet3.0').
:- wn_connect.
% :- wn_gen_prox_equations(wup, [[man, human, person], [love, like]]).
% :- wn_gen_prox_equations(wup, [[man:n:1,woman:n:1]]).
% :- wn_gen_prox_equations(path, [[grain:n:8, wheat:n:2]]).
%:- wn_gen_prox_equations(wup, [[man, human, person], [grain:n:8, wheat:n:2]]).
:- wn_gen_prox_equations(wup, auto).
% :- wn_gen_prox_equations(wup, [man]). % ERROR
% human(man).
meals([salad,pasta,spaghetti,steak,cake,apple]).

first_course(spaghetti).
first_course(salad).

second_course(steak).

dessert(cake).
dessert(apple).
dessert(coffe).

meal(First, Second, Dessert) :-
  first_course(First),
  first_course(Second),
  dessert(Dessert).


% human(human).
% man.
% human.
% woman.
% dream(human).
% hibernate(bear).
% love(woman,[tall(man)],[],strong(female)) :- like.
% taste.
% human.
% hominid.

% a~b=0.5.
% p(human):-p(man).
% p(love):-q(like).
% q(love).
% :- domain(pressure, 0, 250, kpa).
% :- fuzzy_set(pressure, [weak(0, 0, 30, 100),
% normal(60, 130, 190),
% strong(130, 190, 250)]).
% current_pressure(very#weak).

