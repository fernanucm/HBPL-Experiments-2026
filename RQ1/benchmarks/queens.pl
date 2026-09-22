:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).
%:-module(program,[]).

%:-dynamic([main/0, queens/2, gen_list/2, place_queens/4]).


bench :- queens(10, _Qs), fail.
bench :- !.

queens(N, Qs) :-
	gen_list(N, Qs),
	place_queens(N, Qs, _Ups, _Downs).
	
gen_list(0, []).
gen_list(N, [_Q|L]) :-
	N > 0,
	N1 is N-1,
	gen_list(N1, L).
	
place_queens(0, _Qs, _Ups, _Downs).
place_queens(I, Qs, Ups, [_D|Downs]) :-
	I > 0,
	I1 is I-1,
	place_queens(I1, Qs, [_U|Ups], Downs),
	place_queen(I, Qs, Ups, Downs).
	
place_queen(Q, [Q|_Qs] , [Q|_Ups] , [Q|_Downs]).
place_queen(Q, [_Q1|Qs], [_U|Ups] , [_D|Downs]) :-
	place_queen(Q, Qs, Ups, Downs).