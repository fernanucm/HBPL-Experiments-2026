:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(transitivity,[no]).
:-directive(weak_unification,[a1]).
:-directive(filtering_warning,[false]).
t_norm(~,no).

sim(biography,essay,0.7).
sim(philosophy,essay,0.8).
sim(essay,biography,0.7).
sim(essay,philosophy,0.8).
sim(adventure,fantasy,0.7).
sim(fantasy,adventure,0.7).
sim(fantasy,sciFi,0.9).
sim(sciFi,fantasy,0.9).
gEqThan(_3360,_3360,1.0).
lEqThan(_3390,_3390,1.0).
frel1(_3420,_3420,1.0).
frel2(_3450,_3450,1.0).
frel3(_3480,_3480,1.0).

library_library([book(1,'Tintin','Herge',french,comic,easy,65),book(2,'Dune','F.P. Herbert',english,_3650,medium,345),book(3,'Kritik der reinen Vernunft','I. Kant',german,_3688,difficult,1011),book(4,'Beim Hauten der Zwiebel','G. Grass',german,_3726,medium,432)],_890,_892):-unify_arguments_a1([[_3650,sciFi,_3652],[_3688,philosophy,_3690],[_3726,biography,_3728]]),degree_composition([_890,_3652,_3690,_3728],_892).
library_my_member(_3944,[_3966|_3988],_972,_974):-unify_arguments_a1([[_3944,B,_3946],[_3966,B,_3968],[_3988,_,_3990]]),degree_composition([_972,_3946,_3968,_3990],_974).
library_my_member(_4300,[_4330|_4352],_1082,_1058):-unify_arguments_a1([[_4300,B,_4304],[_4330,_,_4332],[_4352,T,_4354]]),degree_composition([_1082,_4304,_4332,_4354],_1056),library_my_member(B,T,_1056,_1058).
library_getId(book(_4570,_4592,_4614,_4636,_4658,_4680,_4702),_4740,_1178,_1180):-unify_arguments_a1([[_4570,Id,_4572],[_4592,_Title,_4594],[_4614,_Author,_4616],[_4636,_Lang,_4638],[_4658,_Genre,_4660],[_4680,_VocLvl,_4682],[_4702,_Pages,_4704],[_4740,Id,_4742]]),degree_composition([_1178,_4572,_4594,_4616,_4638,_4660,_4682,_4704,_4742],_1180).
library_getTitle(book(_4980,_5002,_5024,_5046,_5068,_5090,_5112),_5150,_1272,_1274):-unify_arguments_a1([[_4980,_Id,_4982],[_5002,Title,_5004],[_5024,_Author,_5026],[_5046,_Lang,_5048],[_5068,_Genre,_5070],[_5090,_VocLvl,_5092],[_5112,_Pages,_5114],[_5150,Title,_5152]]),degree_composition([_1272,_4982,_5004,_5026,_5048,_5070,_5092,_5114,_5152],_1274).
library_getAuthor(book(_5390,_5412,_5434,_5456,_5478,_5500,_5522),_5560,_1366,_1368):-unify_arguments_a1([[_5390,_Id,_5392],[_5412,_Title,_5414],[_5434,Author,_5436],[_5456,_Lang,_5458],[_5478,_Genre,_5480],[_5500,_VocLvl,_5502],[_5522,_Pages,_5524],[_5560,Author,_5562]]),degree_composition([_1366,_5392,_5414,_5436,_5458,_5480,_5502,_5524,_5562],_1368).
library_getLanguage(book(_5800,_5822,_5844,_5866,_5888,_5910,_5932),_5970,_1460,_1462):-unify_arguments_a1([[_5800,_Id,_5802],[_5822,_Title,_5824],[_5844,_Author,_5846],[_5866,Lang,_5868],[_5888,_Genre,_5890],[_5910,_VocLvl,_5912],[_5932,_Pages,_5934],[_5970,Lang,_5972]]),degree_composition([_1460,_5802,_5824,_5846,_5868,_5890,_5912,_5934,_5972],_1462).
library_getGenre(book(_6210,_6232,_6254,_6276,_6298,_6320,_6342),_6380,_1554,_1556):-unify_arguments_a1([[_6210,_Id,_6212],[_6232,_Title,_6234],[_6254,_Author,_6256],[_6276,_Lang,_6278],[_6298,Genre,_6300],[_6320,_VocLvl,_6322],[_6342,_Pages,_6344],[_6380,Genre,_6382]]),degree_composition([_1554,_6212,_6234,_6256,_6278,_6300,_6322,_6344,_6382],_1556).
library_getVocLvl(book(_6620,_6642,_6664,_6686,_6708,_6730,_6752),_6790,_1648,_1650):-unify_arguments_a1([[_6620,_Id,_6622],[_6642,_Title,_6644],[_6664,_Author,_6666],[_6686,_Lang,_6688],[_6708,_Genre,_6710],[_6730,VocLvl,_6732],[_6752,_Pages,_6754],[_6790,VocLvl,_6792]]),degree_composition([_1648,_6622,_6644,_6666,_6688,_6710,_6732,_6754,_6792],_1650).
library_getPages(book(_7030,_7052,_7074,_7096,_7118,_7140,_7162),_7200,_1742,_1744):-unify_arguments_a1([[_7030,_Id,_7032],[_7052,_Title,_7054],[_7074,_Author,_7076],[_7096,_Lang,_7098],[_7118,_Genre,_7120],[_7140,_VocLvl,_7142],[_7162,Pages,_7164],[_7200,Pages,_7202]]),degree_composition([_1742,_7032,_7054,_7076,_7098,_7120,_7142,_7164,_7202],_1744).
library_guessRdrLvl(_7784,basic,_1894,_1846):-unify_arguments_a1([[_7784,B,_7788]]),degree_composition([_1894,_7788],_1830),library_getVocLvl(B,easy,_1830,_1832),library_getPages(B,N,_1832,_1846),N<50.
library_guessRdrLvl(_8324,intermediate,_2040,_1992):-unify_arguments_a1([[_8324,B,_8328]]),degree_composition([0.8,_2040,_8328],_1976),library_getVocLvl(B,easy,_1976,_1978),library_getPages(B,N,_1978,_1992),N>=50.
library_guessRdrLvl(_8652,basic,_2138,_2114):-unify_arguments_a1([[_8652,B,_8656]]),degree_composition([0.9,_2138,_8656],_2112),library_getGenre(B,children,_2112,_2114).
library_guessRdrLvl(_9186,proficiency,_2284,_2236):-unify_arguments_a1([[_9186,B,_9190]]),degree_composition([0.9,_2284,_9190],_2220),library_getVocLvl(B,difficult,_2220,_2222),library_getPages(B,N,_2222,_2236),N>=200.
library_guessRdrLvl(_9732,upper,_2430,_2382):-unify_arguments_a1([[_9732,B,_9736]]),degree_composition([0.8,_2430,_9736],_2366),library_getVocLvl(B,difficult,_2366,_2368),library_getPages(B,N,_2368,_2382),N<200.
library_guessRdrLvl(_11008,intermediate,_2528,_2504):-unify_arguments_a1([[_11008,B,_11046]]),degree_composition([0.8,_2528,_11046],_2502),library_getVocLvl(B,medium,_2502,_2504).
library_guessRdrLvl(_12480,upper,_2626,_2602):-unify_arguments_a1([[_12480,B,_12518]]),degree_composition([0.7,_2626,_12518],_2600),library_getVocLvl(B,medium,_2600,_2602).
library_search(_16954,_17038,_17134,_17242,_2890,_2776):-unify_arguments_a1([[_16954,Language,_16992],[_17038,Genre,_17076],[_17134,Level,_17172],[_17242,Id,_17280]]),degree_composition([_2890,_16992,_17076,_17172,_17280],_2706),library_library(Library,_2706,_2708),library_my_member(Book,Library,_2708,_2720),library_getLanguage(Book,Language,_2720,_2734),library_getGenre(Book,Genre,_2734,_2748),library_guessRdrLvl(Book,Level,_2748,_2762),library_getId(Book,Id,_2762,_2776).
