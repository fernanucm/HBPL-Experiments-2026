:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(fuzzy_rel,[frel1,[reflexive,symmetric,transitive]]).
:-directive(transitivity,[yes]).
t_norm(~,yes).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_20976,_20976,1.0).
frel1(a,b,0.3).
frel1(a,c,0.3).
frel1(b,a,0.3).
frel1(b,c,0.7).
frel1(c,a,0.3).
frel1(c,b,0.7).
frel2(_21096,_21096,1.0).
frel3(_21216,_21216,1.0).
gEqThan(_20590,_20590,1.0).
lEqThan(_20704,_20704,1.0).

sim(c,b,0,0.7).
sim(b,c,0,0.7).
sim(c,a,0,0.3).
sim(a,c,0,0.3).
sim(b,a,0,0.3).
sim(a,b,0,0.3).

bpl_relations_3_test_suite([test_relations3_1,test_relations3_2,test_relations3_3,test_relations3_4],_11376,_11376,_11358,_11358).
bpl_relations_3_test_relations3_1(_12086,_12086,_11914,_11932):-e_frel1(W,W,=:=,1),var(W),e_frel1(a,b,=:=,0.3),e_frel1(b,c,=:=,0.7),e_frel1(b,a,=:=,0.3),e_frel1(c,b,=:=,0.7),e_frel1(a,c,=:=,0.3),e_frel1(c,a,=:=,0.3),ho_call([eval_negation,not],yes,e_frel1(_X,_Y,>,0),[_11966,_11966],[],_11914,_11916),ho_call([eval_negation,not],yes,e_frel1(_Z,c,>,0),[_11994,_11994],[],_11916,_11932).
bpl_relations_3_test_relations3_2(_14018,_14018,_13858,_13876):-e_frel1(c(c),c(c),=:=,1),e_frel1(a(a),b(b),=:=,0.3),e_frel1(b(b),c(c),=:=,0.7),e_frel1(a(b),b(c),=:=,0.3),e_frel1(a(a),c(c),=:=,0.3),e_frel1(a(a,W),b(b,W),=:=,0.3),ho_call([eval_negation,not],yes,e_frel1(a(_X),b(_Y),>,0),[_13904,_13904],[],_13858,_13860),ho_call([eval_negation,not],yes,e_frel1(b(_Z),b(c),>,0),[_13932,_13932],[],_13860,_13876).
bpl_relations_3_test_relations3_3(_16066,_16066,_16048,_16048):-unify_a3(W,W,=:=,1),var(W),unify_a3(a,b,=:=,0.3),unify_a3(b,c,=:=,0.7),unify_a3(b,a,=:=,0.3),unify_a3(c,b,=:=,0.7),unify_a3(a,c,=:=,0.3),unify_a3(c,a,=:=,0.3),unify_a3(a,X,=:=,1),X==a,unify_a3(Y,c,=:=,1),Y==c.
bpl_relations_3_test_relations3_4(_17666,_17666,_17648,_17648):-unify_a3(c(c),c(c),=:=,1),unify_a3(a(a),b(b),=:=,0.3),unify_a3(b(b),c(c),=:=,0.7),unify_a3(a(b),b(c),=:=,0.3),unify_a3(a(a),c(c),=:=,0.3),unify_a3(a(W),a(c),=:=,1),W==c,unify_a3(a(X),b(c),=:=,0.3),X==c,unify_a3(Y,b(c),=:=,1),Y==b(c),unify_a3(c(a),Z,=:=,1),Z==c(a).
