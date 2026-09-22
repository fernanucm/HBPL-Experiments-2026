:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-initialization write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/bpl_lambdacut.bpl:32:22: Equation not loaded: value is below the lambda cut.'),nl.
:-directive(lambda_cut,[0.5]).
:-directive(domain,[speed,0,200,kmh]).
:-directive(fuzzy_set,[speed,[stopped(0,0,10,20),slow(0,0,30,60),middle(40,50,60,80),fast(70,90,200,200)]]).
:-directive(transitivity,[product]).
:-directive(fuzzy_rel,[frel1,[reflexive,symmetric,transitive(yes)]]).
:-directive(fuzzy_rel,[frel2,[]]).
t_norm(~,product).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_90296,_90296,1.0).
frel1(a,b,0.7).
frel1(a,c,0.5).
frel1(b,a,0.7).
frel1(b,c,0.5).
frel1(c,a,0.5).
frel1(c,b,0.5).
frel2(a,b,0.8).
frel3(_90562,_90562,1.0).
gEqThan(_89870,_89870,1.0).
lEqThan(_89990,_89990,1.0).

sim(stopped,slow,4,0.5).
sim(slow,stopped,4,1.0).
sim(slow,middle,3,0.25).
sim(middle,slow,3,0.25).
sim(white,yellow,2,0.8).
sim(yellow,white,2,0.8).
sim(yellow,light_green,1,0.6).
sim(light_green,yellow,1,0.6).
sim(middle,fast,0,0.125).
sim(fast,middle,0,0.125).

bpl_lambdacut_test_suite([test_lambda_1,test_lambda_2],_41362,_41362,_41190,_41190).
bpl_lambdacut_colour(sun,_93512,_53328,_53334,_53142,_53148):-unify_arguments_a3([[_93512,yellow,_53328,_53334,_93530]]),degree_composition([_53142,_93530],_53148).
bpl_lambdacut_light_green(light,_54880,_54880,_54708,_54708).
bpl_lambdacut_yellow(light,_94366,_94368,_94370,_94372):-sat_a3([yellow:1,light_green:1],_94366,_94368),degree_composition([0.6,_94370],_94372).
bpl_lambdacut_bicycle(_95800,_56358,_56364,_56186,_56192):-unify_arguments_a3([[_95800,slow,_56358,_56364,_95818]]),degree_composition([_56186,_95818],_56192).
bpl_lambdacut_test_lambda_1(_63184,_63810,_61918,_62464):-bpl_lambdacut_colour(sun,white,_63184,_63190,_61918,_61924),bpl_lambdacut_yellow(light,_63190,_63504,_61924,_62192),bpl_lambdacut_bicycle(stopped,_63504,_63810,_62192,_62464),e_frel1(sample(a,b),sample(b,c),>,0),e_frel2(a,b,>,0).
bpl_lambdacut_test_lambda_2(_75376,_75376,_73134,_74862):-ho_call([eval_negation,\+],yes,bpl_lambdacut_colour(sun,blue,_75376,_75382,_73034,_73040),[_75376,_75528],[_73034,_73040],_73134,_73140),ho_call([eval_negation,\+],yes,bpl_lambdacut_white(light,_75376,_75900,_73498,_73504),[_75376,_76050],[_73498,_73504],_73140,_73596),ho_call([eval_negation,\+],yes,bpl_lambdacut_bicycle(middle,_75376,_76422,_73966,_73972),[_75376,_76596],[_73966,_73972],_73596,_74064),ho_call([eval_negation,\+],yes,e_frel1(sample(a,b),sample(c,d),>,0),[_77020,_77020],[],_74064,_74522),ho_call([eval_negation,\+],yes,e_frel2(b,a,>,0),[_77320,_77320],[],_74522,_74862).
bpl_lambdacut_approximation_degree(test_lambda_1,_,_86478,_86478,_86292,_86292).
bpl_lambdacut_approximation_degree(test_lambda_2,0,_88222,_88222,_88036,_88036).
