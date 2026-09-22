:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(weak_unification,[a3]).
:-directive(transitivity,[no]).
t_norm(~,no).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_121780,_121780,1.0).
frel2(_121900,_121900,1.0).
frel3(_122020,_122020,1.0).
gEqThan(_121546,_121546,1.0).
lEqThan(_121660,_121660,1.0).

sim(c,b,1,0.75).
sim(b,c,1,0.75).
sim(b,a,0,0.8).
sim(a,b,0,0.8).

bpl_higherorder_1_test_suite([test_ho_1,test_ho_2,test_ho_3,test_ho_4,test_ho_5,test_ho_6,test_ho_7,test_ho_8,test_ho_9,test_ho_10,test_ho_11,test_ho_12],_27026,_27026,_26854,_26854).
bpl_higherorder_1_eq(X,_124838,_30332,_30338,_30146,_30152):-unify_arguments_a3([[_124838,X,_30332,_30338,_124876]]),degree_composition([_30146,_124876],_30152).
bpl_higherorder_1_test_ho_1(_33026,_33032,_32732,_32738):-ho_call([bpl_call],yes,bpl_higherorder_1_eq(a,b,_33026,_33032,_32632,_32638),[_33026,_33032],[_32632,_32638],_32732,_32738).
bpl_higherorder_1_test_ho_2(_38470,_38666,_38046,_38052):-ho_call([bpl_call],yes,(bpl_higherorder_1_eq(a,b,_38470,_38476,_37778,_37784),bpl_higherorder_1_eq(a,b,_38476,_38666,_37784,_37928)),[_38470,_38666],[_37778,_37784,_37784,_37928],_38046,_38052).
bpl_higherorder_1_test_ho_3(_44844,_45040,_44420,_44426):-ho_call([bpl_call],yes,(bpl_higherorder_1_eq(a,b,_44844,_44850,_44152,_44158),bpl_higherorder_1_eq(b,c,_44850,_45040,_44158,_44302)),[_44844,_45040],[_44152,_44158,_44158,_44302],_44420,_44426).
bpl_higherorder_1_test_ho_4(_51694,_51890,_51142,_51148):-ho_call([eval_negation,not],yes,ho_call([bpl_call],yes,(bpl_higherorder_1_eq(a,b,_51694,_51700,_50794,_50800),bpl_higherorder_1_eq(b,c,_51700,_51890,_50800,_50944)),[_51694,_51890],[_50794,_50800,_50800,_50944],_51062,_51068),[_51694,_51890],[_51062,_51068],_51142,_51148).
bpl_higherorder_1_test_ho_5(_59116,_59122,_58670,_58676):-X=eq(a,b),ho_call([bpl_call],no,X,[_59116,_59122],_58664,_58670,_58676).
bpl_higherorder_1_test_ho_6(_64866,_64872,_64420,_64426):-X=(eq(a,b),eq(a,b)),ho_call([bpl_call],no,X,[_64866,_64872],_64414,_64420,_64426).
bpl_higherorder_1_test_ho_7(_70860,_70866,_70414,_70420):-X=(eq(a,b),eq(b,c)),ho_call([bpl_call],no,X,[_70860,_70866],_70408,_70414,_70420).
bpl_higherorder_1_test_ho_8(_77174,_77180,_76728,_76734):-X=eval_negation(not,bpl_call((eq(a,b),eq(b,c)))),ho_call([bpl_call],no,X,[_77174,_77180],_76722,_76728,_76734).
bpl_higherorder_1_test_ho_9(_82930,_82936,_82484,_82490):-X=eval_negation(not,bpl_call(eq(a,b))),ho_call([bpl_call],no,X,[_82930,_82936],_82478,_82484,_82490).
bpl_higherorder_1_test_ho_10(_86898,_86904,_86598,_86604):-ho_call([eval_negation,not],yes,weak_unify_a3(a,b,0,_86898,_86904,_86490,_86496),[_86898,_86904],[_86490,_86496],_86598,_86604).
bpl_higherorder_1_test_ho_11(_92492,_92816,_91824,_92178):-bpl_higherorder_1_eq(a,b,_92492,_92498,_91824,_91830),ho_call([bpl_call],yes,bpl_higherorder_1_eq(b,c,_92498,_92816,_92072,_92078),[_92498,_92816],[_92072,_92078],_91830,_92178).
bpl_higherorder_1_test_ho_12(_99184,_99584,_98408,_98742):-ho_call([bpl_call],yes,bpl_higherorder_1_eq(a,b,_99184,_99190,_98308,_98314),[_99184,_99190],[_98308,_98314],_98408,_98414),ho_call([bpl_call],yes,bpl_higherorder_1_eq(b,c,_99190,_99584,_98636,_98642),[_99190,_99584],[_98636,_98642],_98414,_98742).
bpl_higherorder_1_approximation_degree(test_ho_1,0.8,_104430,_104430,_104244,_104244).
bpl_higherorder_1_approximation_degree(test_ho_2,0.8,_106150,_106150,_105964,_105964).
bpl_higherorder_1_approximation_degree(test_ho_3,0,_107870,_107870,_107684,_107684).
bpl_higherorder_1_approximation_degree(test_ho_5,0.8,_109590,_109590,_109404,_109404).
bpl_higherorder_1_approximation_degree(test_ho_6,0.8,_111310,_111310,_111124,_111124).
bpl_higherorder_1_approximation_degree(test_ho_7,0,_113030,_113030,_112844,_112844).
bpl_higherorder_1_approximation_degree(test_ho_9,0.19999999999999996,_114750,_114750,_114564,_114564).
bpl_higherorder_1_approximation_degree(test_ho_10,0.19999999999999996,_116470,_116470,_116284,_116284).
bpl_higherorder_1_approximation_degree(test_ho_11,0,_118190,_118190,_118004,_118004).
bpl_higherorder_1_approximation_degree(test_ho_12,0,_119910,_119910,_119724,_119724).
