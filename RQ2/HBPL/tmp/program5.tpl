:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_1052,_1052,1.0).
frel2(_1080,_1080,1.0).
frel3(_1200,_1200,1.0).
gEqThan(_996,_996,1.0).
lEqThan(_1024,_1024,1.0).



program5_a(hypo([],0,[],_436),_456,_462,_438,_440):-program5_b(hypo(_468,_470,_472,_436),_456,_462,_438,_440).
program5_b(hypo([],1,[],_602),_622,_628,_604,_606):- =>([2-[]],program5_a(hypo(_778,_780,_782,[_638|_602]),_622,_628,_604,_606),_638,_602).
program5_b(hypo([],2,[_638|_602],_668),_694,_694,_676,_676):-reg(2,[],_7136),chk(_7136,_668).
