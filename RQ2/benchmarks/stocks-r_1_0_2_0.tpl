:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_3962,_3962,1.0).
frel2(_3990,_3990,1.0).
frel3(_4010,_4010,1.0).
gEqThan(_3906,_3906,1.0).
lEqThan(_3934,_3934,1.0).

sim(young,middle,1,0.62).
sim(middle,young,1,0.62).
sim(old,middle,0,0.5).
sim(middle,old,0,0.5).

stocks_r_1_0_2_0_middle(_4338,hypo([],0,[],_780),_800,_806,_782,_784):-unify_arguments_a3([[_4338,paul,_800,_806,_4344]]),degree_composition([_782,_4344],_784).
stocks_r_1_0_2_0_young(_4558,hypo([],0,[],_4272),_4256,_4258,_4260,_4262):-sat_a3([young:1,middle:1],_4256,_4588),unify_arguments_a3([[_4558,paul,_4588,_4258,_4564]]),degree_composition([0.62,_4260,_4564],_4262).
stocks_r_1_0_2_0_old(_4822,hypo([],0,[],_4492),_4476,_4478,_4480,_4482):-sat_a3([old:0,middle:0],_4476,_4852),unify_arguments_a3([[_4822,paul,_4852,_4478,_4828]]),degree_composition([0.5,_4480,_4828],_4482).
stocks_r_1_0_2_0_old(_5124,hypo([],1,[],_898),_918,_924,_900,_902):-unify_arguments_a3([[_5124,mary,_918,_924,_5130]]),degree_composition([_900,_5130],_902).
stocks_r_1_0_2_0_middle(_5344,hypo([],1,[],_5058),_5042,_5044,_5046,_5048):-sat_a3([middle:0,old:0],_5042,_5374),unify_arguments_a3([[_5344,mary,_5374,_5044,_5350]]),degree_composition([0.5,_5046,_5350],_5048).
stocks_r_1_0_2_0_shareholder(_5624,_5630,hypo([],2,[],_1016),_1036,_1042,_1018,_1020):-unify_arguments_a3([[_5624,paul,_1036,_5666,_5636],[_5630,google,_5666,_1042,_5678]]),degree_composition([_1018,_5636,_5678],_1020).
stocks_r_1_0_2_0_shareholder(_5916,_5922,hypo([],3,[],_1136),_1156,_1162,_1138,_1140):-unify_arguments_a3([[_5916,paul,_1156,_5958,_5928],[_5922,greek_bonds,_5958,_1162,_5970]]),degree_composition([_1138,_5928,_5970],_1140).
stocks_r_1_0_2_0_shareholder(_6208,_6214,hypo([],4,[],_1256),_1276,_1282,_1258,_1260):-unify_arguments_a3([[_6208,mary,_1276,_6250,_6220],[_6214,google,_6250,_1282,_6262]]),degree_composition([_1258,_6220,_6262],_1260).
stocks_r_1_0_2_0_stock_up(_6492,hypo([],5,[],_1370),_1390,_1396,_1372,_1374):-unify_arguments_a3([[_6492,google,_1390,_1396,_6498]]),degree_composition([0.9,_1372,_6498],_1374).
stocks_r_1_0_2_0_stock_up(_6726,hypo([],6,[],_1482),_1502,_1508,_1484,_1486):-unify_arguments_a3([[_6726,greek_bonds,_1502,_1508,_6732]]),degree_composition([0.2,_1484,_6732],_1486).
stocks_r_1_0_2_0_keep_stock(_7848,_7854,hypo([],7,[],_1600),_1798,_1656,_1780,_1608):-unify_arguments_a3([[_7848,Name,_1798,_7890,_7860],[_7854,Stock,_7890,_1650,_7902]]),degree_composition([_1780,_7860,_7902],_1602),stocks_r_1_0_2_0_shareholder(Name,Stock,hypo(_1696,_1698,_1700,_1600),_1650,_1652,_1602,_1604),(stocks_r_1_0_2_0_stock_up(Stock,hypo(_1722,_1724,_1726,_1600),_1652,_1656,_1604,_1608);stocks_r_1_0_2_0_young(Name,hypo(_1746,_1748,_1750,_1600),_1652,_1656,_1604,_1608)).
stocks_r_1_0_2_0_sell_stock(_9048,_9054,hypo([],8,[],_1898),_2096,_1964,_2078,_1910):-unify_arguments_a3([[_9048,Name,_2096,_9090,_9060],[_9054,Stock,_9090,_1948,_9102]]),degree_composition([_2078,_9060,_9102],_1900),stocks_r_1_0_2_0_shareholder(Name,Stock,hypo(_1994,_1996,_1998,_1898),_1948,_1950,_1900,_1902),stocks_r_1_0_2_0_stock_down(Stock,hypo(_2020,_2022,_2024,_1898),_1950,_1954,_1902,_1906),stocks_r_1_0_2_0_old(Name,hypo(_2044,_2046,_2048,_1898),_1954,_1964,_1906,_1910).
stocks_r_1_0_2_0_invest(_9726,_9732,hypo([],9,[],_2196),_2270,_2222,_2252,_2200):-unify_arguments_a3([[_9726,Name,_2270,_9768,_9738],[_9732,Stock,_9768,_2216,_9780]]),degree_composition([_2252,_9738,_9780],_2198),stocks_r_1_0_2_0_invest_1(Name,Stock,hypo(_2228,_2230,_2232,_2196),_2216,_2222,_2198,_2200).
stocks_r_1_0_2_0_invest_1(_10874,_10880,hypo([],10,[],_2370),_2744,_2396,_2726,_2374):-unify_arguments_a3([[_10874,Name,_2744,_10916,_10886],[_10880,Stock,_10916,_2390,_10928]]),degree_composition([_2726,_10886,_10928],_2372),=>([11-[Name]],=>([12-[]],stocks_r_1_0_2_0_invest_2(Name,Stock,hypo(_2702,_2704,_2706,[_2566,_2406|_2370]),_2390,_2396,_2372,_2374),_2566,[_2406|_2370]),_2406,_2370).
stocks_r_1_0_2_0_shareholder(_11194,_11200,hypo([Name],11,[_2406|_2370],_2442),_2474,_2480,_2456,_2458):-reg(11,[Name],_11318),chk(_11318,_2442),unify_arguments_a3([[_11194,Name,_2474,_11236,_11206],[_11200,stock_1,_11236,_2480,_11248]]),degree_composition([_2456,_11206,_11248],_2458).
stocks_r_1_0_2_0_stock_up(_11516,hypo([],12,[_2566,_2406|_2370],_2596),_2616,_2622,_2598,_2600):-reg(12,[],_11590),chk(_11590,_2596),unify_arguments_a3([[_11516,stock_1,_2616,_2622,_11522]]),degree_composition([0.6,_2598,_11522],_2600).
stocks_r_1_0_2_0_invest_2(_12618,_12624,hypo([],13,[],_2844),_3218,_2870,_3200,_2848):-unify_arguments_a3([[_12618,Name,_3218,_12660,_12630],[_12624,Stock,_12660,_2864,_12672]]),degree_composition([_3200,_12630,_12672],_2846),=>([14-[Name]],=>([15-[]],stocks_r_1_0_2_0_keep_stock(Name,Stock,hypo(_3176,_3178,_3180,[_3040,_2880|_2844]),_2864,_2870,_2846,_2848),_3040,[_2880|_2844]),_2880,_2844).
stocks_r_1_0_2_0_shareholder(_12938,_12944,hypo([Name],14,[_2880|_2844],_2916),_2948,_2954,_2930,_2932):-reg(14,[Name],_13062),chk(_13062,_2916),unify_arguments_a3([[_12938,Name,_2948,_12980,_12950],[_12944,stock_2,_12980,_2954,_12992]]),degree_composition([_2930,_12950,_12992],_2932).
stocks_r_1_0_2_0_stock_up(_13260,hypo([],15,[_3040,_2880|_2844],_3070),_3090,_3096,_3072,_3074):-reg(15,[],_13334),chk(_13334,_3070),unify_arguments_a3([[_13260,stock_2,_3090,_3096,_13266]]),degree_composition([0.6,_3072,_13266],_3074).
stocks_r_1_0_2_0_bench(hypo([],16,[],_3338),_3392,_3398,_3374,_3376):-ho_call([findall,S,Answers],yes,stocks_r_1_0_2_0_invest(paul,S,hypo(_3416,_3418,_3420,_3338),_3392,_3398,_3358,_3360),[_3392,_3398],[_3358,_3360],_3374,_3376),length(Answers,L),write('Number of answers: '),writeln(L),setenv('Answers',L).
