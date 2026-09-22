:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-op(400,xfy,+*+).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_44628,_44628,1.0).
frel2(_44748,_44748,1.0).
frel3(_44868,_44868,1.0).
gEqThan(_44394,_44394,1.0).
lEqThan(_44508,_44508,1.0).



pl_other_test_suites([test_throw_catch,test_new_op,test_current_op],_9586,_9586,_9568,_9568).
pl_other_db_throw_foo(X,_9960,_9960,_9942,_9942):-Y is X*2,throw(test(Y)).
pl_other_db_throw_bar(X,_10430,_10430,_10412,_10412):-X=Y,throw(Y).
pl_other_db_throw_coo(X,_10828,_10828,_10810,_10810):-throw(X).
pl_other_db_throw_car(X,_11138,_11138,_11120,_11120):-X=1,throw(X).
pl_other_test_throw_catch_1(Y,_11556,_11558,_11506,_11508):-ho_call([catch,test(Y)],yes,(pl_other_db_throw_foo(5,_11556,_11558,_11506,_11508);(true,_11556=_11582),_11506=_11508,_11582=_11558),[_11556,_11558],[_11506,_11508,_11506,_11508],_11506,_11508).
pl_other_test_throw_catch_2(Z,_12702,_12704,_12652,_12654):-ho_call([catch,Z],yes,(pl_other_db_throw_bar(3,_12702,_12704,_12652,_12654);(true,_12702=_12728),_12652=_12654,_12728=_12704),[_12702,_12704],[_12652,_12654,_12652,_12654],_12652,_12654).
pl_other_test_throw_catch_3(C,_13864,_13972,_13788,_13830):-ho_call([catch,C],yes,((true,_13864=_13866),_13788=_13790,_13866=_13878;(write(demoen),_13864=_13890),_13788=_13790,_13890=_13878),[_13864,_13878],[_13788,_13790,_13788,_13790],_13788,_13824),throw(bla),_13878=_13960,_13790=_13830,_13960=_13972.
pl_other_test_throw_catch_4(X,Y,_15466,_15468,_15416,_15418):-ho_call([catch,Y],yes,(pl_other_db_throw_coo(X,_15466,_15468,_15416,_15418);(true,_15466=_15492),_15416=_15418,_15492=_15468),[_15466,_15468],[_15416,_15418,_15416,_15418],_15416,_15418).
pl_other_test_throw_catch_5(X,Y,_16656,_16658,_16606,_16608):-ho_call([catch,Y],yes,(pl_other_db_throw_car(X,_16656,_16658,_16606,_16608);(true,_16656=_16682),_16606=_16608,_16682=_16658),[_16656,_16658],[_16606,_16608,_16606,_16608],_16606,_16608).
pl_other_throws_exception(test_throw_catch_3,_17800,_17800,_17782,_17782).
pl_other_test_new_op_1(_18064,_18064,_18046,_18046):-op(30,xfy,++).
pl_other_test_new_op_2(_18334,_18334,_18316,_18316):-op(0,yfx,++).
pl_other_test_new_op_3(_18604,_18604,_18586,_18586):-op(max,xfy,++).
pl_other_test_new_op_4(_18874,_18874,_18856,_18856):-op(-30,xfy,++).
pl_other_test_new_op_5(_19144,_19144,_19126,_19126):-op(1201,xfy,++).
pl_other_test_new_op_6(XFY,_19414,_19414,_19396,_19396):-op(30,XFY,++).
pl_other_test_new_op_7(_19736,_19736,_19718,_19718):-op(30,xfy,0).
pl_other_test_new_op_8(_21992,_21992,_21834,_21834):-op(30,xfy,++),op(40,xfx,++).
pl_other_test_new_op_9(_26334,_26334,_26176,_26176):-op(30,xfy,++),op(50,yf,++).
pl_other_test_new_op_10(Y,_31632,_31632,_31460,_31460):-X= +*+(5,7),Y= +*+(3,X,2).
pl_other_throws_exception(test_new_op_3,_33900,_33900,_33728,_33728).
pl_other_throws_exception(test_new_op_4,_35372,_35372,_35200,_35200).
pl_other_throws_exception(test_new_op_5,_36844,_36844,_36672,_36672).
pl_other_throws_exception(test_new_op_6,_38316,_38316,_38144,_38144).
pl_other_throws_exception(test_new_op_7,_39788,_39788,_39616,_39616).
pl_other_test_current_op_1(P,OP,_42590,_42590,_42404,_42404):-current_op(P,xfy,OP).
