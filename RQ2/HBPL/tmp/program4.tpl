:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-initialization (write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/tmp/program4.bpl:3: Singleton-marked variables appearing more than once: [_168]'),nl),write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/tmp/program4.bpl:4: Singleton-marked variables appearing more than once: [_168]'),nl.
:-directive(hypothetical,[true]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_1920,_1920,1.0).
frel2(_1948,_1948,1.0).
frel3(_1968,_1968,1.0).
gEqThan(_1864,_1864,1.0).
lEqThan(_1892,_1892,1.0).



program4_grad(_2758,hypo([],0,[],_682),_820,_728,_802,_690):-unify_arguments_a3([[_2758,_168,_820,_716,_2764]]),degree_composition([_802,_2764],_684),program4_take(_168,c1,hypo(_746,_748,_750,_682),_716,_718,_684,_686),program4_take(_168,c2,hypo(_772,_774,_776,_682),_718,_728,_686,_690).
program4_p(_4966,hypo([],1,[],_918),_1224,_964,_1206,_926):-unify_arguments_a3([[_4966,_168,_1224,_952,_4972]]),degree_composition([_1206,_4972],_920),program4_student(_168,hypo(_982,_984,_986,_918),_952,_954,_920,_922),=>([2-[_168,_224]],program4_grad(_168,hypo(_1178,_1180,_1182,[_1010|_918]),_954,_964,_922,_926),_1010,_918).
program4_take(_5874,_5880,hypo([_168,_224],2,[_1010|_918],_1052),_1090,_1096,_1072,_1074):-reg(2,[_168,_224],_6048),chk(_6048,_1052),unify_arguments_a3([[_5874,_168,_1090,_5916,_5886],[_5880,_224,_5916,_1096,_5928]]),degree_composition([_1072,_5886,_5928],_1074).
program4_student(_6868,hypo([],3,[],_1322),_1342,_1348,_1324,_1326):-unify_arguments_a3([[_6868,s1,_1342,_1348,_6874]]),degree_composition([_1324,_6874],_1326).
program4_student(_7702,hypo([],4,[],_1440),_1460,_1466,_1442,_1444):-unify_arguments_a3([[_7702,s2,_1460,_1466,_7708]]),degree_composition([_1442,_7708],_1444).
program4_take(_8532,_8538,hypo([],5,[],_1558),_1578,_1584,_1560,_1562):-unify_arguments_a3([[_8532,s1,_1578,_8574,_8544],[_8538,c1,_8574,_1584,_8586]]),degree_composition([_1560,_8544,_8586],_1562).
