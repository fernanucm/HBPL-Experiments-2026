:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_71924,_71924,1.0).
frel2(_72044,_72044,1.0).
frel3(_72164,_72164,1.0).
gEqThan(_71690,_71690,1.0).
lEqThan(_71804,_71804,1.0).



errors_other_lines_first_error(misc,13,_44384,_44384,_44198,_44198).
errors_other_lines_number_errors(misc,13,_46104,_46104,_45918,_45918).
errors_other_lines_error_in_line(Line,_48396,_48402,_48210,_48216):-errors_other_lines_get_error_lines(misc,Line,_48396,_48402,_48210,_48216).
errors_other_lines_error_in_line(38,_50628,_50628,_50456,_50456).
errors_other_lines_error_in_line(40,_52076,_52076,_51904,_51904).
errors_other_lines_first_error(operator,60,_53722,_53722,_53536,_53536).
errors_other_lines_number_errors(operator,7,_55442,_55442,_55256,_55256).
errors_other_lines_error_in_line(Line,_57734,_57740,_57548,_57554):-errors_other_lines_get_error_lines(operator,Line,_57734,_57740,_57548,_57554).
errors_other_lines_error_in_line(73,_59966,_59966,_59794,_59794).
errors_other_lines_get_error_lines(Type,Line,_67094,_67420,_66128,_66408):-errors_other_lines_first_error(Type,First,_67094,_67100,_66128,_66134),errors_other_lines_number_errors(Type,Num,_67100,_67420,_66134,_66408),Last is First+Num-1,between(First,Last,Line).
