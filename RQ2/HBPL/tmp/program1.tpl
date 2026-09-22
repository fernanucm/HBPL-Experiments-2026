:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-initialization write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/tmp/program1.bpl:3: Singleton-marked variables appearing more than once: [_2528]'),nl.
:-directive(hypothetical,[true]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_1350,_1350,1.0).
frel2(_1378,_1378,1.0).
frel3(_1398,_1398,1.0).
gEqThan(_1294,_1294,1.0).
lEqThan(_1322,_1322,1.0).



program1_p(_2126,hypo([],0,[],_696),_1076,_722,_1058,_700):-unify_arguments_a3([[_2126,_2528,_1076,_716,_2132]]),degree_composition([_1058,_2132],_698),=>([1-[_2528]],program1_a(_2528,hypo(_1036,_1038,_1040,[_732|_696]),_716,_722,_698,_700),_732,_696).
program1_a(_4470,hypo([_2528],1,[_732|_696],_768),_950,_828,_932,_786):-reg(1,[_2528],_4660),chk(_4660,_768),unify_arguments_a3([[_4470,_2528,_950,_820,_4476]]),degree_composition([_932,_4476],_784),((_2528=1,_820=_822),_784=_786,_822=_828;(_2528=2,_820=_834),_784=_786,_834=_828).
