%% PROXIMITY EQUATIONS            
nothing ~ a_little = 0.5.         
nothing ~ so_much = 0.1.          
a_little ~ so_much = 0.4.         
a_little ~ very_much = 0.2.       
so_much ~ very_much = 0.6.  
      
%% FACTS
likes(john, whiskey, a_little).
likes(mary, whiskey, very_much).
likes(peter, whiskey, so_much).
likes(paul, whiskey, nothing).

%% RULES                      
buy(X,P):-likes(X, P, very_much).
