:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_28402,_28402,1.0).
frel2(_28438,_28438,1.0).
frel3(_28468,_28468,1.0).
gEqThan(_28330,_28330,1.0).
lEqThan(_28366,_28366,1.0).



pl_arithmetic_test_suites([test_is,test_arith,test_plus,test_minus,test_times,test_division,test_mod,test_floor,test_round,test_ceiling,test_truncate,test_floatarith,test_abs,test_sqrt,test_power],_1472,_1472,_1454,_1454).
pl_arithmetic_test_is_1(Result,_1596,_1596,_1578,_1578):-'is'(Result,3+11.0).
pl_arithmetic_test_is_2(X,Y,_1750,_1750,_1732,_1732):-X=1+2,Y is X*3.
pl_arithmetic_test_is_3(_1882,_1882,_1864,_1864):-X=foo,'is'(X,77).
pl_arithmetic_test_is_4(N,_1994,_1994,_1976,_1976):-'is'(77,N).
pl_arithmetic_throws_exception(test_is_4,_2100,_2100,_2082,_2082).
pl_arithmetic_test_arith_1(_2214,_2214,_2196,_2196):-'=:='(0,1).
pl_arithmetic_test_arith_2(_2326,_2326,_2308,_2308):-'=\\='(0,1).
pl_arithmetic_test_arith_3(_2438,_2438,_2420,_2420):-'<'(0,1).
pl_arithmetic_test_arith_4(_2550,_2550,_2532,_2532):-'>'(0,1).
pl_arithmetic_test_arith_5(_2662,_2662,_2644,_2644):-'>='(0,1).
pl_arithmetic_test_arith_6(_2774,_2774,_2756,_2756):-'=<'(0,1).
pl_arithmetic_test_arith_7(_2886,_2886,_2868,_2868):-'=:='(1.0,1).
pl_arithmetic_test_arith_8(_2998,_2998,_2980,_2980):-'=\\='(1.0,1).
pl_arithmetic_test_arith_9(_3110,_3110,_3092,_3092):-'<'(1.0,1).
pl_arithmetic_test_arith_10(_3222,_3222,_3204,_3204):-'>'(1.0,1).
pl_arithmetic_test_arith_11(_3334,_3334,_3316,_3316):-'>='(1.0,1).
pl_arithmetic_test_arith_12(_3446,_3446,_3428,_3428):-'=<'(1.0,1).
pl_arithmetic_test_arith_13(_3578,_3578,_3560,_3560):-'=:='(3*2,7-1).
pl_arithmetic_test_arith_14(_3710,_3710,_3692,_3692):-'=\\='(3*2,7-1).
pl_arithmetic_test_arith_15(_3842,_3842,_3824,_3824):-'<'(3*2,7-1).
pl_arithmetic_test_arith_16(_3974,_3974,_3956,_3956):-'>'(3*2,7-1).
pl_arithmetic_test_arith_17(_4106,_4106,_4088,_4088):-'>='(3*2,7-1).
pl_arithmetic_test_arith_18(_4238,_4238,_4220,_4220):-'=<'(3*2,7-1).
pl_arithmetic_test_arith_19(X,_4350,_4350,_4332,_4332):-'=:='(X,5).
pl_arithmetic_test_arith_20(X,_4464,_4464,_4446,_4446):-'=\\='(X,5).
pl_arithmetic_test_arith_21(X,_4578,_4578,_4560,_4560):-'<'(X,5).
pl_arithmetic_test_arith_22(X,_4692,_4692,_4674,_4674):-'>'(X,5).
pl_arithmetic_test_arith_23(X,_4806,_4806,_4788,_4788):-'>='(X,5).
pl_arithmetic_test_arith_24(X,_4920,_4920,_4902,_4902):-'=<'(X,5).
pl_arithmetic_throws_exception(test_arith_19,_5026,_5026,_5008,_5008).
pl_arithmetic_throws_exception(test_arith_20,_5132,_5132,_5114,_5114).
pl_arithmetic_throws_exception(test_arith_21,_5238,_5238,_5220,_5220).
pl_arithmetic_throws_exception(test_arith_22,_5344,_5344,_5326,_5326).
pl_arithmetic_throws_exception(test_arith_23,_5450,_5450,_5432,_5432).
pl_arithmetic_throws_exception(test_arith_24,_5556,_5556,_5538,_5538).
pl_arithmetic_test_arith_1b(_5674,_5674,_5656,_5656):-0=:=1.
pl_arithmetic_test_arith_2b(_5790,_5790,_5772,_5772):-0=\=1.
pl_arithmetic_test_arith_3b(_5906,_5906,_5888,_5888):-0<1.
pl_arithmetic_test_arith_4b(_6022,_6022,_6004,_6004):-0>1.
pl_arithmetic_test_arith_5b(_6138,_6138,_6120,_6120):-0>=1.
pl_arithmetic_test_arith_6b(_6254,_6254,_6236,_6236):-0=<1.
pl_arithmetic_test_arith_7b(_6370,_6370,_6352,_6352):-1.0=:=1.
pl_arithmetic_test_arith_8b(_6486,_6486,_6468,_6468):-1.0=\=1.
pl_arithmetic_test_arith_9b(_6602,_6602,_6584,_6584):-1.0<1.
pl_arithmetic_test_arith_10b(_6718,_6718,_6700,_6700):-1.0>1.
pl_arithmetic_test_arith_11b(_6834,_6834,_6816,_6816):-1.0>=1.
pl_arithmetic_test_arith_12b(_6950,_6950,_6932,_6932):-1.0=<1.
pl_arithmetic_test_arith_13b(_7086,_7086,_7068,_7068):-3*2=:=7-1.
pl_arithmetic_test_arith_14b(_7222,_7222,_7204,_7204):-3*2=\=7-1.
pl_arithmetic_test_arith_15b(_7358,_7358,_7340,_7340):-3*2<7-1.
pl_arithmetic_test_arith_16b(_7494,_7494,_7476,_7476):-3*2>7-1.
pl_arithmetic_test_arith_17b(_7630,_7630,_7612,_7612):-3*2>=7-1.
pl_arithmetic_test_arith_18b(_7766,_7766,_7748,_7748):-3*2=<7-1.
pl_arithmetic_test_arith_19b(X,_7882,_7882,_7864,_7864):-X=:=5.
pl_arithmetic_test_arith_20b(X,_8000,_8000,_7982,_7982):-X=\=5.
pl_arithmetic_test_arith_21b(X,_8118,_8118,_8100,_8100):-X<5.
pl_arithmetic_test_arith_22b(X,_8236,_8236,_8218,_8218):-X>5.
pl_arithmetic_test_arith_23b(X,_8354,_8354,_8336,_8336):-X>=5.
pl_arithmetic_test_arith_24b(X,_8472,_8472,_8454,_8454):-X=<5.
pl_arithmetic_throws_exception(test_arith_19b,_8578,_8578,_8560,_8560).
pl_arithmetic_throws_exception(test_arith_20b,_8684,_8684,_8666,_8666).
pl_arithmetic_throws_exception(test_arith_21b,_8790,_8790,_8772,_8772).
pl_arithmetic_throws_exception(test_arith_22b,_8896,_8896,_8878,_8878).
pl_arithmetic_throws_exception(test_arith_23b,_9002,_9002,_8984,_8984).
pl_arithmetic_throws_exception(test_arith_24b,_9108,_9108,_9090,_9090).
pl_arithmetic_test_plus_1(X,_9232,_9232,_9214,_9214):-X is '+'(7,35).
pl_arithmetic_test_plus_2(X,_9366,_9366,_9348,_9348):-X is '+'(0,3+11).
pl_arithmetic_test_plus_3(X,_9500,_9500,_9482,_9482):-X is '+'(0,3.2+11).
pl_arithmetic_test_plus_4(X,N,_9624,_9624,_9606,_9606):-X is '+'(77,N).
pl_arithmetic_test_plus_5(X,_9766,_9766,_9748,_9748):-Y=foo,X is '+'(Y,77).
pl_arithmetic_throws_exception(test_plus_4,_9872,_9872,_9854,_9854).
pl_arithmetic_throws_exception(test_plus_5,_9978,_9978,_9960,_9960).
pl_arithmetic_test_plus_1b(X,_10106,_10106,_10088,_10088):-X is 7+35.
pl_arithmetic_test_plus_2b(X,_10244,_10244,_10226,_10226):-X is 0+(3+11).
pl_arithmetic_test_plus_3b(X,_10382,_10382,_10364,_10364):-X is 0+(3.2+11).
pl_arithmetic_test_plus_4b(X,N,_10510,_10510,_10492,_10492):-X is 77+N.
pl_arithmetic_test_plus_5b(X,_10656,_10656,_10638,_10638):-Y=foo,X is Y+77.
pl_arithmetic_throws_exception(test_plus_4b,_10762,_10762,_10744,_10744).
pl_arithmetic_throws_exception(test_plus_5b,_10868,_10868,_10850,_10850).
pl_arithmetic_test_minus_1(X,_10990,_10990,_10972,_10972):-X is '-'(7).
pl_arithmetic_test_minus_2(X,_11122,_11122,_11104,_11104):-X is '-'(3-11).
pl_arithmetic_test_minus_3(X,_11254,_11254,_11236,_11236):-X is '-'(3.2-11).
pl_arithmetic_test_minus_4(X,N,_11376,_11376,_11358,_11358):-X is '-'(N).
pl_arithmetic_test_minus_5(X,_11516,_11516,_11498,_11498):-Y=foo,X is '-'(Y).
pl_arithmetic_test_minus_6(X,_11640,_11640,_11622,_11622):-X is '-'(7,35).
pl_arithmetic_test_minus_7(X,_11774,_11774,_11756,_11756):-X is '-'(20,3+11).
pl_arithmetic_test_minus_8(X,_11908,_11908,_11890,_11890):-X is '-'(0,3.2+11).
pl_arithmetic_test_minus_9(X,N,_12032,_12032,_12014,_12014):-X is '-'(77,N).
pl_arithmetic_test_minus_10(X,_12174,_12174,_12156,_12156):-Y=foo,X is '-'(Y,77).
pl_arithmetic_throws_exception(test_minus_4,_12280,_12280,_12262,_12262).
pl_arithmetic_throws_exception(test_minus_5,_12386,_12386,_12368,_12368).
pl_arithmetic_throws_exception(test_minus_9,_12492,_12492,_12474,_12474).
pl_arithmetic_throws_exception(test_minus_10,_12598,_12598,_12580,_12580).
pl_arithmetic_test_minus_1b(X,_12716,_12716,_12698,_12698):-X is -7.
pl_arithmetic_test_minus_2b(X,_12848,_12848,_12830,_12830):-X is - (3-11).
pl_arithmetic_test_minus_3b(X,_12980,_12980,_12962,_12962):-X is - (3.2-11).
pl_arithmetic_test_minus_4b(X,N,_13102,_13102,_13084,_13084):-X is -N.
pl_arithmetic_test_minus_5b(X,_13242,_13242,_13224,_13224):-Y=foo,X is -Y.
pl_arithmetic_test_minus_6b(X,_13370,_13370,_13352,_13352):-X is 7-35.
pl_arithmetic_test_minus_7b(X,_13508,_13508,_13490,_13490):-X is 20-(3+11).
pl_arithmetic_test_minus_8b(X,_13646,_13646,_13628,_13628):-X is 0-(3.2+11).
pl_arithmetic_test_minus_9b(X,N,_13774,_13774,_13756,_13756):-X is 77-N.
pl_arithmetic_test_minus_10b(X,_13920,_13920,_13902,_13902):-Y=foo,X is Y-77.
pl_arithmetic_throws_exception(test_minus_4b,_14026,_14026,_14008,_14008).
pl_arithmetic_throws_exception(test_minus_5b,_14132,_14132,_14114,_14114).
pl_arithmetic_throws_exception(test_minus_9b,_14238,_14238,_14220,_14220).
pl_arithmetic_throws_exception(test_minus_10b,_14344,_14344,_14326,_14326).
pl_arithmetic_test_times_1(X,_14468,_14468,_14450,_14450):-X is '*'(7,35).
pl_arithmetic_test_times_2(X,_14602,_14602,_14584,_14584):-X is '*'(0,3+11).
pl_arithmetic_test_times_3(X,_14736,_14736,_14718,_14718):-X is '*'(1.5,3.2+11).
pl_arithmetic_test_times_4(X,N,_14860,_14860,_14842,_14842):-X is '*'(77,N).
pl_arithmetic_test_times_5(X,_15002,_15002,_14984,_14984):-Y=foo,X is '*'(Y,77).
pl_arithmetic_throws_exception(test_times_4,_15108,_15108,_15090,_15090).
pl_arithmetic_throws_exception(test_times_5,_15214,_15214,_15196,_15196).
pl_arithmetic_test_times_1b(X,_15342,_15342,_15324,_15324):-X is 7*35.
pl_arithmetic_test_times_2b(X,_15480,_15480,_15462,_15462):-X is 0*(3+11).
pl_arithmetic_test_times_3b(X,_15618,_15618,_15600,_15600):-X is 1.5*(3.2+11).
pl_arithmetic_test_times_4b(X,N,_15746,_15746,_15728,_15728):-X is 77*N.
pl_arithmetic_test_times_5b(X,_15892,_15892,_15874,_15874):-Y=foo,X is Y*77.
pl_arithmetic_throws_exception(test_times_4b,_15998,_15998,_15980,_15980).
pl_arithmetic_throws_exception(test_times_5b,_16104,_16104,_16086,_16086).
pl_arithmetic_test_division_1(X,_16228,_16228,_16210,_16210):-X is '/'(7,35).
pl_arithmetic_test_division_2(X,_16352,_16352,_16334,_16334):-X is '/'(7.0,35).
pl_arithmetic_test_division_3(X,_16486,_16486,_16468,_16468):-X is '/'(140,3+11).
pl_arithmetic_test_division_4(X,_16620,_16620,_16602,_16602):-X is '/'(20.1644,3.2+11).
pl_arithmetic_test_division_5(X,_16744,_16744,_16726,_16726):-X is '/'(7,-3).
pl_arithmetic_test_division_6(X,_16868,_16868,_16850,_16850):-X is '/'(-7,3).
pl_arithmetic_test_division_7(X,N,_16992,_16992,_16974,_16974):-X is '/'(77,N).
pl_arithmetic_test_division_8(X,_17134,_17134,_17116,_17116):-Y=foo,X is '/'(Y,77).
pl_arithmetic_test_division_9(X,_17258,_17258,_17240,_17240):-X is '/'(3,0).
pl_arithmetic_throws_exception(test_division_7,_17364,_17364,_17346,_17346).
pl_arithmetic_throws_exception(test_division_8,_17470,_17470,_17452,_17452).
pl_arithmetic_throws_exception(test_division_9,_17576,_17576,_17558,_17558).
pl_arithmetic_test_division_1b(X,_17704,_17704,_17686,_17686):-X is 7/35.
pl_arithmetic_test_division_2b(X,_17832,_17832,_17814,_17814):-X is 7.0/35.
pl_arithmetic_test_division_3b(X,_17970,_17970,_17952,_17952):-X is 140/(3+11).
pl_arithmetic_test_division_4b(X,_18108,_18108,_18090,_18090):-X is 20.1644/(3.2+11).
pl_arithmetic_test_division_5b(X,_18236,_18236,_18218,_18218):-X is 7/ -3.
pl_arithmetic_test_division_6b(X,_18364,_18364,_18346,_18346):-X is -7/3.
pl_arithmetic_test_division_7b(X,N,_18492,_18492,_18474,_18474):-X is 77/N.
pl_arithmetic_test_division_8b(X,_18638,_18638,_18620,_18620):-Y=foo,X is Y/77.
pl_arithmetic_test_division_9b(X,_18766,_18766,_18748,_18748):-X is 3/0.
pl_arithmetic_throws_exception(test_division_7b,_18872,_18872,_18854,_18854).
pl_arithmetic_throws_exception(test_division_8b,_18978,_18978,_18960,_18960).
pl_arithmetic_throws_exception(test_division_9b,_19084,_19084,_19066,_19066).
pl_arithmetic_test_mod_1(X,_19208,_19208,_19190,_19190):-X is 7 mod 3.
pl_arithmetic_test_mod_2(X,_19342,_19342,_19324,_19324):-X is 0 mod (3+11).
pl_arithmetic_test_mod_3(X,N,_19466,_19466,_19448,_19448):-X is 77 mod N.
pl_arithmetic_test_mod_4(X,_19608,_19608,_19590,_19590):-Y=foo,X is Y mod 77.
pl_arithmetic_test_mod_5(X,_19732,_19732,_19714,_19714):-X is 7.5 mod 2.
pl_arithmetic_test_mod_6(X,_19856,_19856,_19838,_19838):-X is 7 mod 0.
pl_arithmetic_test_mod_7(X,_19980,_19980,_19962,_19962):-X is 7 mod -2.
pl_arithmetic_throws_exception(test_mod_3,_20086,_20086,_20068,_20068).
pl_arithmetic_throws_exception(test_mod_4,_20192,_20192,_20174,_20174).
pl_arithmetic_throws_exception(test_mod_5,_20298,_20298,_20280,_20280).
pl_arithmetic_throws_exception(test_mod_6,_20404,_20404,_20386,_20386).
pl_arithmetic_test_floor_1(X,_20526,_20526,_20508,_20508):-X is floor(7.4).
pl_arithmetic_test_floor_2(X,_20654,_20654,_20636,_20636):-X is floor(-0.4).
pl_arithmetic_test_round_1(X,_20776,_20776,_20758,_20758):-X is round(7.5).
pl_arithmetic_test_round_2(X,_20898,_20898,_20880,_20880):-X is round(7.6).
pl_arithmetic_test_round_3(X,_21026,_21026,_21008,_21008):-X is round(-0.6).
pl_arithmetic_test_round_4(X,N,_21148,_21148,_21130,_21130):-X is round(N).
pl_arithmetic_throws_exception(test_round_4,_21256,_21256,_21238,_21238).
pl_arithmetic_test_ceiling_1(X,_21384,_21384,_21366,_21366):-X is ceiling(-0.5).
pl_arithmetic_test_truncate_1(X,_21512,_21512,_21494,_21494):-X is truncate(-0.5).
pl_arithmetic_test_truncate_2(X,_21650,_21650,_21632,_21632):-Y=foo,X is truncate(Y).
pl_arithmetic_throws_exception(test_truncate_2,_21756,_21756,_21738,_21738).
pl_arithmetic_test_floatarith_1(X,_21878,_21878,_21860,_21860):-X is float(7).
pl_arithmetic_test_floatarith_2(X,_22000,_22000,_21982,_21982):-X is float(7.3).
pl_arithmetic_test_floatarith_3(X,_22132,_22132,_22114,_22114):-X is float(5/3).
pl_arithmetic_test_floatarith_4(X,N,_22254,_22254,_22236,_22236):-X is float(N).
pl_arithmetic_test_floatarith_5(X,_22394,_22394,_22376,_22376):-Y=foo,X is float(Y).
pl_arithmetic_throws_exception(test_floatarith_4,_22500,_22500,_22482,_22482).
pl_arithmetic_throws_exception(test_floatarith_5,_22606,_22606,_22588,_22588).
pl_arithmetic_test_abs_1(X,_22728,_22728,_22710,_22710):-X is abs(7).
pl_arithmetic_test_abs_2(X,_22860,_22860,_22842,_22842):-X is abs(3-11).
pl_arithmetic_test_abs_3(X,_22992,_22992,_22974,_22974):-X is abs(3.2-11.0).
pl_arithmetic_test_abs_4(X,N,_23114,_23114,_23096,_23096):-X is abs(N).
pl_arithmetic_test_abs_5(X,_23254,_23254,_23236,_23236):-Y=foo,X is abs(Y).
pl_arithmetic_throws_exception(test_abs_4,_23360,_23360,_23342,_23342).
pl_arithmetic_throws_exception(test_abs_5,_23466,_23466,_23448,_23448).
pl_arithmetic_test_sqrt_1(X,_23588,_23588,_23570,_23570):-X is sqrt(0.0).
pl_arithmetic_test_sqrt_2(X,_23710,_23710,_23692,_23692):-X is sqrt(4.0).
pl_arithmetic_test_sqrt_3(X,_23832,_23832,_23814,_23814):-X is sqrt(0).
pl_arithmetic_test_sqrt_4(X,_23954,_23954,_23936,_23936):-X is sqrt(1.0).
pl_arithmetic_test_sqrt_5(X,N,_24076,_24076,_24058,_24058):-X is sqrt(N).
pl_arithmetic_test_sqrt_6(X,_24216,_24216,_24198,_24198):-Y=foo,X is sqrt(Y).
pl_arithmetic_test_sqrt_7(X,_24344,_24344,_24326,_24326):-X is sqrt(-1.0).
pl_arithmetic_throws_exception(test_sqrt_5,_24450,_24450,_24432,_24432).
pl_arithmetic_throws_exception(test_sqrt_6,_24556,_24556,_24538,_24538).
pl_arithmetic_throws_exception(test_sqrt_7,_24662,_24662,_24644,_24644).
pl_arithmetic_test_power_1(X,_24786,_24786,_24768,_24768):-X is '**'(5,3).
pl_arithmetic_test_power_2(X,_24916,_24916,_24898,_24898):-X is '**'(-5.0,3).
pl_arithmetic_test_power_3(X,_25040,_25040,_25022,_25022):-X is '**'(5,-1).
pl_arithmetic_test_power_4(X,N,_25164,_25164,_25146,_25146):-X is '**'(77,N).
pl_arithmetic_test_power_5(X,_25306,_25306,_25288,_25288):-Y=foo,X is '**'(Y,2).
pl_arithmetic_test_power_6(X,_25430,_25430,_25412,_25412):-X is '**'(5,3.0).
pl_arithmetic_test_power_7(X,_25554,_25554,_25536,_25536):-X is '**'(0.0,0).
pl_arithmetic_throws_exception(test_power_4,_25660,_25660,_25642,_25642).
pl_arithmetic_throws_exception(test_power_5,_25766,_25766,_25748,_25748).
pl_arithmetic_test_power_1b(X,_25894,_25894,_25876,_25876):-X is 5**3.
pl_arithmetic_test_power_2b(X,_26028,_26028,_26010,_26010):-X is -5.0**3.
pl_arithmetic_test_power_3b(X,_26156,_26156,_26138,_26138):-X is 5** -1.
pl_arithmetic_test_power_4b(X,N,_26284,_26284,_26266,_26266):-X is 77**N.
pl_arithmetic_test_power_5b(X,_26430,_26430,_26412,_26412):-Y=foo,X is Y**2.
pl_arithmetic_test_power_6b(X,_26558,_26558,_26540,_26540):-X is 5**3.0.
pl_arithmetic_test_power_7b(X,_26686,_26686,_26668,_26668):-X is 0.0**0.
pl_arithmetic_throws_exception(test_power_4b,_26792,_26792,_26774,_26774).
pl_arithmetic_throws_exception(test_power_5b,_26898,_26898,_26880,_26880).
