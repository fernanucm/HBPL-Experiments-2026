data('stocks-s_1_1000_0.bpl',1,1000,0,0.2781,0.27812500000000007,2004,6120437).
data('stocks-s_1_1400_0.bpl',1,1400,0,0.5234,0.5234375000000001,2804,11928437).
data('stocks-s_1_1800_0.bpl',1,1800,0,0.861,0.8609375,3604,19656437).
data('stocks-s_1_2200_0.bpl',1,2200,0,1.2718,1.271875,4404,29304437).
data('stocks-s_1_2600_0.bpl',1,2600,0,1.7782000000000004,1.778125,5204,40872437).
data('stocks-s_1_3000_0.bpl',1,3000,0,2.3844,2.3843750000000004,6004,54360437).
data('stocks-s_1_3400_0.bpl',1,3400,0,3.1797,3.1796875,6804,69768437).
data('stocks-s_1_3800_0.bpl',1,3800,0,3.9078000000000004,3.907812500000001,7604,87096437).
data('stocks-s_1_4200_0.bpl',1,4200,0,4.6625,4.6625000000000005,8404,106344437).

:-
%%% Extract rules
  format('Rules: ~n',[]),
  \+ \+((setof(R,N^E^A^CPU^RT^An^I^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract runtimes
  format('Runtimes: ~n',[]),
  \+ \+((setof(RT,N^E^R^A^CPU^An^I^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract number of answers
  format('Answers: ~n',[]),
  \+ \+((setof(An,N^E^R^A^CPU^RT^I^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl,

%%% Extract number of inferences
  format('Inferences: ~n',[]),
  \+ \+((setof(I,N^E^R^A^CPU^RT^An^data(N,E,R,A,CPU,RT,An,I),RTs),findall(RT,(member(RT,RTs),format('~w\n',[RT])),_))), nl.
