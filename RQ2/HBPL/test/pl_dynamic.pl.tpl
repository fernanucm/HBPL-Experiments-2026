:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-dynamic pl_dynamic_db_assert_legs/6.
:-dynamic pl_dynamic_db_assert_insect/5.
:-dynamic pl_dynamic_db_assert_foo/5.
:-dynamic pl_dynamic_db_retract_legs/6.
:-dynamic pl_dynamic_db_retract_insect/5.
:-dynamic pl_dynamic_db_retract_foo/5.
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_67324,_67324,1.0).
frel2(_67444,_67444,1.0).
frel3(_67564,_67564,1.0).
gEqThan(_67090,_67090,1.0).
lEqThan(_67204,_67204,1.0).



pl_dynamic_test_suites([test_assert,test_retract],_7876,_7876,_7858,_7858).
pl_dynamic_db_assert_legs(A,6,_8202,_8208,_8184,_8186):-pl_dynamic_db_assert_insect(A,_8202,_8208,_8184,_8186).
pl_dynamic_db_assert_insect(ant,_8614,_8614,_8596,_8596).
pl_dynamic_db_assert_insect(bee,_8850,_8850,_8832,_8832).
pl_dynamic_db_assert_foo(X,_9140,_9174,_9098,_9112):-ho_call([bpl_call],no,X,[_9140,_9146],_9096,_9098,_9100),ho_call([bpl_call],no,X,[_9146,_9174],_9108,_9100,_9112).
pl_dynamic_test_assert_1(_10198,_10204,_10180,_10182):-assert(pl_dynamic_db_assert_legs(spider,8,_9956,_9956,_9938,_9938)),pl_dynamic_db_assert_legs(spider,8,_10198,_10204,_10180,_10182),bpl_retract(pl_dynamic_db_assert_legs(spider,8,_10076,_10076,_10058,_10058)).
pl_dynamic_test_assert_2(_11904,_11904,_11886,_11886):-assert(no,[_]).
pl_dynamic_test_assert_3(_12204,_12204,_12186,_12186):-assert(4).
pl_dynamic_throws_exception(test_assert_2,_12440,_12440,_12422,_12422).
pl_dynamic_throws_exception(test_assert_3,_12676,_12676,_12658,_12658).
pl_dynamic_db_retract_legs(A,4,_13954,_13960,_13782,_13788):-pl_dynamic_db_retract_animal(A,_13954,_13960,_13782,_13788).
pl_dynamic_db_retract_legs(octopus,8,_16404,_16404,_16218,_16218).
pl_dynamic_db_retract_legs(A,6,_18652,_18658,_18480,_18486):-pl_dynamic_db_retract_insect(A,_18652,_18658,_18480,_18486).
pl_dynamic_db_retract_legs(spider,8,_21102,_21102,_20916,_20916).
pl_dynamic_db_retract_legs(B,2,_23350,_23356,_23178,_23184):-pl_dynamic_db_retract_bird(B,_23350,_23356,_23178,_23184).
pl_dynamic_db_retract_insect(ant,_26322,_26322,_26150,_26150).
pl_dynamic_db_retract_insect(bee,_27794,_27794,_27622,_27622).
pl_dynamic_db_retract_foo(X,_31612,_31792,_31096,_31256):-ho_call([bpl_call],no,X,[_31612,_31618],_31090,_31096,_31102),ho_call([bpl_call],no,X,[_31618,_31792],_31244,_31102,_31256).
pl_dynamic_db_retract_foo(X,_37000,_37180,_36484,_36644):-ho_call([bpl_call],no,X,[_37000,_37006],_36478,_36484,_36490)->ho_call([bpl_call],no,X,[_37006,_37180],_36632,_36490,_36644).
pl_dynamic_test_retract_1(_45616,_45622,_44846,_44852):-bpl_retract(pl_dynamic_db_retract_legs(octopus,8,_41068,_41068,_40882,_40882)),ho_call([eval_negation,not],yes,pl_dynamic_db_retract_legs(octopus,8,_45616,_45622,_44746,_44752),[_45616,_45622],[_44746,_44752],_44846,_44852),assert(pl_dynamic_db_retract_legs(octopus,8,_42742,_42742,_42556,_42556)).
pl_dynamic_test_retract_2(_58820,_58826,_58050,_58056):-bpl_retract(pl_dynamic_db_retract_legs(spider,6,_54272,_54272,_54086,_54086)),ho_call([eval_negation,not],yes,pl_dynamic_db_retract_legs(spider,6,_58820,_58826,_57950,_57956),[_58820,_58826],[_57950,_57956],_58050,_58056),assert(pl_dynamic_db_retract_legs(spider,6,_55946,_55946,_55760,_55760)).
