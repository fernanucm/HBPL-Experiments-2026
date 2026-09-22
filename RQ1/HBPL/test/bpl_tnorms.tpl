:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(transitivity,[product]).
:-directive(fuzzy_rel,[gEqThan,[reflexive,transitive(luka)]]).
:-directive(fuzzy_rel,[frel1,[transitive(min)]]).
t_norm(~,product).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(a,b,0.4).
frel1(a,c,0.4).
frel1(b,c,0.8).
frel2(_86724,_86724,1.0).
frel3(_86844,_86844,1.0).
gEqThan(_86302,_86302,1.0).
gEqThan(a,b,0.4).
gEqThan(a,c,0.20000000000000018).
gEqThan(b,c,0.8).
lEqThan(_86416,_86416,1.0).

sim(c,b,0,0.8).
sim(b,c,0,0.8).
sim(c,a,0,0.32000000000000006).
sim(a,c,0,0.32000000000000006).
sim(b,a,0,0.4).
sim(a,b,0,0.4).

bpl_tnorms_test_suite([test_tnorms_1,test_tnorms_2,test_tnorms_3],_20628,_20628,_20456,_20456).
bpl_tnorms_test_tnorms_1(_37724,_38622,_35264,_36116):-unify_a3(a,b,=:=,0.4),unify_a3(b,c,=:=,0.8),unify_a3(a,c,=<,0.8),unify_a3(a,c,=,D),R is 0.4*0.8,bpl_tnorms_approx_equal(D,R,_37724,_37730,_35264,_35270),unify_a3(c,a,=<,0.8),unify_a3(c,a,=,E),S is 0.4*0.8,bpl_tnorms_approx_equal(E,S,_37730,_38622,_35270,_36116).
bpl_tnorms_test_tnorms_2(_58228,_58234,_56108,_56438):-e_gEqThan(a,b,=:=,0.4),e_gEqThan(b,c,=:=,0.8),e_gEqThan(a,c,=<,0.8),e_gEqThan(a,c,=,D),M is 0.4+0.8-1,R is max(0,M),bpl_tnorms_approx_equal(D,R,_58228,_58234,_56108,_56114),ho_call([eval_negation,not],yes,e_gEqThan(c,a,>,0),[_58598,_58598],[],_56114,_56438).
bpl_tnorms_test_tnorms_3(_74902,_74908,_73020,_73350):-e_frel1(a,b,=:=,0.4),e_frel1(b,c,=:=,0.8),e_frel1(a,c,=<,0.8),e_frel1(a,c,=,D),R is min(0.4,0.8),bpl_tnorms_approx_equal(D,R,_74902,_74908,_73020,_73026),ho_call([eval_negation,not],yes,e_frel1(c,a,>,0),[_75272,_75272],[],_73026,_73350).
bpl_tnorms_approx_equal(Res,Val,_83772,_83772,_83586,_83586):-Res>=Val-1.0e-5,Res=<Val+1.0e-5.
