:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).
%:-module(program,[]).

%:-dynamic([main/0, gen_list/1, gen_list/3, nreverse/2, concatenate/3]).

% generated: 25 October 1989
% option(s):
%
%   nreverse
%
%   David H. D. Warren
%   Copyright: Public domain
%
%   "naive"-reverse a list of 30 integers

% ?- time(run(main,'test/nrev.pl')).
% % 5,716,075 inferences, 5.234 CPU in 5.715 seconds (92% CPU, 1092026 Lips)
% true .


bench :-
  ((list(L) :- gen_list(L))
   =>
   list(L)),
  nreverse(L,_).

gen_list(L) :-
  gen_list(0, 1000, L).
%  gen_list(0, 10, L).
   
gen_list(N,N,[]).
gen_list(I,N,[I|L]) :-
  I<N,
  I1 is I+1,
  gen_list(I1,N,L).

nreverse([X|L0],L) :- nreverse(L0,L1), concatenate(L1,[X],L).
nreverse([],[]).

concatenate([X|L1],L2,[X|L3]) :- concatenate(L1,L2,L3).
concatenate([],L,L).