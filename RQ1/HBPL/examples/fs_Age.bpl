%% Linguistic variable: age 
:-domain(age, 0, 100, years).
%% Linguistic labels
:-fuzzy_set(age, [young(0,0,20,40), middle(30, 40, 50, 65), old(50, 65, 100, 100)]).

%% FACTS: person(Name, Age).
person(juan,young).
person(maria,middle).
person(pablo,old).
person(antonio,somewhat#middle).
person(luis,very#young).
person(mario,about#age#32).

