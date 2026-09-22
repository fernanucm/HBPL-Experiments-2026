:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_850,_850,1.0).
frel2(_878,_878,1.0).
frel3(_898,_898,1.0).
gEqThan(_794,_794,1.0).
lEqThan(_822,_822,1.0).



program_p(hypo([],0,[],_406),_426,_432,_408,_410):- =>([1-[]],program_a(hypo(_582,_584,_586,[_442|_406]),_426,_432,_408,_410),_442,_406).
program_a(hypo([],1,[_442|_406],_472),_498,_498,_480,_480):-reg(1,[],_1828),chk(_1828,_472).
