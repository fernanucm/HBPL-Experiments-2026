:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-initialization (write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/pl_higherorder.pl:202: Singleton variables: [M,Y]'),nl),write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/pl_higherorder.pl:203: Singleton variables: [M,Y]'),nl.

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_19984,_19984,1.0).
frel2(_20012,_20012,1.0).
frel3(_20032,_20032,1.0).
gEqThan(_19928,_19928,1.0).
lEqThan(_19956,_19956,1.0).



pl_higherorder_test_suites([test_call,test_failif,test_not,test_once,test_ignore,test_timepred,test_maplist,test_apply,test_forall,test_catch,test_assert_retract],_1172,_1172,_1154,_1154).
pl_higherorder_db_call_b(X,_1316,_1322,_1298,_1300):-Y=(write(X),bpl_call(X)),ho_call([bpl_call],no,Y,[_1316,_1322],_1296,_1298,_1300).
pl_higherorder_db_call_a(1,_1484,_1484,_1466,_1466).
pl_higherorder_db_call_a(2,_1590,_1590,_1572,_1572).
pl_higherorder_test_call_1(_1748,_1748,_1686,_1688):-ho_call([bpl_call],yes,!,[_1704,_1704],[],_1686,_1688).
pl_higherorder_test_call_2(_1904,_1904,_1842,_1844):-ho_call([bpl_call],yes,fail,[_1860,_1860],[],_1842,_1844).
pl_higherorder_test_call_3(X,_2040,_2046,_2022,_2024):-ho_call([bpl_call],yes,(fail,ho_call([bpl_call],no,X,[_2040,_2046],_2004,_2006,_2008)),[_2040,_2046],[_2006,_2008],_2022,_2024).
pl_higherorder_test_call_4(_2268,_2274,_2250,_2252):-ho_call([bpl_call],yes,(fail,ho_call([bpl_call],no,1,[_2268,_2274],_2232,_2234,_2236)),[_2268,_2274],[_2234,_2236],_2250,_2252).
pl_higherorder_test_call_5(_2464,_2470,_2446,_2448):-pl_higherorder_db_call_b(3,_2464,_2470,_2446,_2448).
pl_higherorder_test_call_6(Z,X,_2662,_2668,_2644,_2646):-Z=!,ho_call([bpl_call],no,(Z=!,db_call_a(X),Z),[_2662,_2668],_2642,_2644,_2646).
pl_higherorder_test_call_7(Z,X,_2876,_2882,_2858,_2860):-ho_call([bpl_call],no,(Z=!,db_call_a(X),Z),[_2876,_2882],_2856,_2858,_2860).
pl_higherorder_test_call_8(X,_3064,_3070,_3046,_3048):-ho_call([bpl_call],no,(write(3),X),[_3064,_3070],_3044,_3046,_3048).
pl_higherorder_test_call_9(_3262,_3268,_3244,_3246):-ho_call([bpl_call],yes,(write(3),ho_call([bpl_call],no,1,[_3262,_3268],_3226,_3228,_3230)),[_3262,_3268],[_3228,_3230],_3244,_3246).
pl_higherorder_test_call_10(X,_3466,_3472,_3448,_3450):-ho_call([bpl_call],no,X,[_3466,_3472],_3446,_3448,_3450).
pl_higherorder_test_call_11(_3638,_3644,_3620,_3622):-ho_call([bpl_call],no,1,[_3638,_3644],_3618,_3620,_3622).
pl_higherorder_test_call_12(_3818,_3824,_3800,_3802):-ho_call([bpl_call],no,(fail,1),[_3818,_3824],_3798,_3800,_3802).
pl_higherorder_test_call_13(_4002,_4008,_3984,_3986):-ho_call([bpl_call],no,(write(3),1),[_4002,_4008],_3982,_3984,_3986).
pl_higherorder_test_call_14(_4182,_4188,_4164,_4166):-ho_call([bpl_call],no,(1;true),[_4182,_4188],_4162,_4164,_4166).
pl_higherorder_throws_exception(test_call_5,_4342,_4342,_4324,_4324).
pl_higherorder_throws_exception(test_call_8,_4448,_4448,_4430,_4430).
pl_higherorder_throws_exception(test_call_9,_4554,_4554,_4536,_4536).
pl_higherorder_throws_exception(test_call_10,_4660,_4660,_4642,_4642).
pl_higherorder_throws_exception(test_call_11,_4766,_4766,_4748,_4748).
pl_higherorder_throws_exception(test_call_12,_4872,_4872,_4854,_4854).
pl_higherorder_throws_exception(test_call_13,_4978,_4978,_4960,_4960).
pl_higherorder_throws_exception(test_call_14,_5084,_5084,_5066,_5066).
pl_higherorder_test_failif_1(_5248,_5248,_5186,_5188):-ho_call([eval_negation,\+],yes,true,[_5204,_5204],[],_5186,_5188).
pl_higherorder_test_failif_2(_5410,_5410,_5348,_5350):-ho_call([eval_negation,\+],yes,!,[_5366,_5366],[],_5348,_5350).
pl_higherorder_test_failif_3(_5578,_5578,_5510,_5512):-ho_call([eval_negation,\+],yes,(!,fail),[_5534,_5534],[],_5510,_5512).
pl_higherorder_test_failif_4(X,_5794,_5808,_5688,_5748):-((X=1,_5794=_5796),_5688=_5690,_5796=_5808;(X=2,_5794=_5820),_5688=_5690,_5820=_5808),ho_call([eval_negation,\+],yes,(((!,_5808=_5844),_5712=_5714,_5844=_5856),(fail,_5856=_5868),_5714=_5720,_5868=_5880),[_5808,_5808],[_5712,_5714,_5714,_5720],_5690,_5748).
pl_higherorder_test_failif_5(_6204,_6204,_6142,_6144):-ho_call([eval_negation,\+],yes,4=5,[_6160,_6160],[],_6142,_6144).
pl_higherorder_test_failif_6(_6324,_6330,_6306,_6308):-ho_call([eval_negation,\+],no,3,[_6324,_6330],_6304,_6306,_6308).
pl_higherorder_test_failif_7(X,_6500,_6506,_6482,_6484):-ho_call([eval_negation,\+],no,X,[_6500,_6506],_6480,_6482,_6484).
pl_higherorder_test_failif_8(X,_6734,_6734,_6672,_6674):-ho_call([eval_negation,\+],yes,X=f(X),[_6690,_6690],[],_6672,_6674).
pl_higherorder_throws_exception(test_failif_6,_6840,_6840,_6822,_6822).
pl_higherorder_throws_exception(test_failif_7,_6946,_6946,_6928,_6928).
pl_higherorder_test_not_1(_7110,_7110,_7048,_7050):-ho_call([eval_negation,not],yes,true,[_7066,_7066],[],_7048,_7050).
pl_higherorder_test_not_2(_7272,_7272,_7210,_7212):-ho_call([eval_negation,not],yes,!,[_7228,_7228],[],_7210,_7212).
pl_higherorder_test_not_3(_7440,_7440,_7372,_7374):-ho_call([eval_negation,not],yes,(!,fail),[_7396,_7396],[],_7372,_7374).
pl_higherorder_test_not_4(X,_7656,_7742,_7550,_7610):-((X=1,_7656=_7658),_7550=_7552,_7658=_7670;(X=2,_7656=_7682),_7550=_7552,_7682=_7670),ho_call([eval_negation,not],yes,(((!,_7670=_7706),_7574=_7576,_7706=_7718),(fail,_7718=_7730),_7576=_7582,_7730=_7742),[_7670,_7742],[_7574,_7576,_7576,_7582],_7552,_7610).
pl_higherorder_test_not_5(_8102,_8102,_8040,_8042):-ho_call([eval_negation,not],yes,4=5,[_8058,_8058],[],_8040,_8042).
pl_higherorder_test_not_6(_8222,_8228,_8204,_8206):-ho_call([eval_negation,not],no,3,[_8222,_8228],_8202,_8204,_8206).
pl_higherorder_test_not_7(X,_8398,_8404,_8380,_8382):-ho_call([eval_negation,not],no,X,[_8398,_8404],_8378,_8380,_8382).
pl_higherorder_test_not_8(X,_8632,_8632,_8570,_8572):-ho_call([eval_negation,not],yes,X=f(X),[_8588,_8588],[],_8570,_8572).
pl_higherorder_throws_exception(test_not_6,_8738,_8738,_8720,_8720).
pl_higherorder_throws_exception(test_not_7,_8844,_8844,_8826,_8826).
pl_higherorder_approximation_degree(test_not_9,0.6,_8950,_8950,_8932,_8932).
pl_higherorder_test_once_1(_9110,_9110,_9048,_9050):-ho_call([once],yes,!,[_9066,_9066],[],_9048,_9050).
pl_higherorder_test_once_2(X,_9302,_9374,_9226,_9250):-ho_call([once],yes,((!,_9302=_9304),_9226=_9228,_9304=_9316),[_9302,_9316],[_9226,_9228],_9226,_9244),((X=1,_9316=_9362),_9228=_9250,_9362=_9374;(X=2,_9316=_9386),_9228=_9250,_9386=_9374).
pl_higherorder_test_once_3(_9672,_9672,_9610,_9612):-ho_call([once],yes,repeat,[_9628,_9628],[],_9610,_9612).
pl_higherorder_test_once_4(_9828,_9828,_9766,_9768):-ho_call([once],yes,fail,[_9784,_9784],[],_9766,_9768).
pl_higherorder_test_once_5(X,_9998,_9998,_9936,_9938):-ho_call([once],yes,X=f(X),[_9954,_9954],[],_9936,_9938).
pl_higherorder_test_ignore_1(_10156,_10156,_10094,_10096):-ho_call([once],yes,!,[_10112,_10112],[],_10094,_10096).
pl_higherorder_test_ignore_2(X,_10348,_10420,_10272,_10296):-ho_call([once],yes,((!,_10348=_10350),_10272=_10274,_10350=_10362),[_10348,_10362],[_10272,_10274],_10272,_10290),((X=1,_10362=_10408),_10274=_10296,_10408=_10420;(X=2,_10362=_10432),_10274=_10296,_10432=_10420).
pl_higherorder_test_ignore_3(_10718,_10718,_10656,_10658):-ho_call([once],yes,repeat,[_10674,_10674],[],_10656,_10658).
pl_higherorder_test_ignore_4(_10874,_10874,_10812,_10814):-ho_call([once],yes,fail,[_10830,_10830],[],_10812,_10814).
pl_higherorder_test_ignore_5(X,_11044,_11044,_10982,_10984):-ho_call([once],yes,X=f(X),[_11000,_11000],[],_10982,_10984).
pl_higherorder_test_timepred_1(_11202,_11202,_11140,_11142):-ho_call([time],yes,!,[_11158,_11158],[],_11140,_11142).
pl_higherorder_test_timepred_2(_11362,_11362,_11300,_11302):-ho_call([time],yes,write(foo),[_11318,_11318],[],_11300,_11302).
pl_higherorder_test_timepred_3(_11582,_11582,_11486,_11488):-ho_call([time],yes,ho_call([time],yes,(write(foo),write(foo)),[_11510,_11510],[],_11470,_11472),[_11538,_11538],[_11470,_11472],_11486,_11488).
pl_higherorder_db_maplist_sample(a,_11686,_11686,_11668,_11668).
pl_higherorder_db_maplist_sample(b,_11792,_11792,_11774,_11774).
pl_higherorder_db_maplist_sample(c,_11898,_11898,_11880,_11880).
pl_higherorder_test_maplist_1(_12038,_12044,_12020,_12022):-ho_call([bpl_maplist,[a,b,c]],no,write,[_12038,_12044],_12018,_12020,_12022).
pl_higherorder_test_maplist_2(_12250,_12256,_12232,_12234):-ho_call([bpl_maplist,[a,b,c,d,e,f]],no,write,[_12250,_12256],_12230,_12232,_12234).
pl_higherorder_test_maplist_3(_12444,_12450,_12426,_12428):-ho_call([bpl_maplist,[a,b,c]],no,db_maplist_sample,[_12444,_12450],_12424,_12426,_12428).
pl_higherorder_test_maplist_4(_12656,_12662,_12638,_12640):-ho_call([bpl_maplist,[a,b,c,d,e,f]],no,db_maplist_sample,[_12656,_12662],_12636,_12638,_12640).
pl_higherorder_test_maplist_5(_12844,_12850,_12826,_12828):-ho_call([bpl_maplist,[a,b]],no,_,[_12844,_12850],_12824,_12826,_12828).
pl_higherorder_test_maplist_6(_13268,_13274,_13250,_13252):-length(L,3),ho_call([findall,L,X],yes,ho_call([bpl_maplist,L],no,between(0,1),[_13268,_13274],_13232,_13234,_13236),[_13268,_13274],[_13234,_13236],_13250,_13252),X==[[0,0,0],[0,0,1],[0,1,0],[0,1,1],[1,0,0],[1,0,1],[1,1,0],[1,1,1]].
pl_higherorder_throws_exception(test_maplist_5,_13468,_13468,_13450,_13450).
pl_higherorder_db_apply_numbers(1,5,_13574,_13574,_13556,_13556).
pl_higherorder_db_apply_numbers(5,1,_13682,_13682,_13664,_13664).
pl_higherorder_db_apply_numbers(0,0,_13790,_13790,_13772,_13772).
pl_higherorder_db_apply_true(_13898,_13898,_13880,_13880).
pl_higherorder_test_apply_1(_14024,_14030,_14006,_14008):-ho_call([bpl_apply,[foo]],no,write,[_14024,_14030],_14004,_14006,_14008).
pl_higherorder_test_apply_2(_14212,_14218,_14194,_14196):-ho_call([bpl_apply,[5,9]],no,<,[_14212,_14218],_14192,_14194,_14196).
pl_higherorder_test_apply_3(_14388,_14394,_14370,_14372):-ho_call([bpl_apply,[]],no,db_apply_true,[_14388,_14394],_14368,_14370,_14372).
pl_higherorder_test_apply_4(X,Y,_14586,_14592,_14568,_14570):-ho_call([bpl_apply,[X,Y]],no,db_apply_numbers,[_14586,_14592],_14566,_14568,_14570),X=:=Y.
pl_higherorder_test_apply_5(X,_14778,_14784,_14760,_14762):-ho_call([bpl_apply,[foo]],no,X,[_14778,_14784],_14758,_14760,_14762).
pl_higherorder_test_apply_6(_14956,_14962,_14938,_14940):-ho_call([bpl_apply,_],no,db_apply_true,[_14956,_14962],_14936,_14938,_14940).
pl_higherorder_throws_exception(test_apply_5,_15116,_15116,_15098,_15098).
pl_higherorder_throws_exception(test_apply_6,_15222,_15222,_15204,_15204).
pl_higherorder_db_forall_object(table,_15328,_15328,_15310,_15310).
pl_higherorder_db_forall_object(chair,_15434,_15434,_15416,_15416).
pl_higherorder_db_forall_object(lamp,_15540,_15540,_15522,_15522).
pl_higherorder_test_forall_1(_15708,_15708,_15640,_15642):-ho_call([forall],yes,(true,write(foo)),[_15664,_15664],[],_15640,_15642).
pl_higherorder_test_forall_2(_15874,_15874,_15806,_15808):-ho_call([forall],yes,(fail,write(foo)),[_15830,_15830],[],_15806,_15808).
pl_higherorder_test_forall_3(_16060,_16060,_15992,_15994):-ho_call([forall],yes,(X is 5+9,write(X)),[_16016,_16016],[],_15992,_15994).
pl_higherorder_test_forall_4(_16250,_16250,_16182,_16184):-ho_call([forall],yes,(member(X,[a,b,c]),write(X)),[_16206,_16206],[],_16182,_16184).
pl_higherorder_test_forall_5(_16460,_16498,_16436,_16438):-ho_call([forall],yes,(((member(X,[a,b,c]),_16460=_16462),_16384=_16386,_16462=_16474),((X==a,_16474=_16486),_16386=_16392,_16486=_16498;(write(X),_16474=_16510),_16386=_16392,_16510=_16498)),[_16460,_16498],[_16384,_16386,_16386,_16392,_16386,_16392],_16436,_16438).
pl_higherorder_test_forall_6(_16868,_16868,_16800,_16802):-ho_call([forall],yes,(member(X,[5,10,-6]),X>2),[_16824,_16824],[],_16800,_16802).
pl_higherorder_test_forall_7(L,_17080,_17138,_16978,_17028):-ho_call([setof,X,L,[_17080,_17086]],yes,pl_higherorder_db_forall_object(X,_17080,_17086,_16962,_16964),[_17080,_17086],[_16962,_16964],_16978,_16980),ho_call([forall],yes,(member(Y,L),ho_call([bpl_call],yes,pl_higherorder_db_forall_object(Y,_17086,_17138,_16994,_16996),[_17086,_17138],[_16994,_16996],_17010,_17012)),[_17086,_17138],[_17010,_17012],_16980,_17028).
pl_higherorder_test_forall_8(_17374,_17380,_17356,_17358):-ho_call([forall],no,(_,true),[_17374,_17380],_17354,_17356,_17358).
pl_higherorder_test_forall_9(_17550,_17556,_17532,_17534):-ho_call([forall],no,(true,_),[_17550,_17556],_17530,_17532,_17534).
pl_higherorder_throws_exception(test_forall_8,_17710,_17710,_17692,_17692).
pl_higherorder_throws_exception(test_forall_9,_17816,_17816,_17798,_17798).
pl_higherorder_db_catch_a(0,_17922,_17922,_17904,_17904).
pl_higherorder_db_catch_b(1,_18028,_18028,_18010,_18010).
pl_higherorder_test_catch_1(_18228,_18252,_18168,_18194):-G=(db_catch_a(X),Y is 1/X),_18228=_18230,_18168=_18170,_18230=_18242,ho_call([catch,M],no,(G;db_catch_b(X)),[_18242,_18252],_18190,_18170,_18194).
pl_higherorder_test_catch_2(_18536,_18560,_18476,_18502):-G=(db_catch_a(X),Y is X/1),_18536=_18538,_18476=_18478,_18538=_18550,ho_call([catch,M],no,(G;db_catch_b(X)),[_18550,_18560],_18498,_18478,_18502).
pl_higherorder_test_assert_retract_1(_19006,_19012,_18988,_18990):-assert(pl_higherorder_p(_18750,_18750,_18732,_18732)),ho_call([bpl_call],yes,pl_higherorder_p(_19006,_19012,_18972,_18974),[_19006,_19012],[_18972,_18974],_18988,_18990),bpl_retract(pl_higherorder_p(_18866,_18866,_18848,_18848)).
