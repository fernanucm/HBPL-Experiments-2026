%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tests for BPL calls to higher order predicates 
% (Prolog tests are in pl_higherorder.pl)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- weak_unification(a3).
:- transitivity(no).

%
% List of tests
%

test_suite([test_ho_1, test_ho_2, test_ho_3, test_ho_4, test_ho_5,
            test_ho_6, test_ho_7, test_ho_8, test_ho_9, test_ho_10,
            test_ho_11, test_ho_12]).

%
% Tests 
%

a~b=0.8.
b~c=0.75.

eq(X,X).


test_ho_1 :-
  call(eq(a,b)).

test_ho_2 :-
  call((eq(a,b),eq(a,b))).
  
test_ho_3 :-
  call((eq(a,b),eq(b,c))).
  
test_ho_4 :-
  not(call((eq(a,b),eq(b,c)))).

test_ho_5 :-
  X=eq(a,b), call(X).

test_ho_6 :-
  X=(eq(a,b),eq(a,b)), call(X).
  
test_ho_7 :-
  X=(eq(a,b),eq(b,c)), call(X).
  
test_ho_8 :-
  X=not(call((eq(a,b),eq(b,c)))), call(X).

test_ho_9 :-
  X=not(call(eq(a,b))), call(X).

test_ho_10 :- not a~~b.

test_ho_11 :-
  eq(a,b), call(eq(b,c)).
  
test_ho_12 :-
  call(eq(a,b)), call(eq(b,c)).



approximation_degree(test_ho_1, 0.8). 
approximation_degree(test_ho_2, 0.8). 
approximation_degree(test_ho_3, 0). 
approximation_degree(test_ho_5, 0.8). 
approximation_degree(test_ho_6, 0.8). 
approximation_degree(test_ho_7, 0).
approximation_degree(test_ho_9, 0.19999999999999996).
approximation_degree(test_ho_10, 0.19999999999999996).
approximation_degree(test_ho_11, 0).
approximation_degree(test_ho_12, 0).
