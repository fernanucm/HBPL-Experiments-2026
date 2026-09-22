%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tests for BPL calls to higher order predicates
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

test_suite([
  test_assert_retract_1, test_assert_retract_2, test_assert_retract_3,
  test_assert_retract_4, test_assert_retract_5,
  test_findall_1, test_findall_2, test_findall_3,
  test_setof_1, test_setof_2, test_setof_3
]).

%
% Tests 
%

a1~b1=0.3.

test_assert_retract_1 :-
  assert((p(X) :- X~~a1)),
  truth_degree(p(a1), 1.0),
  truth_degree(p(b1), 0.3),
  retract((p(X) :- X~~a1)).

test_assert_retract_2 :-
  X=(q:-b=>b),
  assert(X).

test_assert_retract_3 :-
  X=(q:-b=>b),
  retract(X).

test_assert_retract_4 :-
  X=(a1:-writeln(a1)),
  assert(X),
  truth_degree(a1, 1.0),
  truth_degree(b1, 0.3),
  retract(X).

test_assert_retract_5 :-
  X=(a1:-_G),
  assert(X).

test_findall_1 :-
  G = (X=a1;X=b1),
  findall(X, G, L),
  L=[a1, b1].

test_findall_2 :-
  G = (X=a1;X=b1),
  findall(X, (G, writeln(X)), L),
  L=[a1, b1].

test_findall_3 :-
  G=maplist(between(0, 1), U),
  length(U,3),
  findall(U,G,L), 
  L=[[0,0,0],[0,0,1],[0,1,0],[0,1,1],[1,0,0],[1,0,1],[1,1,0],[1,1,1]].

test_setof_1 :-
  G = (X=b1;X=a1),  % Note the order is switched compared to findall test
  setof(X, G, L),
  L=[a1, b1].       % setof sorts the results

test_setof_2 :-
  G = (member(X, [2,1,2,1])),
  setof(X, G, L),
  L=[1, 2].          % setof removes duplicates and sorts

test_setof_3 :-
  G=maplist(between(1,2), U),
  length(U,2),
  setof(U, G, L),
  L=[[1,1],[1,2],[2,1],[2,2]].

test_bagof_1 :-
  G = (X=b1;X=a1),  % Note: same goal as setof_1
  bagof(X, G, L),
  L=[b1, a1].       % bagof preserves original order

test_bagof_2 :-
  G = (member(X, [2,1,2,1])),
  bagof(X, G, L),
  L=[2,1,2,1].      % bagof keeps duplicates and order

test_bagof_3 :-
  G=maplist(=(1), U),
  length(U,2),
  bagof(U, G, L),
  L=[[1,1]].        % testing with a higher-order predicate


approximation_degree(test_assert_retract_5, 0).
