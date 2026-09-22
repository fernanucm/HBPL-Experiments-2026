:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(weak_unification,[a1]).
:-directive(transitivity,[no]).
t_norm(~,no).

frel1(_43404,_43404,1.0).
frel2(_43524,_43524,1.0).
frel3(_43644,_43644,1.0).
gEqThan(_43170,_43170,1.0).
lEqThan(_43284,_43284,1.0).
sim(a,b,0.8).
sim(b,a,0.8).
sim(b,c,0.75).
sim(c,b,0.75).

bpl_unif_algorithm_a1_test_suite([test_a1_1,test_a1_2,test_a1_3,test_a1_4,test_a1_5],_15326,_15326).
bpl_unif_algorithm_a1_t(X,_18064,_18064):-unify_a1(a,b,=,X).
bpl_unif_algorithm_a1_p(_47730,_47794,_19712,_19718):-unify_arguments_a1([[_47730,a,_47748],[_47794,c,_47812]]),degree_composition([_19712,_47748,_47812],_19718).
bpl_unif_algorithm_a1_p(X,_22254,_22390):-bpl_unif_algorithm_a1_q(X,_22254,_22260),bpl_unif_algorithm_a1_r(X,_22260,_22390).
bpl_unif_algorithm_a1_q(_51042,_24334,_24340):-unify_arguments_a1([[_51042,c,_51060]]),degree_composition([_24334,_51060],_24340).
bpl_unif_algorithm_a1_r(_52022,_25508,_25514):-unify_arguments_a1([[_52022,a,_52040]]),degree_composition([_25508,_52040],_25514).
bpl_unif_algorithm_a1_test_a1_1(_27596,_27602):-ho_call([eval_negation,not],yes,bpl_unif_algorithm_a1_p(X,X,_27496,_27502),[_27496,_27502],_27596,_27602).
bpl_unif_algorithm_a1_test_a1_2(_30576,_30582):-bpl_unif_algorithm_a1_p(b,b,_30576,_30582).
bpl_unif_algorithm_a1_test_a1_3(_32842,_32848):-ho_call([eval_negation,not],yes,bpl_unif_algorithm_a1_p(_X,_32750,_32756),[_32750,_32756],_32842,_32848).
bpl_unif_algorithm_a1_test_a1_4(_35542,_35548):-bpl_unif_algorithm_a1_p(b,_35542,_35548).
bpl_unif_algorithm_a1_test_a1_5(_38312,_38318):-bpl_unif_algorithm_a1_t(X,_38312,_38318),X==0.8.
bpl_unif_algorithm_a1_approximation_degree(test_a1_2,0.75,_40342,_40342).
bpl_unif_algorithm_a1_approximation_degree(test_a1_4,0.75,_41738,_41738).
