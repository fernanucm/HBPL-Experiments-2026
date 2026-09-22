%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Tests for evaluating hypothetical reasoning in BPL
%
% Higher Order built-ins
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- hypothetical(true).

%
% List of tests
%

test_suite([test_example_1, test_example_2, test_example_3, test_example_4, test_example_5, test_example_6]). 


%
% Example 1 
%

test_example_1 :-
   p.

a~b=0.4.
b~c=0.6.

p :- (q :- not a~~b) => q, b~~c.


test_example_2 :-
   G = (a/\a=>a), time(G).


test_example_3 :-
   time(once((a with 0.3)/\a=>a)).


test_example_4 :-
   call(a/\a=>a).


test_example_5 :-
   G = (a/\a=>a), call(G).


test_example_6 :-
   G = (a/\a=>a), once(G).


% test_example_7 :-
%    G = (a/\a=>a), findall(x, G, [x,x]).



% Expected approximation degrees 

approximation_degree(test_example_1, 0).
approximation_degree(test_example_3, 0.3).
