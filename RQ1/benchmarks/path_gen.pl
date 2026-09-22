:- hypothetical(false).
:- weak_unification(a3).
:- indexing(false).
gen :-
  N=3000,
%  N=4,
  gen(N).
    
gen(N) :-
  tell('path.pl'),
  writeln(':-module(program, []).\n'),
  writeln(':-dynamic([main/0, many_path/1, path/2, arc/2]).\n'),
  writeln('bench :-'),
  writeln('  many_path(200).'),
  nl,
  writeln('many_path(0).'),
  writeln('many_path(N) :-'),
  writeln('  N>0,'),
  write('  '),
  write_goal(N),
  nl,
  writeln('  N1 is N-1,'),
  writeln('  many_path(N1).'),
  nl,
  writeln('path(X,Y) :-'),
  writeln('  arc(X,Y).'),
  writeln('path(X,Y) :-'),
  writeln('  arc(X,Z),'),
  writeln('  path(Z,Y).'),
  nl,
  write_arcs(N),
  told.
 
write_goal(N) :-
  format('path(~d,~d).\n',[1,N]).

write_arcs(N) :-
  write_arcs(1, N).
  
write_arcs(N, N) :-
  !.
write_arcs(I, N) :-
  I<N,
  I1 is I+1,
  format('arc(~d,~d).\n',[I,I1]),
  write_arcs(I1, N).


