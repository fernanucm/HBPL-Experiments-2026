:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_3464,_3464,1.0).
frel2(_3492,_3492,1.0).
frel3(_3512,_3512,1.0).
gEqThan(_3408,_3408,1.0).
lEqThan(_3436,_3436,1.0).

sim(young,middle,1,0.62).
sim(middle,young,1,0.62).
sim(old,middle,0,0.5).
sim(middle,old,0,0.5).

stocks_r_1_0_1_0_middle(_3840,hypo([],0,[],_774),_794,_800,_776,_778):-unify_arguments_a3([[_3840,paul,_794,_800,_3846]]),degree_composition([_776,_3846],_778).
stocks_r_1_0_1_0_young(_4060,hypo([],0,[],_3774),_3758,_3760,_3762,_3764):-sat_a3([young:1,middle:1],_3758,_4090),unify_arguments_a3([[_4060,paul,_4090,_3760,_4066]]),degree_composition([0.62,_3762,_4066],_3764).
stocks_r_1_0_1_0_old(_4324,hypo([],0,[],_3994),_3978,_3980,_3982,_3984):-sat_a3([old:0,middle:0],_3978,_4354),unify_arguments_a3([[_4324,paul,_4354,_3980,_4330]]),degree_composition([0.5,_3982,_4330],_3984).
stocks_r_1_0_1_0_old(_4626,hypo([],1,[],_892),_912,_918,_894,_896):-unify_arguments_a3([[_4626,mary,_912,_918,_4632]]),degree_composition([_894,_4632],_896).
stocks_r_1_0_1_0_middle(_4846,hypo([],1,[],_4560),_4544,_4546,_4548,_4550):-sat_a3([middle:0,old:0],_4544,_4876),unify_arguments_a3([[_4846,mary,_4876,_4546,_4852]]),degree_composition([0.5,_4548,_4852],_4550).
stocks_r_1_0_1_0_shareholder(_5126,_5132,hypo([],2,[],_1010),_1030,_1036,_1012,_1014):-unify_arguments_a3([[_5126,paul,_1030,_5168,_5138],[_5132,google,_5168,_1036,_5180]]),degree_composition([_1012,_5138,_5180],_1014).
stocks_r_1_0_1_0_shareholder(_5418,_5424,hypo([],3,[],_1130),_1150,_1156,_1132,_1134):-unify_arguments_a3([[_5418,paul,_1150,_5460,_5430],[_5424,greek_bonds,_5460,_1156,_5472]]),degree_composition([_1132,_5430,_5472],_1134).
stocks_r_1_0_1_0_shareholder(_5710,_5716,hypo([],4,[],_1250),_1270,_1276,_1252,_1254):-unify_arguments_a3([[_5710,mary,_1270,_5752,_5722],[_5716,google,_5752,_1276,_5764]]),degree_composition([_1252,_5722,_5764],_1254).
stocks_r_1_0_1_0_stock_up(_5994,hypo([],5,[],_1364),_1384,_1390,_1366,_1368):-unify_arguments_a3([[_5994,google,_1384,_1390,_6000]]),degree_composition([0.9,_1366,_6000],_1368).
stocks_r_1_0_1_0_stock_up(_6228,hypo([],6,[],_1476),_1496,_1502,_1478,_1480):-unify_arguments_a3([[_6228,greek_bonds,_1496,_1502,_6234]]),degree_composition([0.2,_1478,_6234],_1480).
stocks_r_1_0_1_0_keep_stock(_7350,_7356,hypo([],7,[],_1594),_1792,_1650,_1774,_1602):-unify_arguments_a3([[_7350,Name,_1792,_7392,_7362],[_7356,Stock,_7392,_1644,_7404]]),degree_composition([_1774,_7362,_7404],_1596),stocks_r_1_0_1_0_shareholder(Name,Stock,hypo(_1690,_1692,_1694,_1594),_1644,_1646,_1596,_1598),(stocks_r_1_0_1_0_stock_up(Stock,hypo(_1716,_1718,_1720,_1594),_1646,_1650,_1598,_1602);stocks_r_1_0_1_0_young(Name,hypo(_1740,_1742,_1744,_1594),_1646,_1650,_1598,_1602)).
stocks_r_1_0_1_0_sell_stock(_8550,_8556,hypo([],8,[],_1892),_2090,_1958,_2072,_1904):-unify_arguments_a3([[_8550,Name,_2090,_8592,_8562],[_8556,Stock,_8592,_1942,_8604]]),degree_composition([_2072,_8562,_8604],_1894),stocks_r_1_0_1_0_shareholder(Name,Stock,hypo(_1988,_1990,_1992,_1892),_1942,_1944,_1894,_1896),stocks_r_1_0_1_0_stock_down(Stock,hypo(_2014,_2016,_2018,_1892),_1944,_1948,_1896,_1900),stocks_r_1_0_1_0_old(Name,hypo(_2038,_2040,_2042,_1892),_1948,_1958,_1900,_1904).
stocks_r_1_0_1_0_invest(_9228,_9234,hypo([],9,[],_2190),_2264,_2216,_2246,_2194):-unify_arguments_a3([[_9228,Name,_2264,_9270,_9240],[_9234,Stock,_9270,_2210,_9282]]),degree_composition([_2246,_9240,_9282],_2192),stocks_r_1_0_1_0_invest_1(Name,Stock,hypo(_2222,_2224,_2226,_2190),_2210,_2216,_2192,_2194).
stocks_r_1_0_1_0_invest_1(_10376,_10382,hypo([],10,[],_2364),_2738,_2390,_2720,_2368):-unify_arguments_a3([[_10376,Name,_2738,_10418,_10388],[_10382,Stock,_10418,_2384,_10430]]),degree_composition([_2720,_10388,_10430],_2366),=>([11-[Name]],=>([12-[]],stocks_r_1_0_1_0_keep_stock(Name,Stock,hypo(_2696,_2698,_2700,[_2560,_2400|_2364]),_2384,_2390,_2366,_2368),_2560,[_2400|_2364]),_2400,_2364).
stocks_r_1_0_1_0_shareholder(_10696,_10702,hypo([Name],11,[_2400|_2364],_2436),_2468,_2474,_2450,_2452):-reg(11,[Name],_10820),chk(_10820,_2436),unify_arguments_a3([[_10696,Name,_2468,_10738,_10708],[_10702,stock_1,_10738,_2474,_10750]]),degree_composition([_2450,_10708,_10750],_2452).
stocks_r_1_0_1_0_stock_up(_11018,hypo([],12,[_2560,_2400|_2364],_2590),_2610,_2616,_2592,_2594):-reg(12,[],_11092),chk(_11092,_2590),unify_arguments_a3([[_11018,stock_1,_2610,_2616,_11024]]),degree_composition([0.6,_2592,_11024],_2594).
stocks_r_1_0_1_0_bench(hypo([],13,[],_2858),_2912,_2918,_2894,_2896):-ho_call([findall,S,Answers],yes,stocks_r_1_0_1_0_invest(paul,S,hypo(_2936,_2938,_2940,_2858),_2912,_2918,_2878,_2880),[_2912,_2918],[_2878,_2880],_2894,_2896),length(Answers,L),write('Number of answers: '),writeln(L),setenv('Answers',L).
