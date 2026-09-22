% Generate the parametric benchmark hypo2.pl

:- initialization(gen).

gen :-
  N=3000,
  gen(N).
    
gen(N) :-
  tell('hypo2.pl'),
  writeln(':-hypothetical(true).\n'),
  writeln(':-weak_unification(a3).\n'),
  writeln(':-indexing(false).\n'),
  nl,
  writeln('bench :-'),
   format('  p(~d),\n',[N]),
  writeln('  fail.'),
  writeln('bench.'),
  nl,
  writeln('p(0) :-'), 
  writeln('  a.'),
  writeln('p(N) :-'),
  writeln('  N>0,'),
  writeln('  N1 is N-1,'),
  writeln('  (a => p(N1)).'),
  told.
  
