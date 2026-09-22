:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_1928,_1928,1.0).
frel2(_1956,_1956,1.0).
frel3(_1976,_1976,1.0).
gEqThan(_1872,_1872,1.0).
lEqThan(_1900,_1900,1.0).



fact_bench(hypo([],0,[],_708),_728,_734,_710,_712):-fact_many_fact(50,hypo(_740,_742,_744,_708),_728,_734,_710,_712),!.
fact_many_fact(_2674,hypo([],1,[],_882),_902,_908,_884,_886):-unify_arguments_a3([[_2674,0,_902,_908,_2680]]),degree_composition([_884,_2680],_886).
fact_many_fact(_3720,hypo([],2,[],_1030),_1178,_1076,_1160,_1038):-unify_arguments_a3([[_3720,N,_1178,_1064,_3726]]),degree_composition([_1160,_3726],_1032),N>0,fact_fact(1000,_,hypo(_1094,_1096,_1098,_1030),_1064,_1066,_1032,_1034),N1 is N-1,fact_many_fact(N1,hypo(_1120,_1122,_1124,_1030),_1066,_1076,_1034,_1038).
fact_fact(_3996,_4002,hypo([],3,[],_1276),_1296,_1302,_1278,_1280):-unify_arguments_a3([[_3996,0,_1296,_4038,_4008],[_4002,1,_4038,_1302,_4050]]),degree_composition([_1278,_4008,_4050],_1280).
fact_fact(_4288,_4294,hypo([],4,[],_1396),_1416,_1422,_1398,_1400):-unify_arguments_a3([[_4288,1,_1416,_4330,_4300],[_4294,1,_4330,_1422,_4342]]),degree_composition([_1398,_4300,_4342],_1400).
fact_fact(_6588,_6594,hypo([],5,[],_1566),_1658,_1592,_1640,_1570):-unify_arguments_a3([[_6588,N,_1658,_6630,_6600],[_6594,F,_6630,_1586,_6642]]),degree_composition([_1640,_6600,_6642],_1568),N>1,N1 is N-1,fact_fact(N1,F1,hypo(_1598,_1600,_1602,_1566),_1586,_1592,_1568,_1570),F is F1*N.
