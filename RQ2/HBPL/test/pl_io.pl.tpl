:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-initialization (write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/pl_io.pl:41: Singleton variables: [Stream]'),nl),write('WARNING: c:/users/fernan/dropbox/jlamp-js2025/experiments/hbpl/test/pl_io.pl:42: Singleton variables: [Stream]'),nl.

t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


frel1(_13994,_13994,1.0).
frel2(_14022,_14022,1.0).
frel3(_14042,_14042,1.0).
gEqThan(_13938,_13938,1.0).
lEqThan(_13966,_13966,1.0).



pl_io_test_suites([test_open_close,test_read_1,test_read_2,test_write_1,test_write_2,test_nl_1,test_nl_2,test_get_char_1,test_get_char_2,test_put_char_1,test_put_char_2],_1354,_1354,_1336,_1336).
pl_io_test_open_close_1(_1518,_1518,_1500,_1500):-tmp_file('test',File),tell(File),told,open(File,read,Stream),close(Stream),delete_file(File).
pl_io_test_open_close_2(_1664,_1664,_1646,_1646):-tmp_file('test',File),open(File,write,Stream),close(Stream),delete_file(File).
pl_io_test_open_close_3(Term,_1858,_1858,_1840,_1840):-tmp_file('test',File),open(File,write,StreamW),write(StreamW,'sample.'),close(StreamW),open(File,read,StreamR),read(StreamR,Term),close(StreamR),delete_file(File).
pl_io_test_open_close_4(_1974,_1974,_1956,_1956):-open('file',unknown,Stream).
pl_io_test_open_close_5(_2088,_2088,_2070,_2070):-open('non-existent',read,Stream).
pl_io_throws_exception(test_open_close_4,_2192,_2192,_2174,_2174).
pl_io_throws_exception(test_open_close_5,_2298,_2298,_2280,_2280).
pl_io_test_read_1_1(T,_2418,_2424,_2400,_2402):-pl_io_create_temp_file('term1. term2.',File,_2418,_2424,_2400,_2402),see(File),read(T),seen,delete_file(File).
pl_io_test_read_1_2(_2604,_2610,_2586,_2588):-pl_io_create_temp_file('term1. term2.',File,_2604,_2610,_2586,_2588),see(File),read(term1),seen,delete_file(File).
pl_io_test_read_1_3(T,_2788,_2794,_2770,_2772):-pl_io_create_temp_file('3.1. term2.',File,_2788,_2794,_2770,_2772),see(File),read(T),seen,delete_file(File).
pl_io_test_read_1_4(_3102,_3214,_2960,_2986):-pl_io_create_temp_file('3.1. term2.',File,_3102,_3104,_2960,_2962),see(File),_3104=_3130,_2962=_2968,_3130=_3142,(((read(4.1),_3142=_3154),_2968=_2974,_3154=_3166),((seen,_3166=_3178),_2974=_2980,_3178=_3190),(delete_file(File),_3190=_3202),_2980=_2986,_3202=_3214;((seen,_3142=_3226),_2968=_2992,_3226=_3238),((delete_file(File),_3238=_3250),_2992=_2998,_3250=_3262),(fail,_3262=_3274),_2998=_2986,_3274=_3214).
pl_io_test_read_1_5(T,_3848,_4102,_3678,_3786):-pl_io_create_temp_file('foo 123. term2.',File,_3848,_3850,_3678,_3680),see(File),_3850=_3876,_3680=_3686,_3876=_3888,ho_call([catch,Error],yes,((read(T),_3888=_3900),_3686=_3704,_3900=_3912;((seen,_3888=_3924),_3686=_3710,_3924=_3936),((delete_file(File),_3936=_3948),_3710=_3716,_3948=_3960),(throw(Error),_3960=_3972),_3716=_3704,_3972=_3912),[_3888,_3912],[_3686,_3704,_3686,_3710,_3710,_3716,_3716,_3704],_3772,_3774),seen,_3912=_4066,_3704=_3780,_4066=_4078,delete_file(File),_4078=_4090,_3780=_3786,_4090=_4102.
pl_io_test_read_1_6(T,_4624,_4878,_4454,_4562):-pl_io_create_temp_file('3.1',File,_4624,_4626,_4454,_4456),see(File),_4626=_4652,_4456=_4462,_4652=_4664,ho_call([catch,Error],yes,((read(T),_4664=_4676),_4462=_4480,_4676=_4688;((seen,_4664=_4700),_4462=_4486,_4700=_4712),((delete_file(File),_4712=_4724),_4486=_4492,_4724=_4736),(throw(Error),_4736=_4748),_4492=_4480,_4748=_4688),[_4664,_4688],[_4462,_4480,_4462,_4486,_4486,_4492,_4492,_4480],_4548,_4550),seen,_4688=_4842,_4480=_4556,_4842=_4854,delete_file(File),_4854=_4866,_4556=_4562,_4866=_4878.
pl_io_throws_exception(test_read_1_5,_5226,_5226,_5208,_5208).
pl_io_throws_exception(test_read_1_6,_5332,_5332,_5314,_5314).
pl_io_test_read_2_1(T,_5462,_5468,_5444,_5446):-pl_io_create_temp_file('term1. term2.',File,_5462,_5468,_5444,_5446),open(File,read,Stream),read(Stream,T),close(Stream),delete_file(File).
pl_io_test_read_2_2(_5658,_5664,_5640,_5642):-pl_io_create_temp_file('term1. term2.',File,_5658,_5664,_5640,_5642),open(File,read,Stream),read(Stream,term1),close(Stream),delete_file(File).
pl_io_test_read_2_3(T,_5852,_5858,_5834,_5836):-pl_io_create_temp_file('3.1. term2.',File,_5852,_5858,_5834,_5836),open(File,read,Stream),read(Stream,T),close(Stream),delete_file(File).
pl_io_test_read_2_4(_6180,_6292,_6038,_6064):-pl_io_create_temp_file('3.1. term2.',File,_6180,_6182,_6038,_6040),open(File,read,Stream),_6182=_6208,_6040=_6046,_6208=_6220,(((read(Stream,4.1),_6220=_6232),_6046=_6052,_6232=_6244),((close(Stream),_6244=_6256),_6052=_6058,_6256=_6268),(delete_file(File),_6268=_6280),_6058=_6064,_6280=_6292;((close(Stream),_6220=_6304),_6046=_6070,_6304=_6316),((delete_file(File),_6316=_6328),_6070=_6076,_6328=_6340),(fail,_6340=_6352),_6076=_6064,_6352=_6292).
pl_io_test_read_2_5(T,_6940,_7194,_6770,_6878):-pl_io_create_temp_file('foo 123. term2.',File,_6940,_6942,_6770,_6772),open(File,read,Stream),_6942=_6968,_6772=_6778,_6968=_6980,ho_call([catch,Error],yes,((read(Stream,T),_6980=_6992),_6778=_6796,_6992=_7004;((close(Stream),_6980=_7016),_6778=_6802,_7016=_7028),((delete_file(File),_7028=_7040),_6802=_6808,_7040=_7052),(throw(Error),_7052=_7064),_6808=_6796,_7064=_7004),[_6980,_7004],[_6778,_6796,_6778,_6802,_6802,_6808,_6808,_6796],_6864,_6866),close(Stream),_7004=_7158,_6796=_6872,_7158=_7170,delete_file(File),_7170=_7182,_6872=_6878,_7182=_7194.
pl_io_test_read_2_6(T,_7730,_7984,_7560,_7668):-pl_io_create_temp_file('3.1',File,_7730,_7732,_7560,_7562),open(File,read,Stream),_7732=_7758,_7562=_7568,_7758=_7770,ho_call([catch,Error],yes,((read(Stream,T),_7770=_7782),_7568=_7586,_7782=_7794;((close(Stream),_7770=_7806),_7568=_7592,_7806=_7818),((delete_file(File),_7818=_7830),_7592=_7598,_7830=_7842),(throw(Error),_7842=_7854),_7598=_7586,_7854=_7794),[_7770,_7794],[_7568,_7586,_7568,_7592,_7592,_7598,_7598,_7586],_7654,_7656),close(Stream),_7794=_7948,_7586=_7662,_7948=_7960,delete_file(File),_7960=_7972,_7662=_7668,_7972=_7984.
pl_io_throws_exception(test_read_2_5,_8332,_8332,_8314,_8314).
pl_io_throws_exception(test_read_2_6,_8438,_8438,_8420,_8420).
pl_io_test_write_1_1(_8568,_8568,_8550,_8550):-write([1,2,3]).
pl_io_test_write_1_2(_8688,_8688,_8670,_8670):-write(1<2).
pl_io_test_write_1_3(_8798,_8798,_8780,_8780):-write('1<2').
pl_io_test_write_1_4(_8926,_8926,_8908,_8908):-write('$VAR'(0)<'$VAR'(1)).
pl_io_test_write_2_1(Codes,_9116,_9116,_9098,_9098):-tmp_file('test',File),open(File,write,Stream),write(Stream,[1,2,3]),close(Stream),read_file_to_codes(File,Codes,[]),delete_file(File).
pl_io_test_write_2_2(Codes,_9300,_9300,_9282,_9282):-tmp_file('test',File),open(File,write,Stream),write(Stream,1<2),close(Stream),read_file_to_codes(File,Codes,[]),delete_file(File).
pl_io_test_write_2_3(Codes,_9474,_9474,_9456,_9456):-tmp_file('test',File),open(File,write,Stream),write(Stream,'1<2'),close(Stream),read_file_to_codes(File,Codes,[]),delete_file(File).
pl_io_test_write_2_4(Codes,_9666,_9666,_9648,_9648):-tmp_file('test',File),open(File,write,Stream),write(Stream,'$VAR'(0)<'$VAR'(1)),close(Stream),read_file_to_codes(File,Codes,[]),delete_file(File).
pl_io_test_nl_1_1(_9784,_9784,_9766,_9766):-nl,put_char(a).
pl_io_test_nl_2_1(Codes,_9966,_9966,_9948,_9948):-tmp_file('test',File),open(File,write,Stream),nl(Stream),put_char(Stream,a),close(Stream),read_file_to_codes(File,Codes,[]),delete_file(File).
pl_io_test_nl_2_2(Str,_10078,_10078,_10060,_10060):-nl(Str).
pl_io_test_nl_2_3(_10196,_10196,_10178,_10178):-nl([my_file]).
pl_io_throws_exception(test_nl_2_2,_10300,_10300,_10282,_10282).
pl_io_throws_exception(test_nl_2_3,_10406,_10406,_10388,_10388).
pl_io_test_get_char_1_1(Char,_10526,_10532,_10508,_10510):-pl_io_create_temp_file('qwerty',File,_10526,_10532,_10508,_10510),see(File),get_char(Char),seen,delete_file(File).
pl_io_test_get_char_2_1(Char,_10722,_10728,_10704,_10706):-pl_io_create_temp_file('qwerty',File,_10722,_10728,_10704,_10706),open(File,read,Stream),get_char(Stream,Char),close(Stream),delete_file(File).
pl_io_test_get_char_2_2(Char,_10918,_10924,_10900,_10902):-pl_io_create_temp_file('\'qwerty\'',File,_10918,_10924,_10900,_10902),open(File,read,Stream),get_char(Stream,Char),close(Stream),delete_file(File).
pl_io_test_get_char_2_3(_11114,_11120,_11096,_11098):-pl_io_create_temp_file('\13\10\newline',File,_11114,_11120,_11096,_11098),open(File,read,Stream),get_char(Stream,'\13\'),close(Stream),delete_file(File).
pl_io_test_get_char_2_4(Char,_11308,_11314,_11290,_11292):-pl_io_create_temp_file('',File,_11308,_11314,_11290,_11292),open(File,read,Stream),get_char(Stream,Char),close(Stream),delete_file(File).
pl_io_test_get_char_2_5(X,_11488,_11488,_11470,_11470):-get_char(user_output,X).
pl_io_test_get_char_2_6(_11750,_11862,_11608,_11634):-pl_io_create_temp_file('qwerty',File,_11750,_11752,_11608,_11610),open(File,read,Stream),_11752=_11778,_11610=_11616,_11778=_11790,(((get_char(Stream,p),_11790=_11802),_11616=_11622,_11802=_11814),((close(Stream),_11814=_11826),_11622=_11628,_11826=_11838),(delete_file(File),_11838=_11850),_11628=_11634,_11850=_11862;((close(Stream),_11790=_11874),_11616=_11640,_11874=_11886),((delete_file(File),_11886=_11898),_11640=_11646,_11898=_11910),(fail,_11910=_11922),_11646=_11634,_11922=_11862).
pl_io_throws_exception(test_get_char_2_5,_12322,_12322,_12304,_12304).
pl_io_test_put_char_1_1(_12434,_12434,_12416,_12416):-put_char(t).
pl_io_test_put_char_2_1(Codes,_12606,_12606,_12588,_12588):-tmp_file('test',File),open(File,write,Stream),put_char(Stream,t),close(Stream),read_file_to_codes(File,Codes,[]),delete_file(File).
pl_io_test_put_char_2_2(C,_12720,_12720,_12702,_12702):-put_char(my_file,C).
pl_io_test_put_char_2_3(Stream,C,_12834,_12834,_12816,_12816):-put_char(Stream,C).
pl_io_test_put_char_2_4(Codes,_13010,_13010,_12992,_12992):-tmp_file('test',File),open(File,write,Stream),put_char(Stream,'A'),close(Stream),read_file_to_codes(File,Codes,[]),delete_file(File).
pl_io_throws_exception(test_put_char_2_2,_13116,_13116,_13098,_13098).
pl_io_throws_exception(test_put_char_2_3,_13222,_13222,_13204,_13204).
pl_io_create_temp_file(Text,File,_13372,_13372,_13354,_13354):-tmp_file('test',File),open(File,write,Stream),write(Stream,Text),close(Stream).
