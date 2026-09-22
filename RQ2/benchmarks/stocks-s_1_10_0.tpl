:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_5218,_5218,1.0).
frel2(_5246,_5246,1.0).
frel3(_5266,_5266,1.0).
gEqThan(_5162,_5162,1.0).
lEqThan(_5190,_5190,1.0).

sim(young,middle,1,0.62).
sim(middle,young,1,0.62).
sim(old,middle,0,0.5).
sim(middle,old,0,0.5).

stock_s_1_10_0_middle(_5594,hypo([],0,[],_760),_780,_786,_762,_764):-unify_arguments_a3([[_5594,paul,_780,_786,_5600]]),degree_composition([_762,_5600],_764).
stock_s_1_10_0_young(_5814,hypo([],0,[],_5528),_5512,_5514,_5516,_5518):-sat_a3([young:1,middle:1],_5512,_5844),unify_arguments_a3([[_5814,paul,_5844,_5514,_5820]]),degree_composition([0.62,_5516,_5820],_5518).
stock_s_1_10_0_old(_6078,hypo([],0,[],_5748),_5732,_5734,_5736,_5738):-sat_a3([old:0,middle:0],_5732,_6108),unify_arguments_a3([[_6078,paul,_6108,_5734,_6084]]),degree_composition([0.5,_5736,_6084],_5738).
stock_s_1_10_0_old(_6380,hypo([],1,[],_878),_898,_904,_880,_882):-unify_arguments_a3([[_6380,mary,_898,_904,_6386]]),degree_composition([_880,_6386],_882).
stock_s_1_10_0_middle(_6600,hypo([],1,[],_6314),_6298,_6300,_6302,_6304):-sat_a3([middle:0,old:0],_6298,_6630),unify_arguments_a3([[_6600,mary,_6630,_6300,_6606]]),degree_composition([0.5,_6302,_6606],_6304).
stock_s_1_10_0_shareholder(_6880,_6886,hypo([],2,[],_996),_1016,_1022,_998,_1000):-unify_arguments_a3([[_6880,paul,_1016,_6922,_6892],[_6886,google,_6922,_1022,_6934]]),degree_composition([_998,_6892,_6934],_1000).
stock_s_1_10_0_shareholder(_7172,_7178,hypo([],3,[],_1116),_1136,_1142,_1118,_1120):-unify_arguments_a3([[_7172,paul,_1136,_7214,_7184],[_7178,greek_bonds,_7214,_1142,_7226]]),degree_composition([_1118,_7184,_7226],_1120).
stock_s_1_10_0_shareholder(_7464,_7470,hypo([],4,[],_1236),_1256,_1262,_1238,_1240):-unify_arguments_a3([[_7464,mary,_1256,_7506,_7476],[_7470,google,_7506,_1262,_7518]]),degree_composition([_1238,_7476,_7518],_1240).
stock_s_1_10_0_stock_up(_7748,hypo([],5,[],_1350),_1370,_1376,_1352,_1354):-unify_arguments_a3([[_7748,google,_1370,_1376,_7754]]),degree_composition([0.9,_1352,_7754],_1354).
stock_s_1_10_0_stock_up(_7982,hypo([],6,[],_1462),_1482,_1488,_1464,_1466):-unify_arguments_a3([[_7982,greek_bonds,_1482,_1488,_7988]]),degree_composition([0.2,_1464,_7988],_1466).
stock_s_1_10_0_shareholder(_8224,_8230,hypo([],7,[],_1580),_1600,_1606,_1582,_1584):-unify_arguments_a3([[_8224,paul,_1600,_8266,_8236],[_8230,stock_1,_8266,_1606,_8278]]),degree_composition([_1582,_8236,_8278],_1584).
stock_s_1_10_0_stock_up(_8508,hypo([],8,[],_1694),_1714,_1720,_1696,_1698):-unify_arguments_a3([[_8508,stock_1,_1714,_1720,_8514]]),degree_composition([0.2,_1696,_8514],_1698).
stock_s_1_10_0_shareholder(_8750,_8756,hypo([],9,[],_1812),_1832,_1838,_1814,_1816):-unify_arguments_a3([[_8750,paul,_1832,_8792,_8762],[_8756,stock_2,_8792,_1838,_8804]]),degree_composition([_1814,_8762,_8804],_1816).
stock_s_1_10_0_stock_up(_9034,hypo([],10,[],_1926),_1946,_1952,_1928,_1930):-unify_arguments_a3([[_9034,stock_2,_1946,_1952,_9040]]),degree_composition([0.2,_1928,_9040],_1930).
stock_s_1_10_0_shareholder(_9276,_9282,hypo([],11,[],_2044),_2064,_2070,_2046,_2048):-unify_arguments_a3([[_9276,paul,_2064,_9318,_9288],[_9282,stock_3,_9318,_2070,_9330]]),degree_composition([_2046,_9288,_9330],_2048).
stock_s_1_10_0_stock_up(_9560,hypo([],12,[],_2158),_2178,_2184,_2160,_2162):-unify_arguments_a3([[_9560,stock_3,_2178,_2184,_9566]]),degree_composition([0.2,_2160,_9566],_2162).
stock_s_1_10_0_shareholder(_9802,_9808,hypo([],13,[],_2276),_2296,_2302,_2278,_2280):-unify_arguments_a3([[_9802,paul,_2296,_9844,_9814],[_9808,stock_4,_9844,_2302,_9856]]),degree_composition([_2278,_9814,_9856],_2280).
stock_s_1_10_0_stock_up(_10086,hypo([],14,[],_2390),_2410,_2416,_2392,_2394):-unify_arguments_a3([[_10086,stock_4,_2410,_2416,_10092]]),degree_composition([0.2,_2392,_10092],_2394).
stock_s_1_10_0_shareholder(_10328,_10334,hypo([],15,[],_2508),_2528,_2534,_2510,_2512):-unify_arguments_a3([[_10328,paul,_2528,_10370,_10340],[_10334,stock_5,_10370,_2534,_10382]]),degree_composition([_2510,_10340,_10382],_2512).
stock_s_1_10_0_stock_up(_10612,hypo([],16,[],_2622),_2642,_2648,_2624,_2626):-unify_arguments_a3([[_10612,stock_5,_2642,_2648,_10618]]),degree_composition([0.2,_2624,_10618],_2626).
stock_s_1_10_0_shareholder(_10854,_10860,hypo([],17,[],_2740),_2760,_2766,_2742,_2744):-unify_arguments_a3([[_10854,paul,_2760,_10896,_10866],[_10860,stock_6,_10896,_2766,_10908]]),degree_composition([_2742,_10866,_10908],_2744).
stock_s_1_10_0_stock_up(_11138,hypo([],18,[],_2854),_2874,_2880,_2856,_2858):-unify_arguments_a3([[_11138,stock_6,_2874,_2880,_11144]]),degree_composition([0.2,_2856,_11144],_2858).
stock_s_1_10_0_shareholder(_11380,_11386,hypo([],19,[],_2972),_2992,_2998,_2974,_2976):-unify_arguments_a3([[_11380,paul,_2992,_11422,_11392],[_11386,stock_7,_11422,_2998,_11434]]),degree_composition([_2974,_11392,_11434],_2976).
stock_s_1_10_0_stock_up(_11664,hypo([],20,[],_3086),_3106,_3112,_3088,_3090):-unify_arguments_a3([[_11664,stock_7,_3106,_3112,_11670]]),degree_composition([0.2,_3088,_11670],_3090).
stock_s_1_10_0_shareholder(_11906,_11912,hypo([],21,[],_3204),_3224,_3230,_3206,_3208):-unify_arguments_a3([[_11906,paul,_3224,_11948,_11918],[_11912,stock_8,_11948,_3230,_11960]]),degree_composition([_3206,_11918,_11960],_3208).
stock_s_1_10_0_stock_up(_12190,hypo([],22,[],_3318),_3338,_3344,_3320,_3322):-unify_arguments_a3([[_12190,stock_8,_3338,_3344,_12196]]),degree_composition([0.2,_3320,_12196],_3322).
stock_s_1_10_0_shareholder(_12432,_12438,hypo([],23,[],_3436),_3456,_3462,_3438,_3440):-unify_arguments_a3([[_12432,paul,_3456,_12474,_12444],[_12438,stock_9,_12474,_3462,_12486]]),degree_composition([_3438,_12444,_12486],_3440).
stock_s_1_10_0_stock_up(_12716,hypo([],24,[],_3550),_3570,_3576,_3552,_3554):-unify_arguments_a3([[_12716,stock_9,_3570,_3576,_12722]]),degree_composition([0.2,_3552,_12722],_3554).
stock_s_1_10_0_shareholder(_12958,_12964,hypo([],25,[],_3668),_3688,_3694,_3670,_3672):-unify_arguments_a3([[_12958,paul,_3688,_13000,_12970],[_12964,stock_10,_13000,_3694,_13012]]),degree_composition([_3670,_12970,_13012],_3672).
stock_s_1_10_0_stock_up(_13242,hypo([],26,[],_3782),_3802,_3808,_3784,_3786):-unify_arguments_a3([[_13242,stock_10,_3802,_3808,_13248]]),degree_composition([0.2,_3784,_13248],_3786).
stock_s_1_10_0_keep_stock(_15318,_15324,hypo([],27,[],_3900),_4098,_3956,_4080,_3908):-unify_arguments_a3([[_15318,Name,_4098,_15360,_15330],[_15324,Stock,_15360,_3950,_15372]]),degree_composition([_4080,_15330,_15372],_3902),stock_s_1_10_0_shareholder(Name,Stock,hypo(_3996,_3998,_4000,_3900),_3950,_3952,_3902,_3904),(stock_s_1_10_0_stock_up(Stock,hypo(_4022,_4024,_4026,_3900),_3952,_3956,_3904,_3908);stock_s_1_10_0_young(Name,hypo(_4046,_4048,_4050,_3900),_3952,_3956,_3904,_3908)).
stock_s_1_10_0_sell_stock(_20574,_20580,hypo([],28,[],_4198),_4396,_4264,_4378,_4210):-unify_arguments_a3([[_20574,Name,_4396,_20616,_20586],[_20580,Stock,_20616,_4248,_20628]]),degree_composition([_4378,_20586,_20628],_4200),stock_s_1_10_0_shareholder(Name,Stock,hypo(_4294,_4296,_4298,_4198),_4248,_4250,_4200,_4202),stock_s_1_10_0_stock_down(Stock,hypo(_4320,_4322,_4324,_4198),_4250,_4254,_4202,_4206),stock_s_1_10_0_old(Name,hypo(_4344,_4346,_4348,_4198),_4254,_4264,_4206,_4210).
stock_s_1_10_0_bench(hypo([],29,[],_4516),_4570,_4576,_4552,_4554):-ho_call([findall,S,Answers],yes,stock_s_1_10_0_keep_stock(paul,S,hypo(_4594,_4596,_4598,_4516),_4570,_4576,_4536,_4538),[_4570,_4576],[_4536,_4538],_4552,_4554),length(Answers,L),write('Number of answers: '),writeln(L),setenv('Answers',L).
