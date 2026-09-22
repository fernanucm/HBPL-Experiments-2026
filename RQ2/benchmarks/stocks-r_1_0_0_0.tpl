:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_2966,_2966,1.0).
frel2(_2994,_2994,1.0).
frel3(_3014,_3014,1.0).
gEqThan(_2910,_2910,1.0).
lEqThan(_2938,_2938,1.0).

sim(young,middle,1,0.62).
sim(middle,young,1,0.62).
sim(old,middle,0,0.5).
sim(middle,old,0,0.5).

stocks_r_1_0_0_0_middle(_3342,hypo([],0,[],_768),_788,_794,_770,_772):-unify_arguments_a3([[_3342,paul,_788,_794,_3348]]),degree_composition([_770,_3348],_772).
stocks_r_1_0_0_0_young(_3562,hypo([],0,[],_3276),_3260,_3262,_3264,_3266):-sat_a3([young:1,middle:1],_3260,_3592),unify_arguments_a3([[_3562,paul,_3592,_3262,_3568]]),degree_composition([0.62,_3264,_3568],_3266).
stocks_r_1_0_0_0_old(_3826,hypo([],0,[],_3496),_3480,_3482,_3484,_3486):-sat_a3([old:0,middle:0],_3480,_3856),unify_arguments_a3([[_3826,paul,_3856,_3482,_3832]]),degree_composition([0.5,_3484,_3832],_3486).
stocks_r_1_0_0_0_old(_4128,hypo([],1,[],_886),_906,_912,_888,_890):-unify_arguments_a3([[_4128,mary,_906,_912,_4134]]),degree_composition([_888,_4134],_890).
stocks_r_1_0_0_0_middle(_4348,hypo([],1,[],_4062),_4046,_4048,_4050,_4052):-sat_a3([middle:0,old:0],_4046,_4378),unify_arguments_a3([[_4348,mary,_4378,_4048,_4354]]),degree_composition([0.5,_4050,_4354],_4052).
stocks_r_1_0_0_0_shareholder(_4628,_4634,hypo([],2,[],_1004),_1024,_1030,_1006,_1008):-unify_arguments_a3([[_4628,paul,_1024,_4670,_4640],[_4634,google,_4670,_1030,_4682]]),degree_composition([_1006,_4640,_4682],_1008).
stocks_r_1_0_0_0_shareholder(_5560,_5566,hypo([],3,[],_1124),_1144,_1150,_1126,_1128):-unify_arguments_a3([[_5560,paul,_1144,_5602,_5572],[_5566,greek_bonds,_5602,_1150,_5614]]),degree_composition([_1126,_5572,_5614],_1128).
stocks_r_1_0_0_0_shareholder(_6638,_6644,hypo([],4,[],_1244),_1264,_1270,_1246,_1248):-unify_arguments_a3([[_6638,mary,_1264,_6680,_6650],[_6644,google,_6680,_1270,_6692]]),degree_composition([_1246,_6650,_6692],_1248).
stocks_r_1_0_0_0_stock_up(_7684,hypo([],5,[],_1358),_1378,_1384,_1360,_1362):-unify_arguments_a3([[_7684,google,_1378,_1384,_7690]]),degree_composition([0.9,_1360,_7690],_1362).
stocks_r_1_0_0_0_stock_up(_8674,hypo([],6,[],_1470),_1490,_1496,_1472,_1474):-unify_arguments_a3([[_8674,greek_bonds,_1490,_1496,_8680]]),degree_composition([0.2,_1472,_8680],_1474).
stocks_r_1_0_0_0_keep_stock(_13814,_13820,hypo([],7,[],_1588),_1786,_1644,_1768,_1596):-unify_arguments_a3([[_13814,Name,_1786,_13856,_13826],[_13820,Stock,_13856,_1638,_13868]]),degree_composition([_1768,_13826,_13868],_1590),stocks_r_1_0_0_0_shareholder(Name,Stock,hypo(_1684,_1686,_1688,_1588),_1638,_1640,_1590,_1592),(stocks_r_1_0_0_0_stock_up(Stock,hypo(_1710,_1712,_1714,_1588),_1640,_1644,_1592,_1596);stocks_r_1_0_0_0_young(Name,hypo(_1734,_1736,_1738,_1588),_1640,_1644,_1592,_1596)).
stocks_r_1_0_0_0_sell_stock(_19106,_19112,hypo([],8,[],_1886),_2084,_1952,_2066,_1898):-unify_arguments_a3([[_19106,Name,_2084,_19148,_19118],[_19112,Stock,_19148,_1936,_19160]]),degree_composition([_2066,_19118,_19160],_1888),stocks_r_1_0_0_0_shareholder(Name,Stock,hypo(_1982,_1984,_1986,_1886),_1936,_1938,_1888,_1890),stocks_r_1_0_0_0_stock_down(Stock,hypo(_2008,_2010,_2012,_1886),_1938,_1942,_1890,_1894),stocks_r_1_0_0_0_old(Name,hypo(_2032,_2034,_2036,_1886),_1942,_1952,_1894,_1898).
stocks_r_1_0_0_0_invest(_21938,_21944,hypo([],9,[],_2184),_2258,_2210,_2240,_2188):-unify_arguments_a3([[_21938,Name,_2258,_21980,_21950],[_21944,Stock,_21980,_2204,_21992]]),degree_composition([_2240,_21950,_21992],_2186),stocks_r_1_0_0_0_invest_1(Name,Stock,hypo(_2216,_2218,_2220,_2184),_2204,_2210,_2186,_2188).
stocks_r_1_0_0_0_bench(hypo([],10,[],_2378),_2432,_2438,_2414,_2416):-ho_call([findall,S,Answers],yes,stocks_r_1_0_0_0_invest(paul,S,hypo(_2456,_2458,_2460,_2378),_2432,_2438,_2398,_2400),[_2432,_2438],[_2398,_2400],_2414,_2416),length(Answers,L),write('Number of answers: '),writeln(L),setenv('Answers',L).
