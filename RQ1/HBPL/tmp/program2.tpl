:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-initialization write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/tmp/program2.bpl:3: Singleton-marked variables appearing more than once: [_3296]'),nl.
:-directive(hypothetical,[true]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_3950,_3950,1.0).
frel2(_4070,_4070,1.0).
frel3(_4190,_4190,1.0).
gEqThan(_3716,_3716,1.0).
lEqThan(_3830,_3830,1.0).



program2_p(_8890,hypo([],0,[],_524),_966,_570,_948,_532):-unify_arguments_a3([[_8890,_3296,_966,_558,_8896]]),degree_composition([_948,_8896],_526),=>([1-[_3296]],program2_a(_3296,hypo(_896,_898,_900,[_592|_524]),_558,_560,_526,_528),_592,_524),program2_a(_3296,hypo(_920,_922,_924,_524),_560,_570,_528,_532).
program2_a(_13342,hypo([_3296],1,[_592|_524],_628),_810,_688,_792,_646):-reg(1,[_3296],_13532),chk(_13532,_628),unify_arguments_a3([[_13342,_3296,_810,_680,_13348]]),degree_composition([_792,_13348],_644),((_3296=1,_680=_682),_644=_646,_682=_688;(_3296=2,_680=_694),_644=_646,_694=_688).
