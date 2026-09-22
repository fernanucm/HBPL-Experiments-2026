data('stocks-n_1_0_100.bpl',1,0,100,0.1436,0.14531250000000004,204,1124737).
data('stocks-n_1_0_131.bpl',1,0,131,0.2907,0.290625,266,2456032).
data('stocks-n_1_0_162.bpl',1,0,162,0.5469,0.5484375000000001,328,4563815).
data('stocks-n_1_0_193.bpl',1,0,193,0.942,0.9437500000000002,390,7626832).
data('stocks-n_1_0_225.bpl',1,0,225,1.4203,1.4218750000000004,454,11980112).
data('stocks-n_1_0_256.bpl',1,0,256,2.0941,2.0953125000000012,516,17535157).
data('stocks-n_1_0_287.bpl',1,0,287,2.886,2.8875000000000006,578,24587440).
data('stocks-n_1_0_318.bpl',1,0,318,3.9253,3.9281250000000014,640,33315707).
data('stocks-n_1_0_350.bpl',1,0,350,5.2673000000000005,5.2687500000000025,704,44272987).

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
