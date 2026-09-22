:- hypothetical(false).
:- weak_unification(a3).
:- indexing(false).

:- initialization(gen).

gen :-
  N=400,
%  N=4,
  gen(N).
    
gen(N) :-
  tell('hpath.pl'),
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
  write_body(N),
  nl,
  writeln('path(X,Y) :-'),
  writeln('  arc(X,Y).'),
  writeln('path(X,Y) :-'),
  writeln('  arc(X,Z),'),
  writeln('  path(Z,Y).'),
  told.
  
write_implications(N) :-
  write_implications(1, N).
  
write_implications(N, N) :-
  !.
write_implications(I, N) :-
  I<N,
  I1 is I+1,
  format('arc(~d,~d) => ',[I,I1]),
  write_implications(I1, N).

write_body(N) :-
  format('path(~d,~d).\n',[1,N]).


