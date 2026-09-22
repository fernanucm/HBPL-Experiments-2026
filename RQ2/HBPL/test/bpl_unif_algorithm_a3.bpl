%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tests for evaluating weak unification algorithm a2
% bpl_unif_algorithm_a2.bpl

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- weak_unification(a3).
:- transitivity(no).

%
% List of tests
%

test_suite([test_a3_1,  test_a3_2,  test_a3_3,  test_a3_4,
            test_a3_5,  test_a3_6,  test_a3_7,  test_a3_8,
            test_a3_9,  test_a3_10, test_a3_11, test_a3_12,
            test_a3_13, test_a3_14, test_a3_15, test_a3_16,
            test_a3_17, test_a3_18, test_a3_19, test_a3_20,
            test_a3_21, test_a3_22, test_a3_23, test_a3_24, 
            test_a3_25, test_a3_26, test_a3_27, test_a3_28,
            test_a3_29, test_a3_30, test_a3_31, test_a3_32,
            test_a3_33, test_a3_34, test_a3_35, test_a3_36,
            test_a3_37, test_a3_38, test_a3_39, test_a3_40,
            test_a3_41, test_a3_42, test_a3_43, test_a3_44,
            test_a3_45, test_a3_46, test_a3_47, test_a3_48,
            test_a3_49, test_a3_50, test_a3_51
          ]).

%
% Tests 
%

a~b=0.8.
b~c=0.75.

n :- not(p(b, c)).

t(X) :- a~b = X.

p(a,c).

p(X):-q(X), r(X).

q(c).

r(a).

s(b).

eq(X, X).


/* 
 Complete Weak Unification Algorithm:
 p(X,X) fails
 p(b,b) fails
 p(X) fails
 p(b) fails
 s fails
*/

test_a3_1 :-
  not(p(X, X)).

test_a3_2 :-
  not(p(b, b)).
  
test_a3_3 :-
  not(p(_X)).
  
test_a3_4 :-
  not(p(b)).

test_a3_5 :-
  t(X),
  X == 0.8.

test_a3_6 :-
  not(eq(a,b)), eq(b,c).

test_a3_7 :-
  not((eq(a,b), eq(b,c))).

% Does fail: s(a) returns a degree less than 1
test_a3_8 :-
  \+(\+(s(a))).

% Does not fail: s(b) returns a degree 1
test_a3_9 :-
  \+(\+(s(b))).

% Does fail because there are two blocks (a-b and b-c)
test_a3_10 :-
  s(a), s(c).

% Does fail because there are two blocks (a-b and b-c)
test_a3_11 :-
  X = s(c), s(a), X.

% Does not fail: negation of above
test_a3_12 :-
  \+((s(a), s(c))).

% Does fail: the outer crisp negation fails because \+s(c) is not completely false (it succeeds with approximation degree 0.75)
test_a3_13 :-
  s(a), \+(\+(s(c))).

% Does not fail because: \+(s(c)) succeeds (s(c) fails because block clash) and the last goal s(b) succeeds (only one block a-b in the constraint store)
test_a3_14 :-
  s(a), \+(s(c)), s(b).

% Does fail because: \+(s(c)) succeeds (s(c) fails because block clash) and the last goal s(c) fails
test_a3_15 :-
  s(a), \+(s(c)), s(c).

% Does fail: \+(\+(s(c))) fails because s(c) fails because block clash
test_a3_16 :-
  s(a), \+(\+(s(c))), s(b).

% Does fail: first HO version of test_a3_10
test_a3_17 :-
  X = (s(a), s(c)), X.

% Does fail: second HO version of test_a3_11
test_a3_18 :-
  X = s(c), s(a), X.

% Does not fail: HO version of test_a3_12
test_a3_19 :-
  X = (s(a), s(c)), \+(X).

% Does fail: HO version of test_a3_13
test_a3_20 :-
  X = (s(a), \+(\+(s(c)))), X.

% Does not fail: HO version of test_a3_14
test_a3_21 :-
  X = \+(s(c)), s(a), X, s(b).

% Does fail: HO version of test_a3_15
test_a3_22 :-
  X = \+(s(c)), s(a), X, s(c).

% Does fail: HO version of test_a3_16
test_a3_23 :-
  X = \+(\+(s(c))), s(a), X, s(b).

% Does not fail
test_a3_24 :-
  s(a), not(s(c)).

% Does fail
test_a3_25 :-
  not(s(b)), s(c).

% Does fail
test_a3_26 :-
  s(a), not(not(s(c))).

% Does not fail
test_a3_27 :-
  s(a), not(not(s(b))).

% Does fail
test_a3_28 :-
  s(a) -> s(c) ; true.

% Does not fail
test_a3_29 :-
  s(a) -> s(b) ; true.

% Does not fail
test_a3_30 :-
  (s(a), s(c)) -> s(b) ; true.

% Does not fail
test_a3_31 :-
  (s(a), s(c)) -> s(b) ; s(a).

% Does not fail
test_a3_32 :-
  X = not(s(c)), s(a), X.

% Does fail
test_a3_33 :-
  X = not(s(b)), X, s(c).

% Does fail
test_a3_34 :-
  X = not(not(s(c))), s(a), X.

% Does not fail
test_a3_35 :-
  X = not(not(s(b))), s(a), X.

% Does fail
test_a3_36 :-
  X = s(a), X -> s(c) ; true.

% Does not fail
test_a3_37 :-
  X = s(b), s(a) -> X ; true.

% Does not fail
test_a3_38 :-
  X = (s(a), s(c)), X -> s(b) ; true.

% Does not fail
test_a3_39 :-
  X = (s(a), s(c)), X -> s(b) ; s(a).

% Does fail
test_a3_40 :-
  X=s(a), catch(X, _M, true), s(c).

% Does not fail
test_a3_41 :-
  X=s(a), catch(X, _M, true), s(b).

% Does fail
test_a3_42 :-
  X=s(a), truth_degree(X, 0.8), s(c).

% Does not fail
test_a3_43 :-
  X=s(a), truth_degree(X, 0.8), truth_degree(s(c), 0.0).

% Does not fail
test_a3_44 :-
  catch((s(a);s(b)), _M, s(c)), s(c).

% Does not fail: apply succeeds with s(c)
test_a3_45 :-
  X = s,
  apply(X, [c]).

% Does fail: apply fails with s(c) due to block clash with s(a)
test_a3_46 :-
  X = s,
  s(a),
  apply(X, [c]).

% Does not fail: maplist succeeds with s/1 on list of terms that unify
test_a3_47 :-
  X = s,
  maplist(X, [a,b]).

% Does fail: maplist fails with s/1 due to block clash between a and c
test_a3_48 :-
  X = s,
  maplist(X, [a,b,c]).

% Does not fail: maplist succeeds with s/1 on list of terms that unify
test_a3_49 :-
  forall(member(X, [a,b,c]), apply(s, [X])), s(a).

% Does not fail: maplist succeeds with s/1 on list of terms that unify
test_a3_50 :-
  s(a), forall(s(c), s(b)), s(b).

% Does fail: maplist succeeds with s/1 on list of terms that unify
test_a3_51 :-
  s(a), forall(s(c), s(b)), s(c).


approximation_degree(test_a3_6,  0). 
approximation_degree(test_a3_8,  0). 
approximation_degree(test_a3_10, 0). 
approximation_degree(test_a3_11, 0). 
approximation_degree(test_a3_13, 0). 
approximation_degree(test_a3_14, 0.8). 
approximation_degree(test_a3_15, 0).
approximation_degree(test_a3_16, 0).
approximation_degree(test_a3_17, 0).
approximation_degree(test_a3_18, 0).
approximation_degree(test_a3_20, 0).
approximation_degree(test_a3_21, 0.8). 
approximation_degree(test_a3_22, 0).
approximation_degree(test_a3_23, 0).
approximation_degree(test_a3_24, 0.8).
approximation_degree(test_a3_25, 0).
approximation_degree(test_a3_26, 0).
approximation_degree(test_a3_27, 0.8).
approximation_degree(test_a3_28, 0).
approximation_degree(test_a3_29, 0.8).
approximation_degree(test_a3_31, 0.8).
approximation_degree(test_a3_32, 0.8).
approximation_degree(test_a3_33, 0).
approximation_degree(test_a3_34, 0).
approximation_degree(test_a3_35, 0.8).
approximation_degree(test_a3_36, 0).
approximation_degree(test_a3_37, 0.8).
approximation_degree(test_a3_39, 0.8).
approximation_degree(test_a3_40, 0).
approximation_degree(test_a3_41, 0.8).
approximation_degree(test_a3_42, 0).
approximation_degree(test_a3_44, 0.75).
approximation_degree(test_a3_45, 0.75).
approximation_degree(test_a3_46, 0).
approximation_degree(test_a3_47, 0.8).
approximation_degree(test_a3_48, 0).
approximation_degree(test_a3_49, 0.8).
approximation_degree(test_a3_50, 0.8).
approximation_degree(test_a3_51, 0).