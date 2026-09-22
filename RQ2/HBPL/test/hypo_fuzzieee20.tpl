:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(degree_accumulator,[false]).
:-directive(indexing,[true]).
:-directive(weak_unification,[a1]).
:-directive(hypothetical,[true]).
t_norm(~,min).

frel1(_80838,_80838,1.0).
frel2(_80958,_80958,1.0).
frel3(_81078,_81078,1.0).
gEqThan(_80604,_80604,1.0).
lEqThan(_80718,_80718,1.0).

hypo_fuzzieee20_test_suite(_82074,hypo([],0,[],_25056),_25190):-unify_arguments_a1([[_82074,[test_example_1,test_example_2,test_example_3],_25190]]).
hypo_fuzzieee20_stock_up(_82944,hypo([],1,[],_27312),_27446):-unify_arguments_a1([[_82944,google,_82954]]),degree_composition([0.9,_82954],_27446).
hypo_fuzzieee20_stock_up(_83846,hypo([],2,[],_29202),_29336):-unify_arguments_a1([[_83846,greek_bonds,_83856]]),degree_composition([0.2,_83856],_29336).
hypo_fuzzieee20_shareholder(_84780,_84786,hypo([],3,[],_31028),_31168):-unify_arguments_a1([[_84780,paul,_84796],[_84786,google,_84826]]),degree_composition([_84796,_84826],_31168).
hypo_fuzzieee20_shareholder(_85758,_85764,hypo([],4,[],_32948),_33088):-unify_arguments_a1([[_85758,paul,_85774],[_85764,greek_bonds,_85804]]),degree_composition([_85774,_85804],_33088).
hypo_fuzzieee20_keep_stock(_88850,_88856,hypo([],5,[],_35904),_37480):-unify_arguments_a1([[_88850,Name,_88866],[_88856,Stock,_88896]]),hypo_fuzzieee20_shareholder(Name,Stock,hypo(_37046,_37048,_37050,_35904),_36566),hypo_fuzzieee20_stock_up(Stock,hypo(_37250,_37252,_37254,_35904),_36694),degree_composition([_36694,_36566,_88866,_88896],_37480).
hypo_fuzzieee20_profitable_stocks(_92548,_92554,hypo([],6,[],_42652),_45120):-unify_arguments_a1([[_92548,Name,_92564],[_92554,Stock,_92594]]),=>([7-[],8-[]],hypo_fuzzieee20_keep_stock(Name,Stock,hypo(_44852,_44854,_44856,[_43556|_42652]),_43352),_43556,_42652),degree_composition([_43352,_92564,_92594],_45120).
hypo_fuzzieee20_stock_up(_93530,hypo([],7,[_43556|_42652],_43634),_43776):-reg(7,[],_93630),chk(_93630,_43634),unify_arguments_a1([[_93530,amazon,_93540]]),degree_composition([0.7,_93540],_43776).
hypo_fuzzieee20_shareholder(_94568,_94574,hypo([],8,[_43556|_42652],_44158),_44312):-reg(8,[],_94712),chk(_94712,_44158),unify_arguments_a1([[_94568,paul,_94584],[_94574,amazon,_94614]]),degree_composition([_94584,_94614],_44312).
hypo_fuzzieee20_raising_google_stocks(hypo([],9,[],_49386),_49972):- =>([10-[]],hypo_fuzzieee20_stock_up(google,hypo(_50870,_50872,_50874,[_50168|_49386]),_49972),_50168,_49386).
hypo_fuzzieee20_stock_up(_98606,hypo([],10,[_50168|_49386],_50228),_50370):-reg(10,[],_98706),chk(_98706,_50228),unify_arguments_a1([[_98606,google,_98616]]),degree_composition([0.6,_98616],_50370).
hypo_fuzzieee20_test_example_1(hypo([],11,[],_56898),_57878):-ho_call([findall,Name-Stock-Degree,[paul-google-0.9,paul-greek_bonds-0.2]],yes,ho_call([truth_degree,Degree],yes,hypo_fuzzieee20_keep_stock(Name,Stock,hypo(_58464,_58466,_58468,_56898),_57712),[_57712],_57802),[_57802],_57878).
hypo_fuzzieee20_test_example_2(hypo([],12,[],_67422),_68438):-ho_call([findall,Name-Stock-Degree,[paul-google-0.9,paul-greek_bonds-0.2,paul-amazon-0.7]],yes,ho_call([truth_degree,Degree],yes,hypo_fuzzieee20_profitable_stocks(Name,Stock,hypo(_69024,_69026,_69028,_67422),_68272),[_68272],_68362),[_68362],_68438).
hypo_fuzzieee20_test_example_3(hypo([],13,[],_75328),_76106):-ho_call([findall,Degree,[0.9,0.6]],yes,ho_call([truth_degree,Degree],yes,hypo_fuzzieee20_raising_google_stocks(hypo(_76680,_76682,_76684,_75328),_75956),[_75956],_76030),[_76030],_76106).
