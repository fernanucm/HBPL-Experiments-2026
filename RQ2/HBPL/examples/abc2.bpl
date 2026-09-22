:- weak_unification(a1). 
% Unification by similarity

/*************
Unification by similarity (Sessa's unification algorithm) gives a wrong
answer for this example. The reason is because the set of PROXIMITY EQUATIONS
are specifying a PROXIMITY relation and Sessa's unification algorithm was
designed to work with SIMILARITY relations only.

You need to replace the initial directive with

:- weak_unification(a3).    (Unification by proximity)

to obtain the right answer.
*************/

% PROXIMITY EQUATIONS  
	white~grey = 0.8. 
	grey~black = 0.75. 


% FACTS  
	complementary_color(white,black). 
	 
% GOAL
goal :- complementary_color(grey, grey).