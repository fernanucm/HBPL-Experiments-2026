data('stocks-s_1_0_500.bpl',1,0,500,0.1156,0.11562499999999998,1004,2317942).
data('stocks-s_1_0_812.bpl',1,0,812,0.3125,0.31249999999999994,1628,6044158).
data('stocks-s_1_0_1125.bpl',1,0,1125,0.5767,0.5781249999999997,2254,11542942).
data('stocks-s_1_0_1437.bpl',1,0,1437,0.961,0.9609375000000011,2878,18779158).
data('stocks-s_1_0_1750.bpl',1,0,1750,1.3843,1.384375,3504,27799192).
data('stocks-s_1_0_2062.bpl',1,0,2062,1.9233999999999998,1.9234375,4128,38545408).
data('stocks-s_1_0_2375.bpl',1,0,2375,2.5954,2.5968750000000016,4754,51086692).
data('stocks-s_1_0_2687.bpl',1,0,2687,3.3655,3.365625,5378,65342908).
data('stocks-s_1_0_3000.bpl',1,0,3000,4.1609,4.162499999999996,6004,81405442).

:-
%%% Extract assumptions
  format('Assumptions: ~n',[]),
  \+ \+((setof(A,N^E^R^CPU^RT^An^I^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract runtimes
  format('Runtimes: ~n',[]),
  \+ \+((setof(RT,N^E^R^A^CPU^An^I^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract number of answers
  format('Answers: ~n',[]),
  \+ \+((setof(An,N^E^R^A^CPU^RT^I^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract number of inferences
  format('Inferences: ~n',[]),
  \+ \+((setof(I,N^E^R^A^CPU^RT^An^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl.
