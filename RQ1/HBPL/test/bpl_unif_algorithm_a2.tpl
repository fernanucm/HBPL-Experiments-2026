:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(weak_unification,[a2]).
:-directive(transitivity,[no]).
t_norm(~,no).

frel1(_55428,_55428,1.0).
frel2(_55548,_55548,1.0).
frel3(_55668,_55668,1.0).
gEqThan(_55194,_55194,1.0).
lEqThan(_55308,_55308,1.0).
sim(a,b,0.8).
sim(b,a,0.8).
sim(b,c,0.75).
sim(c,b,0.75).

bpl_unif_algorithm_a2_test_suite([test_a2_1,test_a2_2,test_a2_3,test_a2_4,test_a2_5],_15766,_15766,_15594,_15594).
bpl_unif_algorithm_a2_n(_19152,_19158,_18858,_18864):-ho_call([eval_negation,not],yes,bpl_unif_algorithm_a2_p(b,c,_19152,_19158,_18758,_18764),[_19152,_19158],[_18758,_18764],_18858,_18864).
bpl_unif_algorithm_a2_t(X,_23322,_23322,_23150,_23150):-unify_a2(a,b,=,X).
bpl_unif_algorithm_a2_p(_63810,_63882,_25282,_25288,_25096,_25102):-unify_arguments_a2([[_63810,a,_25282,_63858,_63828],[_63882,c,_63858,_25288,_63900]]),degree_composition([_25096,_63828,_63900],_25102).
bpl_unif_algorithm_a2_p(X,_28418,_28588,_27962,_28098):-bpl_unif_algorithm_a2_q(X,_28418,_28424,_27962,_27968),bpl_unif_algorithm_a2_r(X,_28424,_28588,_27968,_28098).
bpl_unif_algorithm_a2_q(_67666,_31236,_31242,_31064,_31070):-unify_arguments_a2([[_67666,c,_31236,_31242,_67684]]),degree_composition([_31064,_67684],_31070).
bpl_unif_algorithm_a2_r(_68702,_32708,_32714,_32536,_32542):-unify_arguments_a2([[_68702,a,_32708,_32714,_68720]]),degree_composition([_32536,_68720],_32542).
bpl_unif_algorithm_a2_test_a2_1(_35216,_35222,_34922,_34928):-ho_call([eval_negation,not],yes,bpl_unif_algorithm_a2_p(X,X,_35216,_35222,_34822,_34828),[_35216,_35222],[_34822,_34828],_34922,_34928).
bpl_unif_algorithm_a2_test_a2_2(_39662,_39668,_39368,_39374):-ho_call([eval_negation,not],yes,bpl_unif_algorithm_a2_p(b,b,_39662,_39668,_39268,_39274),[_39662,_39668],[_39268,_39274],_39368,_39374).
bpl_unif_algorithm_a2_test_a2_3(_43826,_43832,_43538,_43544):-ho_call([eval_negation,not],yes,bpl_unif_algorithm_a2_p(_X,_43826,_43832,_43446,_43452),[_43826,_43832],[_43446,_43452],_43538,_43544).
bpl_unif_algorithm_a2_test_a2_4(_47958,_47964,_47670,_47676):-ho_call([eval_negation,not],yes,bpl_unif_algorithm_a2_p(b,_47958,_47964,_47578,_47584),[_47958,_47964],[_47578,_47584],_47670,_47676).
bpl_unif_algorithm_a2_test_a2_5(_52736,_52742,_52326,_52332):-bpl_unif_algorithm_a2_t(X,_52736,_52742,_52326,_52332),X==0.8.
