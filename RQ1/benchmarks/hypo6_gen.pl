% Generate the parametric benchmark hypo6.pl

:- initialization(gen).

gen :-
  N=1000,
  gen(N),
  !.
    
gen(N) :-
  tell('hypo6.pl'),
  writeln(':-hypothetical(true).\n'),
  writeln(':-weak_unification(a3).\n'),
  writeln(':-indexing(false).\n'),
  writeln(':-transitivity(yes).\n'),
  nl,
  write_equs(N),
  nl,
  write('bench :- p(a1) => p(a1), fail.\n'),
  write('bench.\n'),
  nl,
  write_rules(N),
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

  
write_rules(N) :-
  write_rules(1, N).

write_rules(I, N) :-
  I>N,
  !.
write_rules(I, N) :-
  format('p(a~d).\n',[I]),
  I1 is I+1,
  write_rules(I1, N).
