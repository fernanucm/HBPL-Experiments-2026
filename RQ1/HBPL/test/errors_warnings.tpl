:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-initialization (write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/errors_warnings.bpl:18: Singleton variables: [X]'),nl),(write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/errors_warnings.bpl:19: Singleton-marked variables appearing more than once: [_X]'),nl),(write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/errors_warnings.bpl:20: Singleton variables: [C,B,A]'),nl),(write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/errors_warnings.bpl:21: Singleton variables: [B]'),nl),(write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/errors_warnings.bpl:22: Singleton-marked variables appearing more than once: [_B,_A]'),nl),(write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/errors_warnings.bpl:23: Singleton variables: [B]'),nl),(write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/errors_warnings.bpl:23: Singleton-marked variables appearing more than once: [_A]'),nl),write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/errors_warnings.bpl:24: Singleton variables: [R]'),nl.

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_129588,_129588,1.0).
frel2(_129708,_129708,1.0).
frel3(_129828,_129828,1.0).
gEqThan(_129354,_129354,1.0).
lEqThan(_129468,_129468,1.0).



errors_warnings_no_singleton(_,_11018,_11018,_11000,_11000).
errors_warnings_no_singleton(_,_131896,_11272,_11278,_11254,_11256):-unify_arguments_a3([[_131896,_,_11272,_11278,_131934]]),degree_composition([_11254,_131934],_11256).
errors_warnings_no_singleton(X,_132976,_11560,_11566,_11542,_11544):-unify_arguments_a3([[_132976,X,_11560,_11566,_133014]]),degree_composition([_11542,_133014],_11544).
errors_warnings_no_singleton(_A,_B,_C,_11848,_11848,_11830,_11830).
errors_warnings_no_singleton(A,B,C,_12268,_12358,_12160,_12186):-write(A),_12268=_12270,_12160=_12162,_12270=_12282,ho_call([bpl_call],no,B,[_12282,_12292],_12170,_12162,_12174),((true,_12292=_12322),_12174=_12180,_12322=_12334->(fail,_12334=_12346),_12180=_12186,_12346=_12358;ho_call([bpl_call],no,C,[_12292,_12358],_12194,_12174,_12186)).
errors_warnings_no_singleton(R,_14212,_14212,_14194,_14194):-A is 2+3,B is 3+2,C is 5+9,R is A+B+C.
errors_warnings_singleton(X,_15042,_15042,_15024,_15024).
errors_warnings_singleton(_X,_149112,_15296,_15302,_15278,_15280):-unify_arguments_a3([[_149112,_X,_15296,_15302,_149150]]),degree_composition([_15278,_149150],_15280).
errors_warnings_singleton(A,B,C,_15584,_15584,_15566,_15566).
errors_warnings_singleton(A,B,_15924,_15924,_15906,_15906):-write(A),!.
errors_warnings_singleton(_A,_B,_16328,_16328,_16310,_16310):-read(_A),write(_B).
errors_warnings_singleton(_A,B,_19118,_19118,_18932,_18932):-write(_A).
errors_warnings_singleton(_29038,_29038,_28880,_28880):-A is 2+3,B is 3+2,C is 5+9,R is A+B+C.
errors_warnings_no_clause_vars(X,_33164,_33170,_32950,_32956):-ho_call([once],no,X,[_33164,_33170],_32944,_32950,_32956).
errors_warnings_no_clause_vars(_43926,_45978,_39932,_40786):-X=..[true],_43926=_43928,_39932=_39934,_43928=_44070,Y is 2+3,_44070=_44496,_39934=_40210,_44496=_44662,((Y>0,_44662=_45242),_40210=_40628,_45242=_45432->(true,_45432=_45764),_40628=_40786,_45764=_45978;ho_call([ignore],no,X,[_44662,_45978],_40966,_40210,_40786)).
errors_warnings_no_goal_vars(X,Y,_60632,_60812,_60166,_60172):-ho_call([bpl_call],yes,(ho_call([bpl_call],no,X,[_60632,_60638],_59902,_59908,_59914),ho_call([bpl_call],no,Y,[_60638,_60812],_60056,_59914,_60068)),[_60632,_60812],[_59908,_59914,_59914,_60068],_60166,_60172).
errors_warnings_no_goal_vars(L,_68866,_69064,_67578,_67780):-ho_call([findall,X,L],no,X,[_68866,_68872],_67572,_67578,_67584),ho_call([catch,_Error],no,(_Goal;_Catcher),[_68872,_69064],_67768,_67578,_67780).
errors_warnings_clause_vars(X,_75064,_75064,_74892,_74892):-X.
errors_warnings_clause_vars(_84570,_86622,_80582,_81436):-X=..[true],_84570=_84572,_80582=_80584,_84572=_84714,Y is 2+3,_84714=_85140,_80584=_80860,_85140=_85306,((Y>0,_85306=_85886),_80860=_81278,_85886=_86076->(true,_86076=_86408),_81278=_81436,_86408=_86622;ho_call([bpl_call],no,X,[_85306,_86622],_81610,_80860,_81436)).
errors_warnings_goal_vars(X,Y,_100352,_100358,_100144,_100150):-ho_call([bpl_call],no,(X,bpl_call(Y)),[_100352,_100358],_100138,_100144,_100150).
errors_warnings_goal_vars(X,_104456,_104462,_104248,_104254):-ho_call([bpl_call],no,(bpl_call(X),_Y),[_104456,_104462],_104242,_104248,_104254).
errors_warnings_goal_vars(L,_108918,_108924,_108692,_108698):-ho_call([findall,(X,Y),L],no,(X,Y),[_108918,_108924],_108686,_108692,_108698).
errors_warnings_first_warning(singleton,18,_112354,_112354,_112168,_112168).
errors_warnings_number_warnings(singleton,7,_114074,_114074,_113888,_113888).
errors_warnings_warning_in_line(Line,_116366,_116372,_116180,_116186):-errors_warnings_get_warning_lines(singleton,Line,_116366,_116372,_116180,_116186).
errors_warnings_get_warning_lines(Type,Line,_124278,_124604,_123312,_123592):-errors_warnings_first_warning(Type,First,_124278,_124284,_123312,_123318),errors_warnings_number_warnings(Type,Num,_124284,_124604,_123318,_123592),Last is First+Num-1,between(First,Last,Line).
