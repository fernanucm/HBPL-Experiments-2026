%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Bousi-Prolog DCG parser
/*    Adapted and modified from                          */
/*     Ciao Prolog DCG translator                        */
/*     with permission from its authors                  */

:- module(dcg, [
    my_phrase/3,
		dcg_translation/2      % +Term, -TranslatedTerm
   ]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- op(1200, xfx, '-->').
:- op(1100, xfy, ('|')). 

my_phrase(P, L, R) :-
  var(P), 
  !,
  throw(error(instantiation_error,context(phrase(P, L, R),phrase(P, L, R)))).
  
my_phrase(P, L, R) :- 
  dcg_translate_dcg(P, P1, L, R), 
  !,
	% Adds the degree and block constraints variables to the goals
	parser:add_degree_variables(P1, P1WithoutCtrsVars, _GoalDegreeVars),
  parser:add_block_constraints_variables(P1WithoutCtrsVars, ResultP1, _BlockConstraintsVars),
  call(evaluator:ResultP1).
  

dcg_translation(T1, T3) :-
  dcg_expansion_internal(T1, T2),
  T2 = T3.

  
dcg_expansion_internal('-->'((H,List),B), (H1:-B2,B1)) :-
  !,
	dcg_translate_dcg_atom(H, H1, S0, S1),
	dcg_translate_dcg(List, B2, S1, S),
	dcg_translate_dcg(B, B1, S0, S).
	
dcg_expansion_internal('-->'(H,B), ':-'(H1,B1)) :-
  dcg_translate_dcg_atom(H, H1, S0, S),
  dcg_translate_dcg(B, B1, S0, S).

  
dcg_translate_dcg(X, Y, S0, S) :-
  dcg_translate_dcg(X, Y0, Tail, S0, S),
  (Tail\==S0 -> 
    S=Tail, dcg_connect(X, Y0, Y)
    ;   
    dcg_connect(X, Y0, S=Tail, Y)
  ).


dcg_connect((_->_), X, X) :-
  X = (_->_), 
  !.
  
dcg_connect(_, (P->Q), ((P->Q),true)) :-
  !.
  
dcg_connect(_, X, X).

dcg_connect((_->_), (P->Q0), Eq, (P->Q)) :-
  !, 
  dcg_and(Q0, Eq, Q).
  
dcg_connect(_, (P->Q), Eq, ((P->Q),Eq)) :-
  !.
  
dcg_connect(_, X0, Eq, X) :-
  dcg_and(X0, Eq, X).
  

dcg_translate_dcg(X, Y, S, S0, S) :-
  var(X), 
  !,
  Y=my_phrase(X,S0,S).
  
dcg_translate_dcg([], true, S0, S0, _) :-
  !.
  
dcg_translate_dcg([X|Y], S0=S1, Tail, S0, _) :-
  !,
  append([X|Y],Tail,S1).
  
dcg_translate_dcg(\+X, (X1 -> fail; S=S0), S, S0, S) :-
  !,
  dcg_translate_dcg(X, X1, S1, S0, S1).
  
dcg_translate_dcg((X,Y), XandY, Tail, S0, S) :-
  !,
  dcg_translate_dcg(X, X1, S1, S0, S1),
  dcg_translate_dcg(Y, Y1, Tail, S1, S),
  dcg_and(X1, Y1, XandY).
  
dcg_translate_dcg((X->Y), (X1->Y1), Tail, S0, S) :-
  !,
  dcg_translate_dcg(X, X1, S1, S0, S1),
  dcg_translate_dcg(Y, Y1, Tail, S1, S).
  
dcg_translate_dcg(if(X,Y,Z), if(X1,Y1,Z1), S, S0, S) :-
  !,
  dcg_translate_dcg(X, X1, S0, S1),
  dcg_translate_dcg(Y, Y1, S1, S),
  dcg_translate_dcg(Z, Z1, S1, S).
  
dcg_translate_dcg((X;Y), (X1;Y1), S, S0, S) :-
  !,
  dcg_translate_dcg(X, X1, S0, S),
  dcg_translate_dcg(Y, Y1, S0, S).
  
dcg_translate_dcg('|'(X,Y), (X1;Y1), S, S0, S) :-
  !,
  dcg_translate_dcg(X, X1, S0, S),
  dcg_translate_dcg(Y, Y1, S0, S).
  
dcg_translate_dcg(!, !, S0, S0, _) :-
  !.
  
dcg_translate_dcg({G}, call(G), S0, S0, _) :-
  var(G), 
  !.
  
dcg_translate_dcg({G}, G, S0, S0, _) :-
  !.
  
dcg_translate_dcg(X, X1, S, S0, S) :-
  dcg_translate_dcg_atom(X, X1, S0, S).
  

dcg_and(X, Y, Z) :-
  X==true, 
  !, 
  Z=Y.
  
dcg_and(X, Y, Z) :- 
  Y==true, 
  !, 
  Z=X.
  
dcg_and(X, Y, (X,Y)).


dcg_translate_dcg_atom(X, X1, S0, S) :-
  functor(X, F, A),
  A1 is A+1,
  A2 is A+2,
  functor(X1, F, A2),
  arg(A1, X1, S0),
  arg(A2, X1, S),
  X  =.. [F|As],
  X1 =.. [F|A1s],
  append(As, _, A1s).
  
%%%%%%%%%%%%%%%  END dcg.pl  %%%%%%%%%%%%%%%
  
