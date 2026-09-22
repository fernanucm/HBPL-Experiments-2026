data('stocks-r_1_0_100_0.bpl',1,0,100,0,0.1283,0.128125,204,1127262).
data('stocks-r_1_0_131_0.bpl',1,0,131,0,0.2814,0.2812500000000001,266,2459332).
data('stocks-r_1_0_162_0.bpl',1,0,162,0,0.5126,0.5218749999999999,328,4567890).
data('stocks-r_1_0_193_0.bpl',1,0,193,0,0.8656,0.8781250000000004,390,7631682).
data('stocks-r_1_0_225_0.bpl',1,0,225,0,1.3795000000000002,1.3921875000000006,454,11985762).
data('stocks-r_1_0_256_0.bpl',1,0,256,0,1.989,1.9921875000000007,516,17541582).
data('stocks-r_1_0_287_0.bpl',1,0,287,0,2.7874,2.790625,578,24594640).
data('stocks-r_1_0_318_0.bpl',1,0,318,0,3.7233999999999994,3.7250000000000005,640,33323682).
data('stocks-r_1_0_350_0.bpl',1,0,350,0,5.117399999999999,5.11875,704,44281762).

:-
%%% Extract Hypothetical rules
  format('Hypothetical rules: ~n',[]),
  \+ \+((setof(H,N^E^R^A^CPU^RT^An^I^data(N,E,R,H,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract runtimes
  format('Runtimes: ~n',[]),
  \+ \+((setof(RT,N^E^R^H^A^CPU^An^I^data(N,E,R,H,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract number of answers
  format('Answers: ~n',[]),
  \+ \+((setof(An,N^E^R^H^A^CPU^RT^I^data(N,E,R,H,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract number of inferences
  format('Inferences: ~n',[]),
  \+ \+((setof(I,N^E^R^H^A^CPU^RT^An^data(N,E,R,H,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl.

