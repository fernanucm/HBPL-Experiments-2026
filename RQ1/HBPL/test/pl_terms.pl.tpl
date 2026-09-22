:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_11754,_11754,1.0).
frel2(_11782,_11782,1.0).
frel3(_11802,_11802,1.0).
gEqThan(_11698,_11698,1.0).
lEqThan(_11726,_11726,1.0).



pl_terms_test_suites([test_functor,test_arg,test_univ],_1118,_1118,_1100,_1100).
pl_terms_test_functor_1(_1242,_1242,_1224,_1224):-functor(foo(a,b,c),foo,3).
pl_terms_test_functor_2(X,Y,_1364,_1364,_1346,_1346):-functor(foo(a,b,c),X,Y).
pl_terms_test_functor_3(X,_1482,_1482,_1464,_1464):-functor(X,foo,3).
pl_terms_test_functor_4(X,_1598,_1598,_1580,_1580):-functor(X,foo,0).
pl_terms_test_functor_5(_1718,_1718,_1700,_1700):-functor(foo(a),foo,2).
pl_terms_test_functor_6(_1836,_1836,_1818,_1818):-functor(foo(a),fo,1).
pl_terms_test_functor_7(X,Y,_1950,_1950,_1932,_1932):-functor(1,X,Y).
pl_terms_test_functor_8(X,_2068,_2068,_2050,_2050):-functor(X,1.1,0).
pl_terms_test_functor_9(F,_2188,_2188,_2170,_2170):-functor(F,foo(a),1).
pl_terms_test_functor_10(_2310,_2310,_2292,_2292):-functor([_|_],'.',2).
pl_terms_test_functor_11(_2424,_2424,_2406,_2406):-functor([],[],0).
pl_terms_test_functor_12(X,Y,_2538,_2538,_2520,_2520):-functor(X,Y,3).
pl_terms_test_functor_13(X,N,_2656,_2656,_2638,_2638):-functor(X,foo,N).
pl_terms_test_functor_14(X,_2774,_2774,_2756,_2756):-functor(X,foo,a).
pl_terms_test_functor_15(A,T,X,_2928,_2928,_2910,_2910):-current_prolog_flag(max_arity,A),X is A+1,functor(T,foo,X).
pl_terms_test_functor_16(Minus_1,F,_3074,_3074,_3056,_3056):-Minus_1 is 0-1,functor(F,foo,Minus_1).
pl_terms_throws_exception(test_functor_9,_3182,_3182,_3164,_3164).
pl_terms_throws_exception(test_functor_12,_3288,_3288,_3270,_3270).
pl_terms_throws_exception(test_functor_13,_3394,_3394,_3376,_3376).
pl_terms_throws_exception(test_functor_14,_3500,_3500,_3482,_3482).
pl_terms_throws_exception(test_functor_15,_3606,_3606,_3588,_3588).
pl_terms_throws_exception(test_functor_16,_3712,_3712,_3694,_3694).
pl_terms_test_arg_1(_3834,_3834,_3816,_3816):-arg(1,foo(a,b),a).
pl_terms_test_arg_2(X,_3954,_3954,_3936,_3936):-arg(1,foo(a,b),X).
pl_terms_test_arg_3(X,_4076,_4076,_4058,_4058):-arg(1,foo(X,b),a).
pl_terms_test_arg_4(X,Y,_4198,_4198,_4180,_4180):-arg(1,foo(X,b),Y).
pl_terms_test_arg_5(_4322,_4322,_4304,_4304):-arg(1,foo(a,b),b).
pl_terms_test_arg_6(_4442,_4442,_4424,_4424):-arg(0,foo(a,b),foo).
pl_terms_test_arg_7(N,_4562,_4562,_4544,_4544):-arg(3,foo(3,4),N).
pl_terms_test_arg_8(X,_4684,_4684,_4666,_4666):-arg(X,foo(a,b),a).
pl_terms_test_arg_9(X,_4800,_4800,_4782,_4782):-arg(1,X,a).
pl_terms_test_arg_10(A,_4916,_4916,_4898,_4898):-arg(0,atom,A).
pl_terms_test_arg_11(A,_5032,_5032,_5014,_5014):-arg(0,3,A).
pl_terms_test_arg_12(X,_5156,_5156,_5138,_5138):-arg(1,foo(X),u(X)).
pl_terms_throws_exception(test_arg_9,_5262,_5262,_5244,_5244).
pl_terms_throws_exception(test_arg_10,_5368,_5368,_5350,_5350).
pl_terms_throws_exception(test_arg_11,_5474,_5474,_5456,_5456).
pl_terms_test_univ_1(_5612,_5612,_5594,_5594):-'=..'(foo(a,b),[foo,a,b]).
pl_terms_test_univ_2(X,_5742,_5742,_5724,_5724):-'=..'(X,[foo,a,b]).
pl_terms_test_univ_3(L,_5862,_5862,_5844,_5844):-'=..'(foo(a,b),L).
pl_terms_test_univ_4(X,Y,_6000,_6000,_5982,_5982):-'=..'(foo(X,b),[foo,a,Y]).
pl_terms_test_univ_5(_6122,_6122,_6104,_6104):-'=..'(1,[1]).
pl_terms_test_univ_6(_6258,_6258,_6240,_6240):-'=..'(foo(a,b),[foo,b,a]).
pl_terms_test_univ_7(X,Y,_6370,_6370,_6352,_6352):-'=..'(X,Y).
pl_terms_test_univ_8(X,Y,_6498,_6498,_6480,_6480):-'=..'(X,[foo,a|Y]).
pl_terms_test_univ_9(X,_6620,_6620,_6602,_6602):-'=..'(X,[foo|bar]).
pl_terms_test_univ_10(X,Foo,_6746,_6746,_6728,_6728):-'=..'(X,[Foo,bar]).
pl_terms_test_univ_11(X,_6874,_6874,_6856,_6856):-'=..'(X,[3,1]).
pl_terms_test_univ_12(X,_7000,_7000,_6982,_6982):-'=..'(X,[1.1,foo]).
pl_terms_test_univ_13(X,_7130,_7130,_7112,_7112):-'=..'(X,[a(b),1]).
pl_terms_test_univ_14(X,_7244,_7244,_7226,_7226):-'=..'(X,4).
pl_terms_test_univ_15(X,_7378,_7378,_7360,_7360):-'=..'(f(X),[f,u(X)]).
pl_terms_throws_exception(test_univ_7,_7484,_7484,_7466,_7466).
pl_terms_throws_exception(test_univ_8,_7590,_7590,_7572,_7572).
pl_terms_throws_exception(test_univ_9,_7696,_7696,_7678,_7678).
pl_terms_throws_exception(test_univ_10,_7802,_7802,_7784,_7784).
pl_terms_throws_exception(test_univ_11,_7908,_7908,_7890,_7890).
pl_terms_throws_exception(test_univ_12,_8014,_8014,_7996,_7996).
pl_terms_throws_exception(test_univ_13,_8120,_8120,_8102,_8102).
pl_terms_throws_exception(test_univ_14,_8226,_8226,_8208,_8208).
pl_terms_test_univ_1b(_8368,_8368,_8350,_8350):-foo(a,b)=..[foo,a,b].
pl_terms_test_univ_2b(X,_8502,_8502,_8484,_8484):-X=..[foo,a,b].
pl_terms_test_univ_3b(L,_8626,_8626,_8608,_8608):-foo(a,b)=..L.
pl_terms_test_univ_4b(X,Y,_8768,_8768,_8750,_8750):-foo(X,b)=..[foo,a,Y].
pl_terms_test_univ_5b(_8894,_8894,_8876,_8876):-1=..[1].
pl_terms_test_univ_6b(_9034,_9034,_9016,_9016):-foo(a,b)=..[foo,b,a].
pl_terms_test_univ_7b(X,Y,_9150,_9150,_9132,_9132):-X=..Y.
pl_terms_test_univ_8b(X,Y,_9282,_9282,_9264,_9264):-X=..[foo,a|Y].
pl_terms_test_univ_9b(X,_9408,_9408,_9390,_9390):-X=..[foo|bar].
pl_terms_test_univ_10b(X,Foo,_9538,_9538,_9520,_9520):-X=..[Foo,bar].
pl_terms_test_univ_11b(X,_9670,_9670,_9652,_9652):-X=..[3,1].
pl_terms_test_univ_12b(X,_9800,_9800,_9782,_9782):-X=..[1.1,foo].
pl_terms_test_univ_13b(X,_9934,_9934,_9916,_9916):-X=..[a(b),1].
pl_terms_test_univ_14b(X,_10052,_10052,_10034,_10034):-X=..4.
pl_terms_test_univ_15b(X,_10190,_10190,_10172,_10172):-f(X)=..[f,u(X)].
pl_terms_throws_exception(test_univ_7b,_10296,_10296,_10278,_10278).
pl_terms_throws_exception(test_univ_8b,_10402,_10402,_10384,_10384).
pl_terms_throws_exception(test_univ_9b,_10508,_10508,_10490,_10490).
pl_terms_throws_exception(test_univ_10b,_10614,_10614,_10596,_10596).
pl_terms_throws_exception(test_univ_11b,_10720,_10720,_10702,_10702).
pl_terms_throws_exception(test_univ_12b,_10826,_10826,_10808,_10808).
pl_terms_throws_exception(test_univ_13b,_10932,_10932,_10914,_10914).
pl_terms_throws_exception(test_univ_14b,_11038,_11038,_11020,_11020).
