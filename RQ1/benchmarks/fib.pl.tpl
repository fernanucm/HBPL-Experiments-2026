:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[true]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_1560,_1560,1.0).
frel2(_1588,_1588,1.0).
frel3(_1608,_1608,1.0).
gEqThan(_1504,_1504,1.0).
lEqThan(_1532,_1532,1.0).



fib_bench(hypo([],0,[],_660),_680,_686,_662,_664):-fib_fib(25,_F,hypo(_692,_694,_696,_660),_680,_686,_662,_664).
fib_fib(_2282,_2288,hypo([],1,[],_830),_850,_856,_832,_834):-unify_arguments_a3([[_2282,0,_850,_2324,_2294],[_2288,1,_2324,_856,_2336]]),degree_composition([_832,_2294,_2336],_834).
fib_fib(_2574,_2580,hypo([],2,[],_950),_970,_976,_952,_954):-unify_arguments_a3([[_2574,1,_970,_2616,_2586],[_2580,1,_2616,_976,_2628]]),degree_composition([_952,_2586,_2628],_954).
fib_fib(_5010,_5016,hypo([],3,[],_1140),_1302,_1186,_1284,_1148):-unify_arguments_a3([[_5010,N,_1302,_5052,_5022],[_5016,F,_5052,_1174,_5064]]),degree_composition([_1284,_5022,_5064],_1142),N>1,N1 is N-1,N2 is N-2,fib_fib(N1,F1,hypo(_1204,_1206,_1208,_1140),_1174,_1176,_1142,_1144),fib_fib(N2,F2,hypo(_1230,_1232,_1234,_1140),_1176,_1186,_1144,_1148),F is F1+F2.
