% Generate the parametric benchmark hypo3.pl

:- initialization(gen).

gen :-
  N=400,
  gen(N).
    
gen(N) :-
  tell('hypo3.pl'),
  writeln(':-hypothetical(true).\n'),
  writeln(':-weak_unification(a3).\n'),
  writeln(':-indexing(false).\n'),
  nl,
  writeln('bench :-'),
  writeln('  p,'),
  writeln('  fail.'),
  writeln('bench.'),
  nl,
  writeln('p :-'),
  write('  '),
  write_implications(N),
  write_body,
  told.
  
write_implications(N) :-
  write_implications(0, N).
  
write_implications(N, N) :-
  !.
write_implications(I, N) :-
  I<N,
  I1 is I+1,
  format('a => ',[]),
  write_implications(I1, N).

write_body :-
  format('a.\n',[]).

