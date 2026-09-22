:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_67620,_67620,1.0).
frel2(_67740,_67740,1.0).
frel3(_67860,_67860,1.0).
gEqThan(_67386,_67386,1.0).
lEqThan(_67500,_67500,1.0).



errors_directives_lines_first_error(lambda_cut,14,_25062,_25062,_24876,_24876).
errors_directives_lines_number_errors(lambda_cut,6,_26782,_26782,_26596,_26596).
errors_directives_lines_error_in_line(Line,_29074,_29080,_28888,_28894):-errors_directives_lines_get_error_lines(lambda_cut,Line,_29074,_29080,_28888,_28894).
errors_directives_lines_first_error(transitivity,31,_31504,_31504,_31318,_31318).
errors_directives_lines_number_errors(transitivity,4,_33224,_33224,_33038,_33038).
errors_directives_lines_error_in_line(Line,_35516,_35522,_35330,_35336):-errors_directives_lines_get_error_lines(transitivity,Line,_35516,_35522,_35330,_35336).
errors_directives_lines_first_error(fuzzy_rel,45,_37946,_37946,_37760,_37760).
errors_directives_lines_number_errors(fuzzy_rel,9,_39666,_39666,_39480,_39480).
errors_directives_lines_error_in_line(Line,_41958,_41964,_41772,_41778):-errors_directives_lines_get_error_lines(fuzzy_rel,Line,_41958,_41964,_41772,_41778).
errors_directives_lines_first_error(domain,62,_44388,_44388,_44202,_44202).
errors_directives_lines_number_errors(domain,15,_46108,_46108,_45922,_45922).
errors_directives_lines_error_in_line(Line,_48400,_48406,_48214,_48220):-errors_directives_lines_get_error_lines(domain,Line,_48400,_48406,_48214,_48220).
errors_directives_lines_first_error(fuzzy_set,87,_50830,_50830,_50644,_50644).
errors_directives_lines_number_errors(fuzzy_set,18,_52550,_52550,_52364,_52364).
errors_directives_lines_error_in_line(Line,_54842,_54848,_54656,_54662):-errors_directives_lines_get_error_lines(fuzzy_set,Line,_54842,_54848,_54656,_54662).
errors_directives_lines_get_error_lines(Type,Line,_62754,_63080,_61788,_62068):-errors_directives_lines_first_error(Type,First,_62754,_62760,_61788,_61794),errors_directives_lines_number_errors(Type,Num,_62760,_63080,_61794,_62068),Last is First+Num-1,between(First,Last,Line).
