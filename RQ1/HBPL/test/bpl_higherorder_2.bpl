%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tests for BPL calls to higher order predicates and hypotheses
% (Prolog tests are in pl_higherorder.pl)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- weak_unification(a3).
:- degree_accumulator(true).
:- filtering(true).
:- transitivity(no).
:- hypothetical(true).

%
% List of tests
%

test_suite([test_ho_1, test_ho_2, test_ho_3, test_ho_4, 
            test_ho_5, test_ho_6, test_ho_7]).

%
% Tests 
%

test_ho_1 :-
  X = (a=>a), call(X).

test_ho_2 :-
  X = not (a=>a), not(X).
  
test_ho_3 :-
  X = (a=>not a), not call(X).
  
test_ho_4 :-
  X = not (a=>not a), call(X).

test_ho_5 :-
  X = ((a with 0.3)=>a), call(X).

test_ho_6 :-
  X = ((a with 0.3)=>a), not call(X).

test_ho_7 :-
  X = ((p:-a=>a)=>p), call(X).


approximation_degree(test_ho_5, 0.3). 
approximation_degree(test_ho_6, 0.7). 
