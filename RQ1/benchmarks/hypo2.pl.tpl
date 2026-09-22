:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_1706,_1706,1.0).
frel2(_1734,_1734,1.0).
frel3(_1754,_1754,1.0).
gEqThan(_1650,_1650,1.0).
lEqThan(_1678,_1678,1.0).



hypo2_bench(hypo([],0,[],_728),_748,_754,_730,_732):-hypo2_p(3000,hypo(_760,_762,_764,_728),_748,_754,_730,_732),fail.
hypo2_bench(hypo([],1,[],_902),_922,_922,_904,_904).
hypo2_p(_2904,hypo([],2,[],_1018),_1088,_1044,_1070,_1022):-unify_arguments_a3([[_2904,0,_1088,_1038,_2910]]),degree_composition([_1070,_2910],_1020),hypo2_a(hypo(_1050,_1052,_1054,_1018),_1038,_1044,_1020,_1022).
hypo2_p(_5774,hypo([],3,[],_1216),_1444,_1242,_1426,_1220):-unify_arguments_a3([[_5774,N,_1444,_1236,_5780]]),degree_composition([_1426,_5780],_1218),N>0,N1 is N-1,=>([4-[]],hypo2_p(N1,hypo(_1392,_1394,_1396,[_1252|_1216]),_1236,_1242,_1218,_1220),_1252,_1216).
hypo2_a(hypo([],4,[_1252|_1216],_1282),_1308,_1308,_1290,_1290):-reg(4,[],_6632),chk(_6632,_1282).
