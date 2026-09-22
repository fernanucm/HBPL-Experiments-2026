:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_9788,_9788,1.0).
frel2(_9816,_9816,1.0).
frel3(_9836,_9836,1.0).
gEqThan(_9732,_9732,1.0).
lEqThan(_9760,_9760,1.0).



pl_unification_test_suites([test_unif,test_notunif],_1106,_1106,_1088,_1088).
pl_unification_test_unif_1(_1220,_1220,_1202,_1202):-'='(1,1).
pl_unification_test_unif_2(X,_1332,_1332,_1314,_1314):-'='(X,1).
pl_unification_test_unif_3(X,Y,_1446,_1446,_1428,_1428):-'='(X,Y).
pl_unification_test_unif_4(_1562,_1562,_1544,_1544):-'='(_,_).
pl_unification_test_unif_5(X,Y,_1686,_1686,_1668,_1668):-'='(X,Y),'='(X,abc).
pl_unification_test_unif_6(X,Y,_1814,_1814,_1796,_1796):-'='(f(X,def),f(def,Y)).
pl_unification_test_unif_7(_1930,_1930,_1912,_1912):-'='(1,2).
pl_unification_test_unif_8(_2042,_2042,_2024,_2024):-'='(1,1.0).
pl_unification_test_unif_9(X,_2166,_2166,_2148,_2148):-'='(g(X),f(f(X))).
pl_unification_test_unif_10(X,_2294,_2294,_2276,_2276):-'='(f(X,1),f(a(X))).
pl_unification_test_unif_11(X,Y,_2434,_2434,_2416,_2416):-'='(f(X,Y,X),f(a(X),a(Y),Y,2)).
pl_unification_test_unif_12(X,_2554,_2554,_2536,_2536):-'='(X,a(X)).
pl_unification_test_unif_13(X,_2684,_2684,_2666,_2666):-'='(f(X,1),f(a(X),2)).
pl_unification_test_unif_14(X,_2818,_2818,_2800,_2800):-'='(f(1,X,1),f(2,a(X),2)).
pl_unification_test_unif_15(X,_2948,_2948,_2930,_2930):-'='(f(1,X),f(2,a(X))).
pl_unification_test_unif_16(X,Y,_3090,_3090,_3072,_3072):-'='(f(X,Y,X,1),f(a(X),a(Y),Y,2)).
pl_unification_test_unif_1b(_3210,_3210,_3192,_3192):-1=1.
pl_unification_test_unif_2b(X,_3326,_3326,_3308,_3308):-X=1.
pl_unification_test_unif_3b(X,Y,_3444,_3444,_3426,_3426):-X=Y.
pl_unification_test_unif_4b(_3564,_3564,_3546,_3546):-_=_.
pl_unification_test_unif_5b(X,Y,_3696,_3696,_3678,_3678):-X=Y,X=abc.
pl_unification_test_unif_6b(X,Y,_3828,_3828,_3810,_3810):-f(X,def)=f(def,Y).
pl_unification_test_unif_7b(_3948,_3948,_3930,_3930):-1=2.
pl_unification_test_unif_8b(_4064,_4064,_4046,_4046):-1=1.0.
pl_unification_test_unif_9b(X,_4192,_4192,_4174,_4174):-g(X)=f(f(X)).
pl_unification_test_unif_10b(X,_4324,_4324,_4306,_4306):-f(X,1)=f(a(X)).
pl_unification_test_unif_11b(X,Y,_4468,_4468,_4450,_4450):-f(X,Y,X)=f(a(X),a(Y),Y,2).
pl_unification_test_unif_12b(X,_4592,_4592,_4574,_4574):-X=a(X).
pl_unification_test_unif_13b(X,_4726,_4726,_4708,_4708):-f(X,1)=f(a(X),2).
pl_unification_test_unif_14b(X,_4864,_4864,_4846,_4846):-f(1,X,1)=f(2,a(X),2).
pl_unification_test_unif_15b(X,_4998,_4998,_4980,_4980):-f(1,X)=f(2,a(X)).
pl_unification_test_unif_16b(X,Y,_5144,_5144,_5126,_5126):-f(X,Y,X,1)=f(a(X),a(Y),Y,2).
pl_unification_test_notunif_1(_5260,_5260,_5242,_5242):-'\\='(1,1).
pl_unification_test_notunif_2(X,_5372,_5372,_5354,_5354):-'\\='(X,1).
pl_unification_test_notunif_3(X,Y,_5486,_5486,_5468,_5468):-'\\='(X,Y).
pl_unification_test_notunif_4(_5602,_5602,_5584,_5584):-'\\='(_,_).
pl_unification_test_notunif_5(X,Y,_5726,_5726,_5708,_5708):-'\\='(X,Y),'\\='(X,abc).
pl_unification_test_notunif_6(X,Y,_5854,_5854,_5836,_5836):-'\\='(f(X,def),f(def,Y)).
pl_unification_test_notunif_7(_5970,_5970,_5952,_5952):-'\\='(1,2).
pl_unification_test_notunif_8(_6082,_6082,_6064,_6064):-'\\='(1,1.0).
pl_unification_test_notunif_9(X,_6206,_6206,_6188,_6188):-'\\='(g(X),f(f(X))).
pl_unification_test_notunif_10(X,_6334,_6334,_6316,_6316):-'\\='(f(X,1),f(a(X))).
pl_unification_test_notunif_11(X,Y,_6474,_6474,_6456,_6456):-'\\='(f(X,Y,X),f(a(X),a(Y),Y,2)).
pl_unification_test_notunif_12(X,_6594,_6594,_6576,_6576):-'\\='(X,a(X)).
pl_unification_test_notunif_13(X,_6724,_6724,_6706,_6706):-'\\='(f(X,1),f(a(X),2)).
pl_unification_test_notunif_14(X,_6858,_6858,_6840,_6840):-'\\='(f(1,X,1),f(2,a(X),2)).
pl_unification_test_notunif_15(X,_6988,_6988,_6970,_6970):-'\\='(f(1,X),f(2,a(X))).
pl_unification_test_notunif_16(X,Y,_7130,_7130,_7112,_7112):-'\\='(f(X,Y,X,1),f(a(X),a(Y),Y,2)).
pl_unification_test_notunif_1b(_7250,_7250,_7232,_7232):-1\=1.
pl_unification_test_notunif_2b(X,_7366,_7366,_7348,_7348):-X\=1.
pl_unification_test_notunif_3b(X,Y,_7484,_7484,_7466,_7466):-X\=Y.
pl_unification_test_notunif_4b(_7604,_7604,_7586,_7586):-_\=_.
pl_unification_test_notunif_5b(X,Y,_7736,_7736,_7718,_7718):-X\=Y,X\=abc.
pl_unification_test_notunif_6b(X,Y,_7868,_7868,_7850,_7850):-f(X,def)\=f(def,Y).
pl_unification_test_notunif_7b(_7988,_7988,_7970,_7970):-1\=2.
pl_unification_test_notunif_8b(_8104,_8104,_8086,_8086):-1\=1.0.
pl_unification_test_notunif_9b(X,_8232,_8232,_8214,_8214):-g(X)\=f(f(X)).
pl_unification_test_notunif_10b(X,_8364,_8364,_8346,_8346):-f(X,1)\=f(a(X)).
pl_unification_test_notunif_11b(X,Y,_8508,_8508,_8490,_8490):-f(X,Y,X)\=f(a(X),a(Y),Y,2).
pl_unification_test_notunif_12b(X,_8632,_8632,_8614,_8614):-X\=a(X).
pl_unification_test_notunif_13b(X,_8766,_8766,_8748,_8748):-f(X,1)\=f(a(X),2).
pl_unification_test_notunif_14b(X,_8904,_8904,_8886,_8886):-f(1,X,1)\=f(2,a(X),2).
pl_unification_test_notunif_15b(X,_9038,_9038,_9020,_9020):-f(1,X)\=f(2,a(X)).
pl_unification_test_notunif_16b(X,Y,_9184,_9184,_9166,_9166):-f(X,Y,X,1)\=f(a(X),a(Y),Y,2).
