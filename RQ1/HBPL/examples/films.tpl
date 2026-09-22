:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(lambda_cut,[0.5]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


gEqThan(_4152,_4152,1.0).
lEqThan(_4182,_4182,1.0).
frel1(_4212,_4212,1.0).
frel2(_4242,_4242,1.0).
frel3(_4264,_4264,1.0).

sim(beverly_hills,downtown,1,0.3).
sim(downtown,beverly_hills,1,0.3).
sim(beverly_hills,santa_monica,1,0.45).
sim(santa_monica,beverly_hills,1,0.45).
sim(downtown,santa_monica,1,0.23).
sim(santa_monica,downtown,1,0.23).
sim(beverly_hills,hollywood,1,0.56).
sim(hollywood,beverly_hills,1,0.56).
sim(downtown,hollywood,1,0.45).
sim(hollywood,downtown,1,0.45).
sim(santa_monica,hollywood,1,0.3).
sim(hollywood,santa_monica,1,0.3).
sim(beverly_hills,westwood,1,0.9).
sim(westwood,beverly_hills,1,0.9).
sim(downtown,westwood,1,0.25).
sim(westwood,downtown,1,0.25).
sim(santa_monica,westwood,1,0.9).
sim(westwood,santa_monica,1,0.9).
sim(hollywood,westwood,1,0.45).
sim(westwood,hollywood,1,0.45).
sim(comedy,drama,0,0.6).
sim(drama,comedy,0,0.6).
sim(comedy,adventure,0,0.3).
sim(adventure,comedy,0,0.3).
sim(drama,adventure,0,0.6).
sim(adventure,drama,0,0.6).
sim(comedy,suspense,0,0.3).
sim(suspense,comedy,0,0.3).
sim(drama,suspense,0,0.6).
sim(suspense,drama,0,0.6).
sim(adventure,suspense,0,0.9).
sim(suspense,adventure,0,0.9).

films_film(four_feathers,korda,_5390,_610,_616,_592,_594):-unify_arguments_a3([[_5390,adventure,_610,_616,_5394]]),degree_composition([_592,_5394],_594),over_lambdacut(_592).
films_film(modern_times,chaplin,_5642,_704,_710,_686,_688):-unify_arguments_a3([[_5642,comedy,_704,_710,_5646]]),degree_composition([_686,_5646],_688),over_lambdacut(_686).
films_film(psycho,hitchcock,_5894,_798,_804,_780,_782):-unify_arguments_a3([[_5894,suspense,_798,_804,_5898]]),degree_composition([_780,_5898],_782),over_lambdacut(_780).
films_film(rear_window,hitchcock,_6146,_892,_898,_874,_876):-unify_arguments_a3([[_6146,suspense,_892,_898,_6150]]),degree_composition([_874,_6150],_876),over_lambdacut(_874).
films_film(robbery,yates,_6720,_986,_992,_968,_970):-unify_arguments_a3([[_6720,suspense,_986,_992,_6738]]),degree_composition([_968,_6738],_970),over_lambdacut(_968).
films_film(star_wars,lucas,_7508,_1080,_1086,_1062,_1064):-unify_arguments_a3([[_7508,adventure,_1080,_1086,_7526]]),degree_composition([_1062,_7526],_1064),over_lambdacut(_1062).
films_film(surf_party,dexter,_8296,_1174,_1180,_1156,_1158):-unify_arguments_a3([[_8296,drama,_1174,_1180,_8314]]),degree_composition([_1156,_8314],_1158),over_lambdacut(_1156).
films_theater(chinese,mann,_9102,_1268,_1274,_1250,_1252):-unify_arguments_a3([[_9102,hollywood,_1268,_1274,_9120]]),degree_composition([_1250,_9120],_1252),over_lambdacut(_1250).
films_theater(egyptian,va,_9908,_1362,_1368,_1344,_1346):-unify_arguments_a3([[_9908,westwood,_1362,_1368,_9926]]),degree_composition([_1344,_9926],_1346),over_lambdacut(_1344).
films_theater(music_hall,lae,_10714,_1456,_1462,_1438,_1440):-unify_arguments_a3([[_10714,beverly_hills,_1456,_1462,_10732]]),degree_composition([_1438,_10732],_1440),over_lambdacut(_1438).
films_theater(odeon,cineplex,_11520,_1550,_1556,_1532,_1534):-unify_arguments_a3([[_11520,santa_monica,_1550,_1556,_11538]]),degree_composition([_1532,_11538],_1534),over_lambdacut(_1532).
films_theater(rialto,independent,downtown,_1644,_1644,_1626,_1626).
films_theater(village,mann,_12988,_1738,_1744,_1720,_1722):-unify_arguments_a3([[_12988,westwood,_1738,_1744,_13006]]),degree_composition([_1720,_13006],_1722),over_lambdacut(_1720).
films_engagement(modern_times,rialto,_1832,_1832,_1814,_1814).
films_engagement(start_wars,rialto,_1924,_1924,_1906,_1906).
films_engagement(star_wars,chinese,_2016,_2016,_1998,_1998).
films_engagement(rear_window,egyptian,_2108,_2108,_2090,_2090).
films_engagement(surf_party,village,_2200,_2200,_2182,_2182).
films_engagement(robbery,odeon,_2292,_2292,_2274,_2274).
films_engagement(modern_times,odeon,_2384,_2384,_2366,_2366).
films_engagement(four_feathers,music_hall,_2476,_2476,_2458,_2458).
films_search(_21896,_21988,_22092,_22208,_2716,_2642,_2698,_2558):-unify_arguments_a3([[_21896,Category,_2716,_21964,_21934],[_21988,Location,_21964,_22056,_22026],[_22092,Film,_22056,_22160,_22130],[_22208,Theater,_22160,_2596,_22246]]),degree_composition([_2698,_21934,_22026,_22130,_22246],_2550),over_lambdacut(_2698),films_film(Film,_,Category,_2596,_2598,_2550,_2552),films_engagement(Film,Theater,_2598,_2618,_2552,_2554),films_theater(Theater,_,Location,_2618,_2642,_2554,_2558).
