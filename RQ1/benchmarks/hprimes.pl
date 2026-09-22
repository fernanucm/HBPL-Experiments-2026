:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).
%:-module(program,[]).

%:-dynamic([main/0, many_primes/1, primes/2, gen_ints/3, integers/3, sift/2, remove/3]).

bench :-
  many_primes(500).
  
many_primes(0).
many_primes(N) :-
  N>0,
	primes(100, _),
  N1 is N-1,
  many_primes(N1).


primes(Limit, Ps) :-
	(list(Is) :- gen_ints(2, Limit, Is))
	=>
	list(Is),
	sift(Is, Ps).
	
gen_ints(X, T, []) :-
  X>T.	
gen_ints(X, T, [X|Xs]) :-	
  X=<T,
  X1 is X+1,
  gen_ints(X1, T, Xs).

integers(Low, High, [Low | Rest]) :- 
	Low =< High,
	M is Low + 1,
	integers(M, High, Rest).
integers(Low, High, []) :-
  Low > High.

sift([], []).
sift([I | Is], [I | Ps]) :-
	remove(I, Is, New),
	sift(New, Ps).

remove(_P,[],[]).
remove(P,[I | Is], Nis0) :-
	I mod P =\= 0,
	Nis0 = [I | Nis],
	remove(P,Is,Nis).
remove(P,[I | Is], Nis) :-
	I mod P =:= 0,
	remove(P,Is,Nis).
