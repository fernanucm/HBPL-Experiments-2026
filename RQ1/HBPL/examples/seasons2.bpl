:- transitivity(product).

% PROXIMITY EQUATIONS

spring ~ autumn = 0.7.
spring ~ summer = 0.5.
autumn ~ winter = 0.5.

% FACT

autumn.

% RULES  
warm :- summer.     
warm :- sunny.  
rainy :- spring. 
happy :- warm.
sunny :- fail.

