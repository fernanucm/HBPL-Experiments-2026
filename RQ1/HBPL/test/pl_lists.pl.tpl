:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_8116,_8116,1.0).
frel2(_8144,_8144,1.0).
frel3(_8164,_8164,1.0).
gEqThan(_8060,_8060,1.0).
lEqThan(_8088,_8088,1.0).



pl_lists_test_suites([test_member,test_append,test_length,test_reverse],_1118,_1118,_1100,_1100).
pl_lists_test_member_1(_1250,_1250,_1232,_1232):-member(c,[a,b,c]).
pl_lists_test_member_2(_1380,_1380,_1362,_1362):-member(z,[a,b,c]).
pl_lists_test_member_3(X,_1510,_1510,_1492,_1492):-member(X,[a,b,c]).
pl_lists_test_member_4(_1642,_1642,_1624,_1624):-member(_,[a,b,c]).
pl_lists_test_member_5(X,_1772,_1772,_1754,_1754):-member(X,[_,_,_]).
pl_lists_test_member_6(_1952,_1952,_1934,_1934):-member([a,c],[[a,x],[a,c],[a,z]]).
pl_lists_test_member_7(L,_2064,_2064,_2046,_2046):-member(1,L).
pl_lists_throws_exception(test_member_7,_2170,_2170,_2152,_2152).
pl_lists_test_append_1(_2334,_2334,_2316,_2316):-append([a,b],[c,d],[a,b,c,d]).
pl_lists_test_append_2(X,_2484,_2484,_2466,_2466):-append(X,[c,d],[a,b,c,d]).
pl_lists_test_append_3(X,_2636,_2636,_2618,_2618):-append([a,b],X,[a,b,c,d]).
pl_lists_test_append_4(X,Y,_2776,_2776,_2758,_2758):-append(X,Y,[a,b,c,d]).
pl_lists_test_append_5(Z,_2918,_2918,_2900,_2900):-append([a,b],[c,d],Z).
pl_lists_test_append_6(X,_3070,_3070,_3052,_3052):-append(X,[c,d],[_,_,c,d]).
pl_lists_test_append_7(Y,_3222,_3222,_3204,_3204):-append([a,b],Y,[a,b,_,_]).
pl_lists_test_append_8(X,_3374,_3374,_3356,_3356):-append([x,y],X,[a,b,c,d]).
pl_lists_test_append_9(X,_3526,_3526,_3508,_3508):-append(X,[x,y],[a,b,c,d]).
pl_lists_test_append_10(X,Y,_3666,_3666,_3648,_3648):-append(X,Y,[_,_,_,_]).
pl_lists_test_append_11(X,Y,_3808,_3808,_3790,_3790):-append(X,Y,[_,_,_,_]).
pl_lists_test_append_12(_3926,_3926,_3908,_3908):-append([],[],[]).
pl_lists_test_append_13(X,_4064,_4064,_4046,_4046):-append([1,2],X,[1,2]).
pl_lists_test_append_14(L,_4180,_4180,_4162,_4162):-append([],[],L).
pl_lists_test_append_15(I1,I2,_4344,_4344,_4326,_4326):-append([a,I1],[c,d],[a,b,I2,d]).
pl_lists_test_append_16(X,Y,Z,_4462,_4462,_4444,_4444):-append(X,Y,Z).
pl_lists_test_append_17(X,Z,_4594,_4594,_4576,_4576):-append(X,[1,2],Z).
pl_lists_throws_exception(test_append_16,_4702,_4702,_4684,_4684).
pl_lists_throws_exception(test_append_17,_4808,_4808,_4790,_4790).
pl_lists_test_length_1(_4946,_4946,_4928,_4928):-length([a,b,c,d],4).
pl_lists_test_length_2(X,_5082,_5082,_5064,_5064):-length([a,b,c,d],X).
pl_lists_test_length_3(L,_5196,_5196,_5178,_5178):-length(L,4).
pl_lists_test_length_4(T,_5322,_5322,_5304,_5304):-length([a,b|T],4).
pl_lists_test_length_5(L,X,_5436,_5436,_5418,_5418):-length(L,X).
pl_lists_test_length_6(_5564,_5564,_5546,_5546):-length([a,b],foo).
pl_lists_test_length_7(_5688,_5688,_5670,_5670):-length([a,b],2.5).
pl_lists_test_length_8(_5800,_5800,_5782,_5782):-length(foo,2).
pl_lists_throws_exception(test_length_5,_5904,_5904,_5886,_5886).
pl_lists_throws_exception(test_length_6,_6010,_6010,_5992,_5992).
pl_lists_throws_exception(test_length_7,_6116,_6116,_6098,_6098).
pl_lists_throws_exception(test_length_8,_6222,_6222,_6204,_6204).
pl_lists_test_reverse_1(_6372,_6372,_6354,_6354):-reverse([a,b,c],[c,b,a]).
pl_lists_test_reverse_2(X,_6502,_6502,_6484,_6484):-reverse(X,[c,b,a]).
pl_lists_test_reverse_3(X,_6634,_6634,_6616,_6616):-reverse([a,b,c],X).
pl_lists_test_reverse_4(T,_6778,_6778,_6760,_6760):-reverse([a,b|T],[c,b,a]).
pl_lists_test_reverse_5(_6892,_6892,_6874,_6874):-reverse([],[]).
pl_lists_test_reverse_6(X,_7004,_7004,_6986,_6986):-reverse([],X).
pl_lists_test_reverse_7(I1,I2,_7154,_7154,_7136,_7136):-reverse([I1,b,c],[a,b,I2]).
pl_lists_test_reverse_8(X,_7270,_7270,_7252,_7252):-reverse(X,X).
pl_lists_test_reverse_9(X,Y,_7384,_7384,_7366,_7366):-reverse(X,Y).
pl_lists_throws_exception(test_reverse_8,_7492,_7492,_7474,_7474).
pl_lists_throws_exception(test_reverse_9,_7598,_7598,_7580,_7580).
