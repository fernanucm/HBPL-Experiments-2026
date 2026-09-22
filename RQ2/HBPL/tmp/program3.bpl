:- hypothetical(true).

student(s1).
take(s1,c1).
grad(_158):-take(_158,c1),take(_158,c2).
p(_158):-student(_158),(take(_158,_214)=>grad(_158)).
