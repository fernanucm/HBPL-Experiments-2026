:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(weak_unification,[a3]).
:-directive(degree_accumulator,[true]).
:-directive(filtering,[true]).
:-directive(transitivity,[no]).
:-directive(hypothetical,[true]).
t_norm(~,no).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_6556,_6556,1.0).
frel2(_6584,_6584,1.0).
frel3(_6612,_6612,1.0).
gEqThan(_6500,_6500,1.0).
lEqThan(_6528,_6528,1.0).

sim(b1,a1,0,0.3).
sim(a1,b1,0,0.3).

bpl_higherorder_3_test_suite(_6824,hypo([],0,[],_1184),_1204,_1210,_1186,_1188):-unify_arguments_a3([[_6824,[test_assert_retract_1,test_assert_retract_2,test_assert_retract_3,test_assert_retract_4,test_assert_retract_5,test_findall_1,test_findall_2,test_findall_3,test_setof_1,test_setof_2,test_setof_3],_1204,_1210,_6830]]),degree_composition([_1186,_6830],_1188).
bpl_higherorder_3_test_assert_retract_1(hypo([],3,[],_1658),_1748,_1772,_1688,_1722):-assert((bpl_higherorder_3_p(_7648,hypo([],1,[],_1310),_1374,_1336,_1356,_1314):-unify_arguments_a3([[_7648,X,_1374,_1330,_7654]]),degree_composition([_1356,_7654],_1312),weak_unify_a3(X,a1,0,_1330,_1336,_1312,_1314))),ho_call([truth_degree,1.0],yes,bpl_higherorder_3_p(a1,hypo(_1802,_1804,_1806,_1658),_1748,_1750,_1672,_1674),[_1748,_1750],[_1672,_1674],_1688,_1690),ho_call([truth_degree,0.3],yes,bpl_higherorder_3_p(b1,hypo(_1842,_1844,_1846,_1658),_1750,_1772,_1704,_1706),[_1750,_1772],[_1704,_1706],_1690,_1722),retract(yes,[[(bpl_higherorder_3_p(X,hypo([],2,[],_1484),_1548,_1554,_1530,_1532):-weak_unify_a3(X,a1,0,_1504,_1510,_1486,_1488)),1.0,[_1548,_1554],[_1504,_1510],[_1530,_1532],[_1486,_1488],hypo([],[],2,[],_1484)]]).
bpl_higherorder_3_test_assert_retract_2(hypo([],4,[],_2054),_2080,_2080,_2062,_2062):-X=(q:-b=>b),assert(no,[X]).
bpl_higherorder_3_test_assert_retract_3(hypo([],5,[],_2218),_2244,_2244,_2226,_2226):-X=(q:-b=>b),retract(no,[X]).
bpl_higherorder_3_test_assert_retract_4(hypo([],6,[],_2388),_2478,_2502,_2418,_2452):-X=(a1:-writeln(a1)),assert(no,[X]),ho_call([truth_degree,1.0],yes,bpl_higherorder_3_a1(hypo(_2532,_2534,_2536,_2388),_2478,_2480,_2402,_2404),[_2478,_2480],[_2402,_2404],_2418,_2420),ho_call([truth_degree,0.3],yes,bpl_higherorder_3_b1(hypo(_2570,_2572,_2574,_2388),_2480,_2502,_2434,_2436),[_2480,_2502],[_2434,_2436],_2420,_2452),retract(no,[X]).
bpl_higherorder_3_test_assert_retract_5(hypo([],7,[],_2776),_2802,_2802,_2784,_2784):-X=(a1:-_G),assert(no,[X]).
bpl_higherorder_3_test_findall_1(hypo([],8,[],_2960),_3036,_3084,_2964,_2996):-G=(X=a1;X=b1),_3036=_3038,_2964=_2966,_3038=_3044,ho_call([findall,X,L],no,G,[_3044,_3054],_2986,_2988,_2990),L=[a1,b1],_3054=_3078,_2966=_2996,_3078=_3084.
bpl_higherorder_3_test_findall_2(hypo([],9,[],_3384),_3460,_3508,_3388,_3420):-G=(X=a1;X=b1),_3460=_3462,_3388=_3390,_3462=_3468,ho_call([findall,X,L],no,(G,writeln(X)),[_3468,_3478],_3410,_3412,_3414),L=[a1,b1],_3478=_3502,_3390=_3420,_3502=_3508.
bpl_higherorder_3_test_findall_3(hypo([],10,[],_3962),_4002,_4008,_3984,_3986):-G=bpl_maplist(between(0,1),U),length(U,3),ho_call([findall,U,L],no,G,[_4002,_4008],_3982,_3984,_3986),L=[[0,0,0],[0,0,1],[0,1,0],[0,1,1],[1,0,0],[1,0,1],[1,1,0],[1,1,1]].
bpl_higherorder_3_test_setof_1(hypo([],11,[],_4234),_4316,_4364,_4238,_4276):-G=(X=b1;X=a1),_4316=_4318,_4238=_4240,_4318=_4324,ho_call([setof,X,L,[]],no,G,[_4324,_4334],_4266,_4268,_4270),L=[a1,b1],_4334=_4358,_4240=_4276,_4358=_4364.
bpl_higherorder_3_test_setof_2(hypo([],12,[],_4650),_4696,_4702,_4678,_4680):-G=member(X,[2,1,2,1]),ho_call([setof,X,L,[]],no,G,[_4696,_4702],_4676,_4678,_4680),L=[1,2].
bpl_higherorder_3_test_setof_3(hypo([],13,[],_4970),_5016,_5022,_4998,_5000):-G=bpl_maplist(between(1,2),U),length(U,2),ho_call([setof,U,L,[]],no,G,[_5016,_5022],_4996,_4998,_5000),L=[[1,1],[1,2],[2,1],[2,2]].
bpl_higherorder_3_test_bagof_1(hypo([],14,[],_5248),_5330,_5378,_5252,_5290):-G=(X=b1;X=a1),_5330=_5332,_5252=_5254,_5332=_5338,ho_call([bagof,X,L,[]],no,G,[_5338,_5348],_5280,_5282,_5284),L=[b1,a1],_5348=_5372,_5254=_5290,_5372=_5378.
bpl_higherorder_3_test_bagof_2(hypo([],15,[],_5676),_5722,_5728,_5704,_5706):-G=member(X,[2,1,2,1]),ho_call([bagof,X,L,[]],no,G,[_5722,_5728],_5702,_5704,_5706),L=[2,1,2,1].
bpl_higherorder_3_test_bagof_3(hypo([],16,[],_5940),_5986,_5992,_5968,_5970):-G=bpl_maplist(=(1),U),length(U,2),ho_call([bagof,U,L,[]],no,G,[_5986,_5992],_5966,_5968,_5970),L=[[1,1]].
bpl_higherorder_3_approximation_degree(_97984,_97990,hypo([],17,[],_6156),_6176,_6182,_6158,_6160):-unify_arguments_a3([[_97984,test_assert_retract_5,_6176,_98026,_97996],[_97990,0,_98026,_6182,_98038]]),degree_composition([_6158,_97996,_98038],_6160).
