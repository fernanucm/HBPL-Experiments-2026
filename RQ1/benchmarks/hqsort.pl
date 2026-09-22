:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).
%:-module(program,[]).

%:-dynamic([main/0, gen_list/1, gen_list/3, qsort/3, partition/4]).

% generated: 16 November 1989
% option(s): SOURCE_TRANSFORM_1
%
%   qsort
%
%   David H. D. Warren
%   Copyright: Public domain
%
%   Adapted to assume the rule that generates a list
%

gen_list(L) :-
  gen_list(0, 800, L).
%  gen_list(0, 30, L).
   
gen_list(N,N,[]).
gen_list(I,N,[X|L]) :-
  I<N,
  X is N-I,
  I1 is I+1,
  gen_list(I1,N,L).

bench :-
  ((list(L) :- gen_list(L))
   =>
   list(L)),
  qsort(L,_,[]).

qsort([X|L],R,R0) :-
	partit(L,X,L1,L2),
	qsort(L2,R1,R0),
	qsort(L1,R,[X|R1]).
qsort([],R,R).

partit([X|L],Y,[X|L1],L2) :-
	X =< Y,
	partit(L,Y,L1,L2).
partit([X|L],Y,L1,[X|L2]) :-
  X > Y,
	partit(L,Y,L1,L2).
partit([],_,[],[]).
