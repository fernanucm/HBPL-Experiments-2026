:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-initialization (write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/tmp/program3.bpl:3: Singleton-marked variables appearing more than once: [_3318]'),nl),write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/tmp/program3.bpl:4: Singleton-marked variables appearing more than once: [_3318]'),nl.
:-directive(hypothetical,[true]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_1696,_1696,1.0).
frel2(_1724,_1724,1.0).
frel3(_1744,_1744,1.0).
gEqThan(_1640,_1640,1.0).
lEqThan(_1668,_1668,1.0).



program3_grad(_2534,hypo([],0,[],_582),_720,_628,_702,_590):-unify_arguments_a3([[_2534,_3318,_720,_616,_2540]]),degree_composition([_702,_2540],_584),program3_take(_3318,c1,hypo(_646,_648,_650,_582),_616,_618,_584,_586),program3_take(_3318,c2,hypo(_672,_674,_676,_582),_618,_628,_586,_590).
program3_p(_6426,hypo([],1,[],_818),_1124,_864,_1106,_826):-unify_arguments_a3([[_6426,_3318,_1124,_852,_6432]]),degree_composition([_1106,_6432],_820),program3_student(_3318,hypo(_882,_884,_886,_818),_852,_854,_820,_822),=>([2-[_3318,_3374]],program3_grad(_3318,hypo(_1078,_1080,_1082,[_910|_818]),_854,_864,_822,_826),_910,_818).
program3_take(_7334,_7340,hypo([_3318,_3374],2,[_910|_818],_952),_990,_996,_972,_974):-reg(2,[_3318,_3374],_7508),chk(_7508,_952),unify_arguments_a3([[_7334,_3318,_990,_7376,_7346],[_7340,_3374,_7376,_996,_7388]]),degree_composition([_972,_7346,_7388],_974).
program3_student(_8328,hypo([],3,[],_1222),_1242,_1248,_1224,_1226):-unify_arguments_a3([[_8328,s1,_1242,_1248,_8334]]),degree_composition([_1224,_8334],_1226).
program3_take(_9158,_9164,hypo([],4,[],_1340),_1360,_1366,_1342,_1344):-unify_arguments_a3([[_9158,s1,_1360,_9200,_9170],[_9164,c1,_9200,_1366,_9212]]),degree_composition([_1342,_9170,_9212],_1344).
