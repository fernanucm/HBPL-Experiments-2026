% Generate the parametric benchmark hypo1.pl

:- initialization(gen).

gen :-
  N=500,
  gen(N),
  !.
    
gen(N) :-
  tell('hypo1.pl'),
  writeln(':-hypothetical(true).\n'),
  writeln(':-weak_unification(a3).\n'),
  writeln(':-indexing(false).\n'),
  nl,
  write('bench :- '),
  write_implications(N),
  write_body(N),
  told.
  
write_implications(N) :-
  write_implications(0, N).
  
write_implications(N, N).
write_implications(I, N) :-
  I<N,
  I1 is I+1,
  format('a~d => ',[I1]),
  write_implications(I1, N).

write_body(N) :-
  write_body(0, N).

write_body(N, N).
write_body(I, N) :-
  I is N-1,
  format('a~d.\n',[N]).
write_body(I, N) :-
  N1 is N-1,
  I<N1,
  I1 is I+1,
  format('a~d, ',[I1]),
  write_body(I1, N).
