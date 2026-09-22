% Generate the parametric benchmark hypo5.pl

:- initialization(gen).

gen :-
  N=600,
  gen(N),
  !.
    
gen(N) :-
  tell('hypo5.pl'),
  writeln(':-hypothetical(true).\n'),
  writeln(':-weak_unification(a3).\n'),
  writeln(':-indexing(false).\n'),
  writeln(':-transitivity(yes).\n'),
  nl,
  write_equs(N),
  nl,
  write('bench :- p(a1) => '),
  write_body(N),
  told.

write_equs(N) :-
  write_equs(1, N).

write_equs(I, N) :-
  I>=N,
  !.
write_equs(I, N) :-
  I1 is I+1,
  format('a~d~~a~d=0.5.\n',[I,I1]),
  write_equs(I1, N).

  
write_body(N) :-
  write_body(1, N).

write_body(N, N) :-
  format('p(a~d).\n', [N]),
  !.
write_body(I, N) :-
  I1 is I+1,
  format('p(a~d), ',[I]),
  write_body(I1, N).
