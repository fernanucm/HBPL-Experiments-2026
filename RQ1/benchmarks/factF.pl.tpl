:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(hypothetical,[false]).
:-directive(weak_unification,[a3]).
:-directive(indexing,[false]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_36524,_36524,1.0).
frel2(_36644,_36644,1.0).
frel3(_36764,_36764,1.0).
gEqThan(_36290,_36290,1.0).
lEqThan(_36404,_36404,1.0).



fact_bench(_11006,_11012,_10608,_10614):-fact_many_fact(50,_11006,_11012,_10608,_10614),!.
fact_many_fact(_39276,_13228,_13234,_13056,_13062):-unify_arguments_a3([[_39276,0,_13228,_13234,_39282]]),degree_composition([_13056,_39282],_13062).
fact_many_fact(_42790,_20372,_19964,_20200,_18972):-unify_arguments_a3([[_42790,N,_20372,_19548,_42796]]),degree_composition([_20200,_42796],_18602),N>0,fact_fact(1000,_,_19548,_19554,_18602,_18608),N1 is N-1,fact_many_fact(N1,_19554,_19964,_18608,_18972).
fact_fact(_43622,_43628,_23552,_23558,_23366,_23372):-unify_arguments_a3([[_43622,0,_23552,_43664,_43634],[_43628,1,_43664,_23558,_43676]]),degree_composition([_23366,_43634,_43676],_23372).
fact_fact(_44420,_44426,_25248,_25254,_25062,_25068):-unify_arguments_a3([[_44420,1,_25248,_44462,_44432],[_44426,1,_44462,_25254,_44474]]),degree_composition([_25062,_44432,_44474],_25068).
fact_fact(_47864,_47870,_33186,_32654,_33000,_31754):-unify_arguments_a3([[_47864,N,_33186,_47906,_47876],[_47870,F,_47906,_32648,_47918]]),degree_composition([_33000,_47876,_47918],_31748),N>1,N1 is N-1,fact_fact(N1,F1,_32648,_32654,_31748,_31754),F is F1*N.
