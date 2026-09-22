% Generate the parametric benchmark hypo7.pl

:- initialization(gen).

gen :-
  N=100000,
  gen(N),
  !.
    
gen(N) :-
  tell('hypo7.pl'),
  writeln(':-hypothetical(true).\n'),
  writeln(':-weak_unification(a3).\n'),
  writeln(':-indexing(false).\n'),
  writeln(':-transitivity(yes).\n'),
  nl,
  write('p1~p2=0.5.\n'),
  nl,
  write('bench :-\n  '),
  write_implications(N),
  write('p1,\n  fail.\n'),
  write('bench.\n'),
  nl,
  write_rules(N),
  told.

write_implications(_N) :-
  write('p2 => '),
  !.
write_implications(N) :-
  write_implications(0, N).
  
write_implications(N, N).
write_implications(I, N) :-
  I<N,
  I1 is I+1,
  format('p2 => ',[I1]),
  write_implications(I1, N).

  
write_rules(N) :-
  write_rules(1, N).

write_rules(I, N) :-
  I>N,
  !.
write_rules(I, N) :-
  format('p2.\n',[I]),
  I1 is I+1,
  write_rules(I1, N).
