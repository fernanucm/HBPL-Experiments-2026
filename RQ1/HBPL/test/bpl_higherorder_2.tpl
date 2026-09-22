:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(weak_unification,[a3]).
:-directive(degree_accumulator,[true]).
:-directive(filtering,[true]).
:-directive(transitivity,[no]).
:-directive(hypothetical,[true]).
t_norm(~,no).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_77444,_77444,1.0).
frel2(_77564,_77564,1.0).
frel3(_77684,_77684,1.0).
gEqThan(_77210,_77210,1.0).
lEqThan(_77324,_77324,1.0).



bpl_higherorder_2_test_suite(_78858,hypo([],0,[],_19838),_20136,_20142,_19964,_19970):-unify_arguments_a3([[_78858,[test_ho_1,test_ho_2,test_ho_3,test_ho_4,test_ho_5,test_ho_6,test_ho_7],_20136,_20142,_78864]]),degree_composition([_19964,_78864],_19970).
bpl_higherorder_2_test_ho_1(hypo([],1,[],_24064),_25254,_25260,_24808,_24814):-X=(a=>a),ho_call([bpl_call],no,X,[_25254,_25260],_24802,_24808,_24814).
bpl_higherorder_2_test_ho_2(hypo([],2,[],_30206),_31432,_31438,_30986,_30992):-X=eval_negation(not,(a=>a)),ho_call([eval_negation,not],no,X,[_31432,_31438],_30980,_30986,_30992).
bpl_higherorder_2_test_ho_3(hypo([],3,[],_36886),_38436,_38442,_37862,_37868):-X=(a=>eval_negation(not,a)),ho_call([eval_negation,not],yes,ho_call([bpl_call],no,X,[_38436,_38442],_37776,_37782,_37788),[_38436,_38442],[_37782,_37788],_37862,_37868).
bpl_higherorder_2_test_ho_4(hypo([],4,[],_45112),_46338,_46344,_45892,_45898):-X=eval_negation(not,(a=>eval_negation(not,a))),ho_call([bpl_call],no,X,[_46338,_46344],_45886,_45892,_45898).
bpl_higherorder_2_test_ho_5(hypo([],5,[],_51848),_53056,_53062,_52610,_52616):-X=((a with 0.3)=>a),ho_call([bpl_call],no,X,[_53056,_53062],_52604,_52610,_52616).
bpl_higherorder_2_test_ho_6(hypo([],6,[],_58596),_60146,_60152,_59572,_59578):-X=((a with 0.3)=>a),ho_call([eval_negation,not],yes,ho_call([bpl_call],no,X,[_60146,_60152],_59486,_59492,_59498),[_60146,_60152],[_59492,_59498],_59572,_59578).
bpl_higherorder_2_test_ho_7(hypo([],7,[],_67320),_68546,_68552,_68100,_68106):-X=((p:-a=>a)=>p),ho_call([bpl_call],no,X,[_68546,_68552],_68094,_68100,_68106).
bpl_higherorder_2_approximation_degree(_108348,_108354,hypo([],8,[],_72536),_72854,_72860,_72668,_72674):-unify_arguments_a3([[_108348,test_ho_5,_72854,_108390,_108360],[_108354,0.3,_108390,_72860,_108402]]),degree_composition([_72668,_108360,_108402],_72674).
bpl_higherorder_2_approximation_degree(_109498,_109504,hypo([],9,[],_74868),_75186,_75192,_75000,_75006):-unify_arguments_a3([[_109498,test_ho_6,_75186,_109540,_109510],[_109504,0.7,_109540,_75192,_109552]]),degree_composition([_75000,_109510,_109552],_75006).
