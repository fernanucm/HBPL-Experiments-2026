:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_2006,_2006,1.0).
frel2(_2034,_2034,1.0).
frel3(_2054,_2054,1.0).
gEqThan(_1950,_1950,1.0).
lEqThan(_1978,_1978,1.0).



fact_bench(hypo([],0,[],_786),_806,_812,_788,_790):-fact_many_fact(200,hypo(_818,_820,_822,_786),_806,_812,_788,_790),!.
fact_many_fact(_2752,hypo([],1,[],_960),_980,_986,_962,_964):-unify_arguments_a3([[_2752,0,_980,_986,_2758]]),degree_composition([_962,_2758],_964).
fact_many_fact(_6972,hypo([],2,[],_1108),_1256,_1154,_1238,_1116):-unify_arguments_a3([[_6972,N,_1256,_1142,_6978]]),degree_composition([_1238,_6978],_1110),N>0,fact_fact(1000,_,hypo(_1172,_1174,_1176,_1108),_1142,_1144,_1110,_1112),N1 is N-1,fact_many_fact(N1,hypo(_1198,_1200,_1202,_1108),_1144,_1154,_1112,_1116).
fact_fact(_7826,_7832,hypo([],3,[],_1354),_1374,_1380,_1356,_1358):-unify_arguments_a3([[_7826,0,_1374,_7868,_7838],[_7832,1,_7868,_1380,_7880]]),degree_composition([_1356,_7838,_7880],_1358).
fact_fact(_8646,_8652,hypo([],4,[],_1474),_1494,_1500,_1476,_1478):-unify_arguments_a3([[_8646,1,_1494,_8688,_8658],[_8652,1,_8688,_1500,_8700]]),degree_composition([_1476,_8658,_8700],_1478).
fact_fact(_12608,_12614,hypo([],5,[],_1644),_1736,_1670,_1718,_1648):-unify_arguments_a3([[_12608,N,_1736,_12650,_12620],[_12614,F,_12650,_1664,_12662]]),degree_composition([_1718,_12620,_12662],_1646),N>1,N1 is N-1,fact_fact(N1,F1,hypo(_1676,_1678,_1680,_1644),_1664,_1670,_1646,_1648),F is F1*N.
