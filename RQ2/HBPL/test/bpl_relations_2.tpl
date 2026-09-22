:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(fuzzy_rel,[frel1,[]]).
:-directive(fuzzy_rel,[frel2,[reflexive,symmetric]]).
:-directive(fuzzy_rel,[frel3,[symmetric,transitive]]).
:-directive(transitivity,[no]).
t_norm(~,no).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(a,b,0.3).
frel1(b,c,0.7).
frel2(_5972,_5972,1.0).
frel2(a,b,0.3).
frel2(b,a,0.3).
frel2(b,c,0.7).
frel2(c,b,0.7).
frel3(a,a,0.3).
frel3(a,b,0.3).
frel3(a,c,0.3).
frel3(b,a,0.3).
frel3(b,b,0.7).
frel3(b,c,0.7).
frel3(c,a,0.3).
frel3(c,b,0.7).
frel3(c,c,0.7).
gEqThan(_5708,_5708,1.0).
lEqThan(_5736,_5736,1.0).

sim(c,b,1,0.7).
sim(b,c,1,0.7).
sim(b,a,0,0.3).
sim(a,b,0,0.3).

bpl_relations_2_test_suite([test_relations2_1,test_relations2_2,test_relations2_3,test_relations2_4,test_relations2_5,test_relations2_6,test_relations2_7,test_relations2_8],_1344,_1344,_1326,_1326).
bpl_relations_2_test_relations2_1(_2020,_2020,_1574,_1672):-ho_call([eval_negation,not],yes,e_frel1(W,W,>,0),[_1760,_1760],[],_1574,_1576),e_frel1(a,b,=:=,0.3),e_frel1(b,c,=:=,0.7),ho_call([eval_negation,not],yes,e_frel1(b,a,>,0),[_1788,_1788],[],_1576,_1592),ho_call([eval_negation,not],yes,e_frel1(c,b,>,0),[_1816,_1816],[],_1592,_1608),ho_call([eval_negation,not],yes,e_frel1(a,c,>,0),[_1844,_1844],[],_1608,_1624),ho_call([eval_negation,not],yes,e_frel1(c,a,>,0),[_1872,_1872],[],_1624,_1640),ho_call([eval_negation,not],yes,e_frel1(_X,_Y,>,0),[_1900,_1900],[],_1640,_1656),ho_call([eval_negation,not],yes,e_frel1(_Z,c,>,0),[_1928,_1928],[],_1656,_1672).
bpl_relations_2_test_relations2_2(_2596,_2596,_2268,_2334):-ho_call([eval_negation,not],yes,e_frel1(c(c),c(c),>,0),[_2398,_2398],[],_2268,_2270),e_frel1(a(a),b(b),=:=,0.3),e_frel1(b(b),c(c),=:=,0.7),e_frel1(a(b),b(c),=:=,0.3),ho_call([eval_negation,not],yes,e_frel1(a(a),c(c),>,0),[_2426,_2426],[],_2270,_2286),ho_call([eval_negation,not],yes,e_frel1(a(a,W),b(b,W),>,0),[_2454,_2454],[],_2286,_2302),ho_call([eval_negation,not],yes,e_frel1(a(_X),b(_Y),>,0),[_2482,_2482],[],_2302,_2318),ho_call([eval_negation,not],yes,e_frel1(b(_Z),b(c),>,0),[_2510,_2510],[],_2318,_2334).
bpl_relations_2_test_relations2_3(_3124,_3124,_2840,_2890):-e_frel2(W,W,=:=,1),var(W),e_frel2(a,b,=:=,0.3),e_frel2(b,c,=:=,0.7),e_frel2(b,a,=:=,0.3),e_frel2(c,b,=:=,0.7),ho_call([eval_negation,not],yes,e_frel2(a,c,>,0),[_2948,_2948],[],_2840,_2842),ho_call([eval_negation,not],yes,e_frel2(c,a,>,0),[_2976,_2976],[],_2842,_2858),ho_call([eval_negation,not],yes,e_frel2(_X,_Y,>,0),[_3004,_3004],[],_2858,_2874),ho_call([eval_negation,not],yes,e_frel2(_Z,c,>,0),[_3032,_3032],[],_2874,_2890).
bpl_relations_2_test_relations2_4(_3588,_3588,_3372,_3406):-e_frel2(c(c),c(c),=:=,1),e_frel2(a(a),b(b),=:=,0.3),e_frel2(b(b),c(c),=:=,0.7),e_frel2(a(b),b(c),=:=,0.3),ho_call([eval_negation,not],yes,e_frel2(a(a),c(c),>,0),[_3446,_3446],[],_3372,_3374),e_frel2(a(a,W),b(b,W),=:=,0.3),ho_call([eval_negation,not],yes,e_frel2(a(_X),b(_Y),>,0),[_3474,_3474],[],_3374,_3390),ho_call([eval_negation,not],yes,e_frel2(b(_Z),b(c),>,0),[_3502,_3502],[],_3390,_3406).
bpl_relations_2_test_relations2_5(_4050,_4050,_3828,_3862):-ho_call([eval_negation,not],yes,e_frel3(W,W,>,0),[_3902,_3902],[],_3828,_3830),e_frel3(a,b,=:=,0.3),e_frel3(b,c,=:=,0.7),e_frel3(b,a,=:=,0.3),e_frel3(c,b,=:=,0.7),e_frel3(a,c,=:=,0.3),e_frel3(c,a,=:=,0.3),ho_call([eval_negation,not],yes,e_frel3(_X,_Y,>,0),[_3930,_3930],[],_3830,_3846),ho_call([eval_negation,not],yes,e_frel3(_Z,c,>,0),[_3958,_3958],[],_3846,_3862).
bpl_relations_2_test_relations2_6(_4514,_4514,_4298,_4332):-e_frel3(c(c),c(c),=:=,0.7),e_frel3(a(a),b(b),=:=,0.3),e_frel3(b(b),c(c),=:=,0.7),e_frel3(a(b),b(c),=:=,0.3),e_frel3(a(a),c(c),=:=,0.3),ho_call([eval_negation,not],yes,e_frel3(a(a,W),b(b,W),>,0),[_4372,_4372],[],_4298,_4300),ho_call([eval_negation,not],yes,e_frel3(a(_X),b(_Y),>,0),[_4400,_4400],[],_4300,_4316),ho_call([eval_negation,not],yes,e_frel3(b(_Z),b(c),>,0),[_4428,_4428],[],_4316,_4332).
bpl_relations_2_test_relations2_7(_4944,_4944,_4760,_4778):-unify_a3(W,W,=:=,1),var(W),unify_a3(a,b,=:=,0.3),unify_a3(b,c,=:=,0.7),unify_a3(b,a,=:=,0.3),unify_a3(c,b,=:=,0.7),ho_call([eval_negation,not],yes,unify_a3(a,c,>,0),[_4812,_4812],[],_4760,_4762),ho_call([eval_negation,not],yes,unify_a3(c,a,>,0),[_4840,_4840],[],_4762,_4778),unify_a3(a,X,=:=,1),X==a,unify_a3(Y,c,=:=,1),Y==c.
bpl_relations_2_test_relations2_8(_5356,_5356,_5228,_5230):-unify_a3(c(c),c(c),=:=,1),unify_a3(a(a),b(b),=:=,0.3),unify_a3(b(b),c(c),=:=,0.7),ho_call([eval_negation,not],yes,unify_a3(a(a),c(c),>,0),[_5246,_5246],[],_5228,_5230),unify_a3(a(W),a(c),=:=,1),W==c,unify_a3(a(X),b(c),=:=,0.3),X==c,unify_a3(Y,b(c),=:=,1),Y==b(c),unify_a3(c(a),Z,=:=,1),Z==c(a).
