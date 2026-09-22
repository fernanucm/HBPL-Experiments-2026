:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_6576,_6576,1.0).
frel2(_6604,_6604,1.0).
frel3(_6624,_6624,1.0).
gEqThan(_6520,_6520,1.0).
lEqThan(_6548,_6548,1.0).



pl_typetest_test_suites([test_var,test_atom,test_integer,test_floattype,test_atomic,test_compound,test_nonvar,test_number],_1166,_1166,_1148,_1148).
pl_typetest_test_var_1(_1278,_1278,_1260,_1260):-var(foo).
pl_typetest_test_var_2(Foo,_1388,_1388,_1370,_1370):-var(Foo).
pl_typetest_test_var_3(Foo,_1516,_1516,_1498,_1498):-foo=Foo,var(Foo).
pl_typetest_test_var_4(_1628,_1628,_1610,_1610):-var(_).
pl_typetest_test_atom_1(_1738,_1738,_1720,_1720):-atom(atom).
pl_typetest_test_atom_2(_1848,_1848,_1830,_1830):-atom('string').
pl_typetest_test_atom_3(_1962,_1962,_1944,_1944):-atom(a(b)).
pl_typetest_test_atom_4(Var,_2072,_2072,_2054,_2054):-atom(Var).
pl_typetest_test_atom_5(_2184,_2184,_2166,_2166):-atom([]).
pl_typetest_test_atom_6(_2294,_2294,_2276,_2276):-atom(6).
pl_typetest_test_atom_7(_2404,_2404,_2386,_2386):-atom(3.3).
pl_typetest_test_integer_1(_2514,_2514,_2496,_2496):-integer(3).
pl_typetest_test_integer_2(_2624,_2624,_2606,_2606):-integer(-3).
pl_typetest_test_integer_3(_2734,_2734,_2716,_2716):-integer(3.3).
pl_typetest_test_integer_4(X,_2844,_2844,_2826,_2826):-integer(X).
pl_typetest_test_integer_5(_2956,_2956,_2938,_2938):-integer(atom).
pl_typetest_test_floattype_1(_3066,_3066,_3048,_3048):-float(3.3).
pl_typetest_test_floattype_2(_3182,_3182,_3164,_3164):-float(-3.3).
pl_typetest_test_floattype_3(_3292,_3292,_3274,_3274):-float(3).
pl_typetest_test_floattype_4(_3402,_3402,_3384,_3384):-float(atom).
pl_typetest_test_floattype_5(X,_3512,_3512,_3494,_3494):-float(X).
pl_typetest_test_atomic_1(_3624,_3624,_3606,_3606):-atomic(atom).
pl_typetest_test_atomic_2(_3738,_3738,_3720,_3720):-atomic(a(b)).
pl_typetest_test_atomic_3(Var,_3848,_3848,_3830,_3830):-atomic(Var).
pl_typetest_test_atomic_4(_3960,_3960,_3942,_3942):-atomic(6).
pl_typetest_test_atomic_5(_4070,_4070,_4052,_4052):-atomic(3.3).
pl_typetest_test_compound_1(_4180,_4180,_4162,_4162):-compound(33.3).
pl_typetest_test_compound_2(_4296,_4296,_4278,_4278):-compound(-33.3).
pl_typetest_test_compound_3(_4410,_4410,_4392,_4392):-compound(-a).
pl_typetest_test_compound_4(_4520,_4520,_4502,_4502):-compound(_).
pl_typetest_test_compound_5(_4630,_4630,_4612,_4612):-compound(a).
pl_typetest_test_compound_6(_4744,_4744,_4726,_4726):-compound(a(b)).
pl_typetest_test_compound_7(_4860,_4860,_4842,_4842):-compound([a]).
pl_typetest_test_nonvar_1(_4970,_4970,_4952,_4952):-nonvar(33.3).
pl_typetest_test_nonvar_2(_5080,_5080,_5062,_5062):-nonvar(foo).
pl_typetest_test_nonvar_3(Foo,_5190,_5190,_5172,_5172):-nonvar(Foo).
pl_typetest_test_nonvar_4(Foo,_5318,_5318,_5300,_5300):-foo=Foo,nonvar(Foo).
pl_typetest_test_nonvar_5(_5430,_5430,_5412,_5412):-nonvar(_).
pl_typetest_test_nonvar_6(_5544,_5544,_5526,_5526):-nonvar(a(b)).
pl_typetest_test_number_1(_5654,_5654,_5636,_5636):-number(3).
pl_typetest_test_number_2(_5764,_5764,_5746,_5746):-number(3.3).
pl_typetest_test_number_3(_5874,_5874,_5856,_5856):-number(-3).
pl_typetest_test_number_4(_5984,_5984,_5966,_5966):-number(a).
pl_typetest_test_number_5(X,_6094,_6094,_6076,_6076):-number(X).
