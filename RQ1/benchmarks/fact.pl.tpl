:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_1874,_1874,1.0).
frel2(_1902,_1902,1.0).
frel3(_1922,_1922,1.0).
gEqThan(_1818,_1818,1.0).
lEqThan(_1846,_1846,1.0).



fact_bench(hypo([],0,[],_660),_680,_686,_662,_664):-fact_many_fact(200,hypo(_692,_694,_696,_660),_680,_686,_662,_664).
fact_many_fact(_2570,hypo([],1,[],_828),_848,_854,_830,_832):-unify_arguments_a3([[_2570,0,_848,_854,_2576]]),degree_composition([_830,_2576],_832).
fact_many_fact(_3658,hypo([],2,[],_976),_1124,_1022,_1106,_984):-unify_arguments_a3([[_3658,N,_1124,_1010,_3664]]),degree_composition([_1106,_3664],_978),N>0,fact_fact(1000,_,hypo(_1040,_1042,_1044,_976),_1010,_1012,_978,_980),N1 is N-1,fact_many_fact(N1,hypo(_1066,_1068,_1070,_976),_1012,_1022,_980,_984).
fact_fact(_4512,_4518,hypo([],3,[],_1222),_1242,_1248,_1224,_1226):-unify_arguments_a3([[_4512,0,_1242,_4554,_4524],[_4518,1,_4554,_1248,_4566]]),degree_composition([_1224,_4524,_4566],_1226).
fact_fact(_5332,_5338,hypo([],4,[],_1342),_1362,_1368,_1344,_1346):-unify_arguments_a3([[_5332,1,_1362,_5374,_5344],[_5338,1,_5374,_1368,_5386]]),degree_composition([_1344,_5344,_5386],_1346).
fact_fact(_9294,_9300,hypo([],5,[],_1512),_1604,_1538,_1586,_1516):-unify_arguments_a3([[_9294,N,_1604,_9336,_9306],[_9300,F,_9336,_1532,_9348]]),degree_composition([_1586,_9306,_9348],_1514),N>1,N1 is N-1,fact_fact(N1,F1,hypo(_1544,_1546,_1548,_1512),_1532,_1538,_1514,_1516),F is F1*N.
