:-style_check([-singleton,- (discontiguous)]).
:-abolish(t_norm/2).
:-directive(wn_connect,[]).
t_norm(~,min).

sim(X,Y,D) :- sim(X,Y,_B,D).


gEqThan(_2968,_2968,1.0).
lEqThan(_3084,_3084,1.0).
frel1(_3206,_3206,1.0).
frel2(_3328,_3328,1.0).
frel3(_3450,_3450,1.0).

sim(apple,cake,1,0.5).
sim(cake,apple,1,0.5).
sim(apple,pasta,1,0.4444444444444444).
sim(pasta,apple,1,0.4444444444444444).
sim(cake,pasta,1,0.35294117647058826).
sim(pasta,cake,1,0.35294117647058826).
sim(apple,salad,1,0.4444444444444444).
sim(salad,apple,1,0.4444444444444444).
sim(cake,salad,1,0.35294117647058826).
sim(salad,cake,1,0.35294117647058826).
sim(pasta,salad,1,0.8888888888888888).
sim(salad,pasta,1,0.8888888888888888).
sim(apple,spaghetti,1,0.42105263157894735).
sim(spaghetti,apple,1,0.42105263157894735).
sim(cake,spaghetti,1,0.3333333333333333).
sim(spaghetti,cake,1,0.3333333333333333).
sim(pasta,spaghetti,1,0.9473684210526315).
sim(spaghetti,pasta,1,0.9473684210526315).
sim(salad,spaghetti,1,0.8421052631578947).
sim(spaghetti,salad,1,0.8421052631578947).
sim(apple,steak,1,0.6666666666666666).
sim(steak,apple,1,0.6666666666666666).
sim(cake,steak,1,0.35294117647058826).
sim(steak,cake,1,0.35294117647058826).
sim(pasta,steak,1,0.4444444444444444).
sim(steak,pasta,1,0.4444444444444444).
sim(salad,steak,1,0.4444444444444444).
sim(steak,salad,1,0.4444444444444444).
sim(spaghetti,steak,1,0.42105263157894735).
sim(steak,spaghetti,1,0.42105263157894735).
sim(dessert,meal,0,0.8235294117647058).
sim(meal,dessert,0,0.8235294117647058).

p_meals(_5874,_694,_700,_690):-unify_arguments_a3([[_5874,[salad,pasta,spaghetti,steak,cake,apple],_694,_700,_690]]).
p_first_course(_6426,_762,_768,_758):-unify_arguments_a3([[_6426,spaghetti,_762,_768,_758]]).
p_first_course(_6978,_830,_836,_826):-unify_arguments_a3([[_6978,salad,_830,_836,_826]]).
p_second_course(_7536,_898,_904,_894):-unify_arguments_a3([[_7536,steak,_898,_904,_894]]).
p_dessert(_8084,_966,_972,_962):-unify_arguments_a3([[_8084,cake,_966,_972,_962]]).
p_meal(_8442,_8010,_8012,_8014):-sat_a3([meal:0,dessert:0],_8010,_8490),unify_arguments_a3([[_8442,cake,_8490,_8012,_8448]]),degree_composition([1.0,_8448,0.8235294117647058],_8014).
p_dessert(_9112,_1034,_1040,_1030):-unify_arguments_a3([[_9112,apple,_1034,_1040,_1030]]).
p_meal(_9470,_9038,_9040,_9042):-sat_a3([meal:0,dessert:0],_9038,_9518),unify_arguments_a3([[_9470,apple,_9518,_9040,_9476]]),degree_composition([1.0,_9476,0.8235294117647058],_9042).
p_dessert(_10140,_1102,_1108,_1098):-unify_arguments_a3([[_10140,coffe,_1102,_1108,_1098]]).
p_meal(_10498,_10066,_10068,_10070):-sat_a3([meal:0,dessert:0],_10066,_10546),unify_arguments_a3([[_10498,coffe,_10546,_10068,_10504]]),degree_composition([1.0,_10504,0.8235294117647058],_10070).
p_meal(_13288,_13294,_13300,_1280,_1226,_1276):-unify_arguments_a3([[_13288,First,_1280,_13366,_13306],[_13294,Second,_13366,_13402,_13312],[_13300,Dessert,_13402,_1190,_13318]]),p_first_course(First,_1190,_1192,_1166),p_first_course(Second,_1192,_1206,_1174),p_dessert(Dessert,_1206,_1226,_1182),degree_composition([1.0,_1182,_1174,_1166,_13306,_13312,_13318],_1276).
p_dessert(_14062,_14068,_14074,_13082,_13084,_13086):-sat_a3([dessert:0,meal:0],_13082,_14134),unify_arguments_a3([[_14062,First,_14134,_14140,_14080],[_14068,Second,_14140,_14176,_14086],[_14074,Dessert,_14176,_13098,_14092]]),p_first_course(First,_13098,_13100,_13102),p_first_course(Second,_13100,_13116,_13118),p_dessert(Dessert,_13116,_13084,_13128),degree_composition([1.0,_13128,_13118,_13102,_14080,_14086,_14092,0.8235294117647058],_13086).
