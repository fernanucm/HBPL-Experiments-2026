:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_2786,_2786,1.0).
frel2(_2814,_2814,1.0).
frel3(_2834,_2834,1.0).
gEqThan(_2730,_2730,1.0).
lEqThan(_2758,_2758,1.0).

sim(young,middle,1,0.62).
sim(middle,young,1,0.62).
sim(old,middle,0,0.5).
sim(middle,old,0,0.5).

stocks_s_1_0_0_middle(_3162,hypo([],0,[],_768),_788,_794,_770,_772):-unify_arguments_a3([[_3162,paul,_788,_794,_3168]]),degree_composition([_770,_3168],_772).
stocks_s_1_0_0_young(_3382,hypo([],0,[],_3096),_3080,_3082,_3084,_3086):-sat_a3([young:1,middle:1],_3080,_3412),unify_arguments_a3([[_3382,paul,_3412,_3082,_3388]]),degree_composition([0.62,_3084,_3388],_3086).
stocks_s_1_0_0_old(_3646,hypo([],0,[],_3316),_3300,_3302,_3304,_3306):-sat_a3([old:0,middle:0],_3300,_3676),unify_arguments_a3([[_3646,paul,_3676,_3302,_3652]]),degree_composition([0.5,_3304,_3652],_3306).
stocks_s_1_0_0_old(_3948,hypo([],1,[],_886),_906,_912,_888,_890):-unify_arguments_a3([[_3948,mary,_906,_912,_3954]]),degree_composition([_888,_3954],_890).
stocks_s_1_0_0_middle(_4168,hypo([],1,[],_3882),_3866,_3868,_3870,_3872):-sat_a3([middle:0,old:0],_3866,_4198),unify_arguments_a3([[_4168,mary,_4198,_3868,_4174]]),degree_composition([0.5,_3870,_4174],_3872).
stocks_s_1_0_0_shareholder(_4448,_4454,hypo([],2,[],_1004),_1024,_1030,_1006,_1008):-unify_arguments_a3([[_4448,paul,_1024,_4490,_4460],[_4454,google,_4490,_1030,_4502]]),degree_composition([_1006,_4460,_4502],_1008).
stocks_s_1_0_0_shareholder(_4740,_4746,hypo([],3,[],_1124),_1144,_1150,_1126,_1128):-unify_arguments_a3([[_4740,paul,_1144,_4782,_4752],[_4746,greek_bonds,_4782,_1150,_4794]]),degree_composition([_1126,_4752,_4794],_1128).
stocks_s_1_0_0_shareholder(_5032,_5038,hypo([],4,[],_1244),_1264,_1270,_1246,_1248):-unify_arguments_a3([[_5032,mary,_1264,_5074,_5044],[_5038,google,_5074,_1270,_5086]]),degree_composition([_1246,_5044,_5086],_1248).
stocks_s_1_0_0_stock_up(_5316,hypo([],5,[],_1358),_1378,_1384,_1360,_1362):-unify_arguments_a3([[_5316,google,_1378,_1384,_5322]]),degree_composition([0.9,_1360,_5322],_1362).
stocks_s_1_0_0_stock_up(_5550,hypo([],6,[],_1470),_1490,_1496,_1472,_1474):-unify_arguments_a3([[_5550,greek_bonds,_1490,_1496,_5556]]),degree_composition([0.2,_1472,_5556],_1474).
stocks_s_1_0_0_keep_stock(_9552,_9558,hypo([],7,[],_1588),_1786,_1644,_1768,_1596):-unify_arguments_a3([[_9552,Name,_1786,_9594,_9564],[_9558,Stock,_9594,_1638,_9606]]),degree_composition([_1768,_9564,_9606],_1590),stocks_s_1_0_0_shareholder(Name,Stock,hypo(_1684,_1686,_1688,_1588),_1638,_1640,_1590,_1592),(stocks_s_1_0_0_stock_up(Stock,hypo(_1710,_1712,_1714,_1588),_1640,_1644,_1592,_1596);stocks_s_1_0_0_young(Name,hypo(_1734,_1736,_1738,_1588),_1640,_1644,_1592,_1596)).
stocks_s_1_0_0_sell_stock(_14808,_14814,hypo([],8,[],_1886),_2084,_1952,_2066,_1898):-unify_arguments_a3([[_14808,Name,_2084,_14850,_14820],[_14814,Stock,_14850,_1936,_14862]]),degree_composition([_2066,_14820,_14862],_1888),stocks_s_1_0_0_shareholder(Name,Stock,hypo(_1982,_1984,_1986,_1886),_1936,_1938,_1888,_1890),stocks_s_1_0_0_stock_down(Stock,hypo(_2008,_2010,_2012,_1886),_1938,_1942,_1890,_1894),stocks_s_1_0_0_old(Name,hypo(_2032,_2034,_2036,_1886),_1942,_1952,_1894,_1898).
stocks_s_1_0_0_bench(hypo([],9,[],_2204),_2258,_2264,_2240,_2242):-ho_call([findall,S,Answers],yes,stocks_s_1_0_0_keep_stock(paul,S,hypo(_2282,_2284,_2286,_2204),_2258,_2264,_2224,_2226),[_2258,_2264],[_2224,_2226],_2240,_2242),length(Answers,L),write('Number of answers: '),writeln(L),setenv('Answers',L).
