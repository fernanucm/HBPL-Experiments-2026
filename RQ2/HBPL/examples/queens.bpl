% Queens example adapted to BPL from 
%   P. Julian-Iranzo, G. Moreno, J. Riaza, 
%   "The fuzzy logic programming language FASILL: Design and implementation, "
%   International Journal of Approximate Reasoning (2020).

:- weak_unification(a1).

queens(N) :-
	(queens(N, Xs), 1=0) ; 1=1.
	
queens(N, Qs) :-
	gen_list(N, Qs),
	place_queens(N, Qs, Ups, Downs).
	
	
gen_list(0, []).
gen_list(N, [Q|L]) :-
	N > 0,
	N1 is N-1,
	gen_list(N1, L).
	
	
place_queens(0, Qs, Ups, Downs).

place_queens(I, Qs, Ups, [D|Downs]) :-
	I > 0,
	I1 is I-1,
	place_queens(I1, Qs, [U|Ups], Downs),
	place_queen(I, Qs, Ups, Downs).
	
	
place_queen(Q, [Q|Qs] , [Q|Ups] , [Q|Downs]).

place_queen(Q, [Q1|Qs], [U|Ups] , [D|Downs]) :-
	place_queen(Q, Qs, Ups, Downs).