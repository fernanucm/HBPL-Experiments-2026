:- hypothetical(true).

student(s1).
student(s2).
take(s1,c1).
grad(_168):-take(_168,c1),take(_168,c2).
p(_168):-student(_168),(take(_168,_224)=>grad(_168)).
