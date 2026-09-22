data('stocks-n_10_0_250.bpl',10,0,250,1.9424,1.9421874999999997,504,16348687).
data('stocks-n_18_0_250.bpl',18,0,250,1.9374999999999996,1.9390624999999997,504,16348687).
data('stocks-n_27_0_250.bpl',27,0,250,1.9500000000000004,1.9515625,504,16348687).
data('stocks-n_36_0_250.bpl',36,0,250,1.9654999999999998,1.9656249999999997,504,16348687).
data('stocks-n_45_0_250.bpl',45,0,250,1.9594,1.959375,504,16348687).
data('stocks-n_53_0_250.bpl',53,0,250,1.9547000000000003,1.9546875,504,16348687).
data('stocks-n_62_0_250.bpl',62,0,250,1.9686,1.9687500000000007,504,16348687).
data('stocks-n_71_0_250.bpl',71,0,250,1.9687000000000001,1.9687500000000007,504,16348687).
data('stocks-n_80_0_250.bpl',80,0,250,1.9718,1.9734375000000006,504,16348687).

:-
%%% Extract number of equations
  format('Equations: ~n',[]),
  \+ \+((setof(E,N^R^A^CPU^RT^An^I^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract sorted runtimes
  format('Sorted Runtimes: ~n',[]),
  \+ \+((findall(RT,data(N,E,R,A,CPU,RT,An,I),URTs),msort(URTs,RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract number of answers
  format('Answers: ~n',[]),
  \+ \+((setof(An,N^E^R^A^CPU^RT^I^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract number of inferences
  format('Inferences: ~n',[]),
  \+ \+((setof(I,N^E^R^A^CPU^RT^An^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl.

