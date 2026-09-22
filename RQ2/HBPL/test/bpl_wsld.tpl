:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(transitivity,[no]).
:-dynamic bpl_wsld_baby/5.
:-dynamic bpl_wsld_young/5.
:-dynamic bpl_wsld_middle/5.
:-dynamic bpl_wsld_old/5.
:-dynamic bpl_wsld_person/5.
t_norm(~,no).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_9056,_9056,1.0).
frel2(_9084,_9084,1.0).
frel3(_9112,_9112,1.0).
gEqThan(_9000,_9000,1.0).
lEqThan(_9028,_9028,1.0).

sim(old,middle,1,0.5).
sim(middle,old,1,0.5).
sim(old,young,1,0.1).
sim(young,old,1,0.1).
sim(middle,young,1,0.5).
sim(young,middle,1,0.5).
sim(old,person,1,1.0).
sim(person,old,1,1.0).
sim(middle,person,1,1.0).
sim(person,middle,1,1.0).
sim(young,person,1,1.0).
sim(person,young,1,1.0).
sim(young,person,0,1.0).
sim(person,young,0,1.0).
sim(young,baby,0,0.7).
sim(baby,young,0,0.7).
sim(person,baby,0,1.0).
sim(baby,person,0,1.0).

bpl_wsld_test_suite([test_wsld_1,test_wsld_2,test_wsld_3,test_wsld_4,test_wsld_5,test_wsld_6,test_wsld_7,test_wsld_8,test_wsld_9,test_wsld_10,test_wsld_11,test_wsld_12,test_wsld_13,test_wsld_14,test_wsld_15,test_wsld_16,test_wsld_17],_1254,_1254,_1236,_1236).
bpl_wsld_baby(lucy,_1510,_1510,_1492,_1492).
bpl_wsld_young(lucy,_9970,_9972,_9974,_9976):-sat_a3([young:0,baby:0],_9970,_9972),degree_composition([0.7,_9974],_9976).
bpl_wsld_person(lucy,_10094,_10096,_10098,_10098):-sat_a3([person:0,baby:0],_10094,_10096).
bpl_wsld_young(george,_1616,_1616,_1598,_1598).
bpl_wsld_old(george,_10600,_10602,_10604,_10606):-sat_a3([old:1,young:1],_10600,_10602),degree_composition([0.1,_10604],_10606).
bpl_wsld_middle(george,_10724,_10726,_10728,_10730):-sat_a3([middle:1,young:1],_10724,_10726),degree_composition([0.5,_10728],_10730).
bpl_wsld_person(george,_10910,_10912,_10914,_10914):-sat_a3([person:1,young:1],_10910,_10912).
bpl_wsld_person(george,_11096,_11098,_11100,_11100):-sat_a3([person:0,young:0],_11096,_11098).
bpl_wsld_baby(george,_11258,_11260,_11262,_11264):-sat_a3([baby:0,young:0],_11258,_11260),degree_composition([0.7,_11262],_11264).
bpl_wsld_young(charles,_1722,_1722,_1704,_1704).
bpl_wsld_old(charles,_11764,_11766,_11768,_11770):-sat_a3([old:1,young:1],_11764,_11766),degree_composition([0.1,_11768],_11770).
bpl_wsld_middle(charles,_11888,_11890,_11892,_11894):-sat_a3([middle:1,young:1],_11888,_11890),degree_composition([0.5,_11892],_11894).
bpl_wsld_person(charles,_12074,_12076,_12078,_12078):-sat_a3([person:1,young:1],_12074,_12076).
bpl_wsld_person(charles,_12260,_12262,_12264,_12264):-sat_a3([person:0,young:0],_12260,_12262).
bpl_wsld_baby(charles,_12422,_12424,_12426,_12428):-sat_a3([baby:0,young:0],_12422,_12424),degree_composition([0.7,_12426],_12428).
bpl_wsld_old(mary,_1828,_1828,_1810,_1810).
bpl_wsld_middle(mary,_12868,_12870,_12872,_12874):-sat_a3([middle:1,old:1],_12868,_12870),degree_composition([0.5,_12872],_12874).
bpl_wsld_young(mary,_12992,_12994,_12996,_12998):-sat_a3([young:1,old:1],_12992,_12994),degree_composition([0.1,_12996],_12998).
bpl_wsld_person(mary,_13178,_13180,_13182,_13182):-sat_a3([person:1,old:1],_13178,_13180).
bpl_wsld_can_vote(X,_1966,_1984,_1918,_1924):-bpl_wsld_person(X,_1966,_1968,_1918,_1920),(bpl_wsld_middle(X,_1968,_1984,_1920,_1924);bpl_wsld_old(X,_1968,_1984,_1920,_1924)).
bpl_wsld_can_vote_2(_14730,_2278,_2204,_2260,_2172):-unify_arguments_a3([[_14730,person(X),_2278,_2202,_14734]]),degree_composition([_2260,_14734],_2170),(bpl_wsld_middle(X,_2202,_2204,_2170,_2172);bpl_wsld_old(X,_2202,_2204,_2170,_2172)).
bpl_wsld_test_wsld_1(_2446,_2498,_2398,_2408):-bpl_wsld_baby(X,_2446,_2448,_2398,_2400),X==lucy,bpl_wsld_young(Y,_2448,_2470,_2400,_2404),Y==charles,bpl_wsld_old(Z,_2470,_2498,_2404,_2408),Z==mary.
bpl_wsld_test_wsld_2(_2704,_2728,_2672,_2678):-bpl_wsld_young(X,_2704,_2706,_2672,_2674),bpl_wsld_baby(X,_2706,_2728,_2674,_2678),X==lucy.
bpl_wsld_test_wsld_3(_2916,_2940,_2884,_2890):-bpl_wsld_young(X,_2916,_2918,_2884,_2886),bpl_wsld_baby(X,_2918,_2940,_2886,_2890),X==charles.
bpl_wsld_test_wsld_4(_3144,_3184,_3096,_3106):-bpl_wsld_old(Y,_3144,_3146,_3096,_3098),bpl_wsld_middle(Y,_3146,_3162,_3098,_3102),bpl_wsld_young(Y,_3162,_3184,_3102,_3106),Y==charles.
bpl_wsld_test_wsld_5(_3376,_3382,_3358,_3360):-bpl_wsld_middle(Z,_3376,_3382,_3358,_3360),Z==george.
bpl_wsld_test_wsld_6(_3560,_3566,_3542,_3544):-ho_call([bpl_call],yes,(bpl_wsld_middle(Z,_3560,_3566,_3526,_3528),Z==george),[_3560,_3566],[_3526,_3528],_3542,_3544).
bpl_wsld_approximation_degree(test_wsld_2,0.7,_3738,_3738,_3720,_3720).
bpl_wsld_approximation_degree(test_wsld_3,0.7,_3846,_3846,_3828,_3828).
bpl_wsld_approximation_degree(test_wsld_4,0.1,_3954,_3954,_3936,_3936).
bpl_wsld_approximation_degree(test_wsld_5,0.5,_4062,_4062,_4044,_4044).
bpl_wsld_approximation_degree(test_wsld_6,0.5,_4170,_4170,_4152,_4152).
bpl_wsld_test_wsld_7(_4322,_4346,_4306,_4308):-ho_call([eval_negation,not],yes,(bpl_wsld_baby(X,_4322,_4324,_4274,_4276),bpl_wsld_old(X,_4324,_4346,_4276,_4280)),[_4322,_4346],[_4274,_4276,_4276,_4280],_4306,_4308).
bpl_wsld_test_wsld_8(_4574,_4574,_4558,_4560):-ho_call([eval_negation,\+],yes,(bpl_wsld_baby(X,_4574,_4576,_4526,_4528),bpl_wsld_old(X,_4576,_4592,_4528,_4532)),[_4574,_4632],[_4526,_4528,_4528,_4532],_4558,_4560).
bpl_wsld_test_wsld_9(_4804,_4810,_4786,_4788):-ho_call([eval_negation,not],yes,bpl_wsld_middle(george,_4804,_4810,_4770,_4772),[_4804,_4810],[_4770,_4772],_4786,_4788).
bpl_wsld_test_wsld_10(_5004,_5004,_4988,_4990):-ho_call([eval_negation,\+],yes,bpl_wsld_middle(george,_5004,_5006,_4972,_4974),[_5004,_5040],[_4972,_4974],_4988,_4990).
bpl_wsld_test_wsld_11(_5310,_5312,_5222,_5284):-ho_call([eval_negation,not],yes,ho_call([eval_negation,not],yes,bpl_wsld_baby(lucy,_5310,_5312,_5190,_5192),[_5310,_5312],[_5190,_5192],_5206,_5208),[_5310,_5312],[_5206,_5208],_5222,_5224),ho_call([eval_negation,\+],yes,ho_call([eval_negation,\+],yes,bpl_wsld_baby(lucy,_5312,_5384,_5250,_5252),[_5312,_5406],[_5250,_5252],_5266,_5268),[_5312,_5458],[_5266,_5268],_5224,_5284).
bpl_wsld_approximation_degree(test_wsld_7,1,_5606,_5606,_5588,_5588).
bpl_wsld_approximation_degree(test_wsld_9,0.5,_5714,_5714,_5696,_5696).
bpl_wsld_test_wsld_12(_5898,_5904,_5880,_5882):-ho_call([findall,X,L],yes,bpl_wsld_person(X,_5898,_5904,_5864,_5866),[_5898,_5904],[_5864,_5866],_5880,_5882),sort(L,SL),SL=[charles,george,lucy,mary].
bpl_wsld_test_wsld_13(_6152,_6158,_6134,_6136):-ho_call([findall,X,L],yes,bpl_wsld_can_vote(X,_6152,_6158,_6118,_6120),[_6152,_6158],[_6118,_6120],_6134,_6136),sort(L,SL),SL=[charles,george,mary].
bpl_wsld_test_wsld_14(_6418,_6424,_6400,_6402):-ho_call([findall,X,L],yes,bpl_wsld_can_vote_2(X,_6418,_6424,_6384,_6386),[_6418,_6424],[_6384,_6386],_6400,_6402),sort(L,SL),SL=[person(charles),person(george),person(mary)].
bpl_wsld_test_wsld_15(_6840,_6846,_6822,_6824):-assert(bpl_wsld_middle(adrian,_6602,_6602,_6584,_6584)),assert((bpl_wsld_old(adrian,_50032,_50034,_50036,_50038):-sat_a3([old:1,middle:1],_50032,_50034),degree_composition([0.5,_50036],_50038))),assert((bpl_wsld_young(adrian,_50440,_50442,_50444,_50446):-sat_a3([young:1,middle:1],_50440,_50442),degree_composition([0.5,_50444],_50446))),assert((bpl_wsld_person(adrian,_50928,_50930,_50932,_50932):-sat_a3([person:1,middle:1],_50928,_50930))),bpl_wsld_young(adrian,_6840,_6846,_6822,_6824),bpl_retract(bpl_wsld_middle(adrian,_6720,_6720,_6702,_6702)),bpl_retract((bpl_wsld_old(adrian,_53974,_53976,_53978,_53980):-sat_a3([old:1,middle:1],_53974,_53976),degree_composition([0.5,_53978],_53980))),bpl_retract((bpl_wsld_young(adrian,_54382,_54384,_54386,_54388):-sat_a3([young:1,middle:1],_54382,_54384),degree_composition([0.5,_54386],_54388))),bpl_retract((bpl_wsld_person(adrian,_54870,_54872,_54874,_54874):-sat_a3([person:1,middle:1],_54870,_54872))).
bpl_wsld_test_wsld_16(_7544,_7550,_7526,_7528):-assert(bpl_wsld_baby(mike,_6996,_6996,_6978,_6978)),assert((bpl_wsld_young(mike,_59684,_59686,_59688,_59690):-sat_a3([young:0,baby:0],_59684,_59686),degree_composition([0.7,_59688],_59690))),assert((bpl_wsld_person(mike,_60092,_60094,_60096,_60096):-sat_a3([person:0,baby:0],_60092,_60094))),assert(bpl_wsld_old(steve,_7114,_7114,_7096,_7096)),assert((bpl_wsld_middle(steve,_62594,_62596,_62598,_62600):-sat_a3([middle:1,old:1],_62594,_62596),degree_composition([0.5,_62598],_62600))),assert((bpl_wsld_young(steve,_63002,_63004,_63006,_63008):-sat_a3([young:1,old:1],_63002,_63004),degree_composition([0.1,_63006],_63008))),assert((bpl_wsld_person(steve,_63490,_63492,_63494,_63494):-sat_a3([person:1,old:1],_63490,_63492))),ho_call([findall,X,L],yes,bpl_wsld_can_vote(X,_7544,_7550,_7510,_7512),[_7544,_7550],[_7510,_7512],_7526,_7528),sort(L,SL),SL=[charles,george,mary,steve],bpl_retract(bpl_wsld_baby(mike,_7262,_7262,_7244,_7244)),bpl_retract((bpl_wsld_young(mike,_70276,_70278,_70280,_70282):-sat_a3([young:0,baby:0],_70276,_70278),degree_composition([0.7,_70280],_70282))),bpl_retract((bpl_wsld_person(mike,_70684,_70686,_70688,_70688):-sat_a3([person:0,baby:0],_70684,_70686))),bpl_retract(bpl_wsld_old(steve,_7380,_7380,_7362,_7362)),bpl_retract((bpl_wsld_middle(steve,_72974,_72976,_72978,_72980):-sat_a3([middle:1,old:1],_72974,_72976),degree_composition([0.5,_72978],_72980))),bpl_retract((bpl_wsld_young(steve,_73382,_73384,_73386,_73388):-sat_a3([young:1,old:1],_73382,_73384),degree_composition([0.1,_73386],_73388))),bpl_retract((bpl_wsld_person(steve,_73870,_73872,_73874,_73874):-sat_a3([person:1,old:1],_73870,_73872))).
bpl_wsld_test_wsld_17(_8058,_8064,_8040,_8042):-bpl_retract(bpl_wsld_old(mary,_7752,_7752,_7734,_7734)),bpl_retract((bpl_wsld_middle(mary,_79338,_79340,_79342,_79344):-sat_a3([middle:1,old:1],_79338,_79340),degree_composition([0.5,_79342],_79344))),bpl_retract((bpl_wsld_young(mary,_79746,_79748,_79750,_79752):-sat_a3([young:1,old:1],_79746,_79748),degree_composition([0.1,_79750],_79752))),bpl_retract((bpl_wsld_person(mary,_80234,_80236,_80238,_80238):-sat_a3([person:1,old:1],_80234,_80236))),ho_call([findall,X,L],yes,bpl_wsld_person(X,_8058,_8064,_8024,_8026),[_8058,_8064],[_8024,_8026],_8040,_8042),sort(L,SL),SL=[charles,george,lucy],assert(bpl_wsld_old(mary,_7894,_7894,_7876,_7876)),assert((bpl_wsld_middle(mary,_86774,_86776,_86778,_86780):-sat_a3([middle:1,old:1],_86774,_86776),degree_composition([0.5,_86778],_86780))),assert((bpl_wsld_young(mary,_87182,_87184,_87186,_87188):-sat_a3([young:1,old:1],_87182,_87184),degree_composition([0.1,_87186],_87188))),assert((bpl_wsld_person(mary,_87670,_87672,_87674,_87674):-sat_a3([person:1,old:1],_87670,_87672))).
bpl_wsld_approximation_degree(test_wsld_15,0.5,_8254,_8254,_8236,_8236).
