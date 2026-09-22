:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_15040,_15040,1.0).
frel2(_15160,_15160,1.0).
frel3(_15280,_15280,1.0).
gEqThan(_14806,_14806,1.0).
lEqThan(_14920,_14920,1.0).



program6_p(hypo([],0,[],_6800),_7820,_7990,_7364,_7500):-program6_q(1,hypo(_8392,_8394,_8396,_6800),_7820,_7826,_7364,_7370),program6_q(2,hypo(_8628,_8630,_8632,_6800),_7826,_7990,_7370,_7500).
program6_q(_19490,hypo([],1,[],_12202),_12956,_12962,_12784,_12790):-unify_arguments_a3([[_19490,_984,_12956,_12962,_19496]]),degree_composition([_12784,_19496],_12790).
