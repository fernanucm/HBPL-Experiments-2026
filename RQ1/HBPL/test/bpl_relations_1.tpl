:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(fuzzy_rel,[frel1,[reflexive]]).
:-directive(fuzzy_rel,[frel2,[symmetric]]).
:-directive(fuzzy_rel,[frel3,[transitive]]).
:-directive(fuzzy_rel,[gEqThan,[reflexive,transitive]]).
:-directive(fuzzy_rel,[lEqThan,[transitive,reflexive]]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_7430,_7430,1.0).
frel1(a,b,0.3).
frel1(b,c,0.7).
frel2(a,b,0.3).
frel2(b,a,0.3).
frel2(b,c,0.7).
frel2(c,b,0.7).
frel3(a,b,0.3).
frel3(a,c,0.3).
frel3(b,c,0.7).
gEqThan(_7242,_7242,1.0).
gEqThan(a,b,0.3).
gEqThan(a,c,0.3).
gEqThan(b,c,0.7).
lEqThan(_7322,_7322,1.0).
lEqThan(a,b,0.3).
lEqThan(a,c,0.3).
lEqThan(b,c,0.7).



bpl_relations_1_test_suite([test_relations1_1,test_relations1_2,test_relations1_3,test_relations1_4,test_relations1_5,test_relations1_6,test_relations1_7,test_relations1_8,test_relations1_9,test_relations1_10],_1460,_1460,_1442,_1442).
bpl_relations_1_test_relations1_1(_2096,_2096,_1700,_1782):-e_frel1(W,W,=:=,1),var(W),e_frel1(a,b,=:=,0.3),e_frel1(b,c,=:=,0.7),ho_call([eval_negation,not],yes,e_frel1(b,a,>,0),[_1864,_1864],[],_1700,_1702),ho_call([eval_negation,not],yes,e_frel1(c,b,>,0),[_1892,_1892],[],_1702,_1718),ho_call([eval_negation,not],yes,e_frel1(a,c,>,0),[_1920,_1920],[],_1718,_1734),ho_call([eval_negation,not],yes,e_frel1(c,a,>,0),[_1948,_1948],[],_1734,_1750),ho_call([eval_negation,not],yes,e_frel1(_X,_Y,>,0),[_1976,_1976],[],_1750,_1766),ho_call([eval_negation,not],yes,e_frel1(_Z,c,>,0),[_2004,_2004],[],_1766,_1782).
bpl_relations_1_test_relations1_2(_2560,_2560,_2344,_2378):-e_frel1(c(c),c(c),=:=,1),e_frel1(a(a),b(b),=:=,0.3),e_frel1(b(b),c(c),=:=,0.7),e_frel1(a(b),b(c),=:=,0.3),ho_call([eval_negation,not],yes,e_frel1(a(a),c(c),>,0),[_2418,_2418],[],_2344,_2346),e_frel1(a(a,W),b(b,W),=:=,0.3),ho_call([eval_negation,not],yes,e_frel1(a(_X),b(_Y),>,0),[_2446,_2446],[],_2346,_2362),ho_call([eval_negation,not],yes,e_frel1(b(_Z),b(c),>,0),[_2474,_2474],[],_2362,_2378).
bpl_relations_1_test_relations1_3(_3128,_3128,_2794,_2860):-ho_call([eval_negation,not],yes,e_frel2(W,W,>,0),[_2924,_2924],[],_2794,_2796),e_frel2(a,b,=:=,0.3),e_frel2(b,c,=:=,0.7),e_frel2(b,a,=:=,0.3),e_frel2(c,b,=:=,0.7),ho_call([eval_negation,not],yes,e_frel2(a,c,>,0),[_2952,_2952],[],_2796,_2812),ho_call([eval_negation,not],yes,e_frel2(c,a,>,0),[_2980,_2980],[],_2812,_2828),ho_call([eval_negation,not],yes,e_frel2(_X,_Y,>,0),[_3008,_3008],[],_2828,_2844),ho_call([eval_negation,not],yes,e_frel2(_Z,c,>,0),[_3036,_3036],[],_2844,_2860).
bpl_relations_1_test_relations1_4(_3704,_3704,_3376,_3442):-ho_call([eval_negation,not],yes,e_frel2(c(c),c(c),>,0),[_3506,_3506],[],_3376,_3378),e_frel2(a(a),b(b),=:=,0.3),e_frel2(b(b),c(c),=:=,0.7),e_frel2(a(b),b(c),=:=,0.3),ho_call([eval_negation,not],yes,e_frel2(a(a),c(c),>,0),[_3534,_3534],[],_3378,_3394),ho_call([eval_negation,not],yes,e_frel2(a(a,W),b(b,W),>,0),[_3562,_3562],[],_3394,_3410),ho_call([eval_negation,not],yes,e_frel2(a(_X),b(_Y),>,0),[_3590,_3590],[],_3410,_3426),ho_call([eval_negation,not],yes,e_frel2(b(_Z),b(c),>,0),[_3618,_3618],[],_3426,_3442).
bpl_relations_1_test_relations1_5(_4328,_4328,_3938,_4020):-ho_call([eval_negation,not],yes,e_frel3(W,W,>,0),[_4096,_4096],[],_3938,_3940),e_frel3(a,b,=:=,0.3),e_frel3(b,c,=:=,0.7),ho_call([eval_negation,not],yes,e_frel3(b,a,>,0),[_4124,_4124],[],_3940,_3956),ho_call([eval_negation,not],yes,e_frel3(c,b,>,0),[_4152,_4152],[],_3956,_3972),e_frel3(a,c,=:=,0.3),ho_call([eval_negation,not],yes,e_frel3(c,a,>,0),[_4180,_4180],[],_3972,_3988),ho_call([eval_negation,not],yes,e_frel1(_X,_Y,>,0),[_4208,_4208],[],_3988,_4004),ho_call([eval_negation,not],yes,e_frel1(_Z,c,>,0),[_4236,_4236],[],_4004,_4020).
bpl_relations_1_test_relations1_6(_4848,_4848,_4576,_4626):-ho_call([eval_negation,not],yes,e_frel3(c(c),c(c),>,0),[_4678,_4678],[],_4576,_4578),e_frel3(a(a),b(b),=:=,0.3),e_frel3(b(b),c(c),=:=,0.7),e_frel3(a(b),b(c),=:=,0.3),e_frel3(a(a),c(c),=:=,0.3),ho_call([eval_negation,not],yes,e_frel3(a(a,W),b(b,W),>,0),[_4706,_4706],[],_4578,_4594),ho_call([eval_negation,not],yes,e_frel3(a(_X),b(_Y),>,0),[_4734,_4734],[],_4594,_4610),ho_call([eval_negation,not],yes,e_frel3(b(_Z),b(c),>,0),[_4762,_4762],[],_4610,_4626).
bpl_relations_1_test_relations1_7(_5432,_5432,_5092,_5158):-e_gEqThan(W,W,=:=,1),var(W),e_gEqThan(a,b,=:=,0.3),e_gEqThan(b,c,=:=,0.7),ho_call([eval_negation,not],yes,e_gEqThan(b,a,>,0),[_5228,_5228],[],_5092,_5094),ho_call([eval_negation,not],yes,e_gEqThan(c,b,>,0),[_5256,_5256],[],_5094,_5110),e_gEqThan(a,c,=:=,0.3),ho_call([eval_negation,not],yes,e_gEqThan(c,a,>,0),[_5284,_5284],[],_5110,_5126),ho_call([eval_negation,not],yes,e_gEqThan(_X,_Y,>,0),[_5312,_5312],[],_5126,_5142),ho_call([eval_negation,not],yes,e_gEqThan(_Z,c,>,0),[_5340,_5340],[],_5142,_5158).
bpl_relations_1_test_relations1_8(_5840,_5840,_5680,_5698):-e_gEqThan(c(c),c(c),=:=,1),e_gEqThan(a(a),b(b),=:=,0.3),e_gEqThan(b(b),c(c),=:=,0.7),e_gEqThan(a(b),b(c),=:=,0.3),e_gEqThan(a(a),c(c),=:=,0.3),e_gEqThan(a(a,W),b(b,W),=:=,0.3),ho_call([eval_negation,not],yes,e_gEqThan(a(_X),b(_Y),>,0),[_5726,_5726],[],_5680,_5682),ho_call([eval_negation,not],yes,e_gEqThan(b(_Z),b(c),>,0),[_5754,_5754],[],_5682,_5698).
bpl_relations_1_test_relations1_9(_6424,_6424,_6084,_6150):-e_lEqThan(W,W,=:=,1),var(W),e_lEqThan(a,b,=:=,0.3),e_lEqThan(b,c,=:=,0.7),ho_call([eval_negation,not],yes,e_lEqThan(b,a,>,0),[_6220,_6220],[],_6084,_6086),ho_call([eval_negation,not],yes,e_lEqThan(c,b,>,0),[_6248,_6248],[],_6086,_6102),e_lEqThan(a,c,=:=,0.3),ho_call([eval_negation,not],yes,e_lEqThan(c,a,>,0),[_6276,_6276],[],_6102,_6118),ho_call([eval_negation,not],yes,e_lEqThan(_X,_Y,>,0),[_6304,_6304],[],_6118,_6134),ho_call([eval_negation,not],yes,e_lEqThan(_Z,c,>,0),[_6332,_6332],[],_6134,_6150).
bpl_relations_1_test_relations1_10(_6832,_6832,_6672,_6690):-e_lEqThan(c(c),c(c),=:=,1),e_lEqThan(a(a),b(b),=:=,0.3),e_lEqThan(b(b),c(c),=:=,0.7),e_lEqThan(a(b),b(c),=:=,0.3),e_lEqThan(a(a),c(c),=:=,0.3),e_lEqThan(a(a,W),b(b,W),=:=,0.3),ho_call([eval_negation,not],yes,e_lEqThan(a(_X),b(_Y),>,0),[_6718,_6718],[],_6672,_6674),ho_call([eval_negation,not],yes,e_lEqThan(b(_Z),b(c),>,0),[_6746,_6746],[],_6674,_6690).
