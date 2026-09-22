
data('stock-s_1_0_1000.bpl',1,0,1000,0.45489999999999997,0.45468750000000036,2004,9135442).
data('stock-s_1_0_1400.bpl',1,0,1400,0.8953000000000001,0.8953125,2804,17829442).
data('stock-s_1_0_1800.bpl',1,0,1800,1.4937,1.4953125,3604,29403442).
data('stock-s_1_0_2200.bpl',1,0,2200,2.2500999999999998,2.25,4404,43857442).
data('stock-s_1_0_2600.bpl',1,0,2600,3.2125,3.2125,5204,61191442).
data('stock-s_1_0_3000.bpl',1,0,3000,4.236,4.2359375,6004,81405442).
data('stock-s_1_0_3400.bpl',1,0,3400,5.5969999999999995,5.5968749999999945,6804,104499442).
data('stock-s_1_0_3800.bpl',1,0,3800,6.8,6.8015624999999975,7604,130473442).
data('stock-s_1_0_4200.bpl',1,0,4200,8.257700000000002,8.2578125,8404,159327442).

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
