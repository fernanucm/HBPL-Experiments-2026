%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tests for evaluating hypothetical reasoning in BPL
%
% Miscellaneous tests
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% :- degree_accumulator(false).
% :- indexing(true).
% :- weak_unification(a1).
:- hypothetical(true).

%
% List of tests
%

test_suite([test_example_1, test_example_2, test_example_3, 
            test_example_4, test_example_5, test_example_6, 
            test_example_7, test_example_8, test_example_9, 
            test_example_10, test_example_11, test_example_12,
            test_example_13, test_example_14]). 

%
% Additional queries
% (needed for adding new hypothetical rules at runtime)
%

additional_queries(['a=>a',
                    '((p:-q)/\\q)=>p',
                    'call(a=>a)',
                    'call((a(1) with 0.3)=>a(X)),X==1',
                    'G=(a=>a), call(G)',
                    'G=((a(1) with 0.3)=>a(X)), truth_degree(call(G), D), D =:= 0.3',
                    'findall(x,(a(1)/\\a(2)=>a(X)),[x,x])'
                    ]).
                    


%
% Example 1 
%

test_example_1 :-
   p.

p :- (q :- r with 0.5) /\ (r with 0.4) => q.


test_example_2 :-
   q => s.

s :- q with 0.3.


test_example_3 :-
   p(X),
   X==a.

p(X) :- ((r(X):-X=a) => r(X)).


test_example_4 :-
   findall(x, p4, L),
   L == [x, x].

p4 :- q => q => q.


test_example_5 :-
   p4(X),
   var(X).

p4(X) :- q(X) => q(1).


test_example_6 :-
   p6.

p6 :- a => \+ a.


test_example_7 :-
   p7.

p7 :- a => not a.


test_example_8 :-
   p8.

p8 :- (a with 0.3) => not a.


test_example_9 :-
   p9(a).

a~b=0.4.

p9(X) :- q(X,X) => q(b,X).


test_example_10 :-
   p10(_X).

p10(X) :- q(X,X) => q(a, b).


test_example_11 :-
  assert((p(X):-(a(a)=>b(X)))),
  truth_degree(p(a), D1),
  D1 =:= 1.0,
  truth_degree(p(b), D2),
  D2 =:= 0.4,
  retract((p(X):-(a(a)=>b(X)))).


test_example_12 :-
  a=>(a,(b=>b,(c=>c))).


test_example_13 :-
  apply(('=>'(a(1) with 0.3)), [a(X)]).


test_example_14 :-
  findall(X-D, (truth_degree((a(1) with 0.3) => a(X), D);truth_degree(((a(2) with 0.4) => a(X)),D)), L), L = [1-0.3, 2-0.4].

test_example_15 :-
  findall(D, truth_degree(a=>(a,(b=>b,(c=>c))),D),L), L = [0.4, 1.0, 0.4, 0.4].


% Expected approximation degrees 

approximation_degree(test_example_1, 0.4).
approximation_degree(test_example_2, 0.3).
approximation_degree(test_example_6, 0).
approximation_degree(test_example_7, 0).
approximation_degree(test_example_8, 0.7).
approximation_degree(test_example_9, 0.4).
approximation_degree(test_example_10, 0.4).
approximation_degree(test_example_12, 0.4).
approximation_degree(test_example_13, 0.3).
