:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_4020,_4020,1.0).
frel2(_4140,_4140,1.0).
frel3(_4260,_4260,1.0).
gEqThan(_3786,_3786,1.0).
lEqThan(_3900,_3900,1.0).



p_a(hypo([],0,[],_890),_910,_910,_892,_894):-degree_composition([0.3,_892],_894).
p_stock_up(_5506,hypo([],1,[],_1192),_1212,_1218,_1194,_1196):-unify_arguments_a3([[_5506,google,_1212,_1218,_5512]]),degree_composition([0.9,_1194,_5512],_1196).
p_c(hypo([],2,[],_1516),_1536,_1542,_1518,_1520):- =>([3-[]],p_a(hypo(_1686,_1688,_1690,[_1552|_1516]),_1536,_1542,_1518,_1520),_1552,_1516).
p_a(hypo([],3,[_1552|_1516],_1582),_1602,_1602,_1584,_1586):-reg(3,[],_9134),chk(_9134,_1582),degree_composition([0.4,_1584],_1586).
