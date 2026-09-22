%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tests for evaluating hypothetical reasoning in BPL
%
% Taken from the paper:
%   "Planning for an Efficient Implementation of Hypothetical 
%    Bousi-Prolog", 
%   P. Julian-Iranzo and F. Saenz-Perez, 
%   Theory and Practice of Logic Programming, 21(5), pp. 680-697, 
%   37th International Conference on Logic Programming (ICLP'2021),
%   Special Issue, 2021.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- degree_accumulator(false).
:- indexing(true).
:- weak_unification(a1).
:- hypothetical(true).

%
% List of tests
%

test_suite([test_example_1, test_example_2, test_example_3, 
            test_example_5, test_example_7, test_example_9, 
            test_example_10]).

%
% Example 1 at page 3
%

test_example_1 :-
   a.

a :- (d => b), e.

b :- c.

c :- d.

e.


test_example_2 :-
   p.

p :- q => q.


test_example_3 :-
   p(_X).

p(X) :- g(X), (q(X) => r).

g(1).

r :- q(2).


% Example 4 in the paper is the same program and goal as Example 2


test_example_5 :-
   findall(x, p5, [x, x]). % There must be two solutions

p5 :- q => q => q.


% Example 6 in the paper is the same program and goal as Example 3


test_example_7 :-
   p7.

p7 :- g(X, Y), (q(X, Y) => q(1, 2)).

g(X, X).


% Example 8 in the paper is the same program and goal as Example 3

test_example_9 :-
   p9(X), X==1.

p9(X) :- g9(X), (q9(X) => r9) with 0.8.

g9(1) with 0.7.

r9 :- q9(1) with 0.9.


% Example 9 in the paper adapted to get a solution (q(1) instead of q(2))

test_example_10 :-
  truth_degree(s10(X), Degree1),
  X =:= 1,
  Degree1 =:= 0.6,
  truth_degree(p10(Y), Degree2),
  Y =:= 1,
  Degree2 =:= 0.7.

p10~s10 = 0.6.

p10(X) :- g10(X), (q10(X) => r10) with 0.8.

g10(1) with 0.7.

r10 :- q10(1) with 0.9.



% Expected approximation degrees 

approximation_degree(test_example_1, 1.0).
approximation_degree(test_example_2, 1.0).
approximation_degree(test_example_3, 0).
approximation_degree(test_example_5, 1.0).
approximation_degree(test_example_7, 0).
approximation_degree(test_example_9, 0.7).
