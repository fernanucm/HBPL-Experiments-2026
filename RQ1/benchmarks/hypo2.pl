:-hypothetical(true).

:-weak_unification(a3).

:-indexing(false).


bench :-
  p(3000),
  fail.
bench.

p(0) :-
  a.
p(N) :-
  N>0,
  N1 is N-1,
  (a => p(N1)).
