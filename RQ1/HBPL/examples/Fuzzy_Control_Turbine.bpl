/*******************
SPECIFICATION OF A FUZZY LOGIC CONTROLLER which is an adaptation of 
the one described in Shalfield (2005).

R. Shalfield. 
"LPA-PROLOG: Flint reference". 
Technical report, Logic Programming Associates ltd (2005).

Once defined linguistic variables of temperature and pressure, the 
problem results in moving the throttle by large, medium or small 
amounts in the negative and positive directions.

The rules will cover all the possible combinations of temperature 
and pressure and give a resultant throttle change for each. An example 
of a rule specified by an expert is: 

If the temperature is cold and the pressure is weak then increase 
the throttle by a large amount. 

This rule has a direct translation to BPL code:
throttle(pos_large):- temperature(cold), pressure(weak).


We suggest to compare both solution in order to observe how natural is our codification of this problem.
*******************/


% DEFINING LINGUISTIC VARIABLES

%% Linguistic variable temperature
:-domain(temperature, 0, 500, celsiusDegree).
:-fuzzy_set(temperature, 
          [cold(0,0,110,165),cool(110,165,220),
           normal(165,220,275),warm(220,275,330),
           hot(275,330,500,500)]).

%% Linguistic variable preassure
:-domain(preassure, 0, 300,kpa).
:-fuzzy_set(preassure, 
            [weak(0,0,10,70),low(10,70,130),ok(70,130,190),
             strong(130,190,250),high(190,250,300,300)]).

%% Linguistic variable throttle
%% a negative value indicates that the throttle should be moved back 
%% and a positive value that it should be moved forward.
:-domain(throttle, -60, 60, rpm).
:-fuzzy_set(throttle, 
            [negative_large(-60,-60,-45,-30),negative_medium(-45,-30,-15),
            negative_small(-30,-15,0),zero(-15,0,15),positive_small(0,15,30), 
            positive_medium(15,30,45),positive_large(30,45,60,60)]).


%% RULES

%%cold
throttle(positive_large):-temperature(cold), preassure(weak).
throttle(positive_medium):-temperature(cold), preassure(low).
throttle(positive_small):-temperature(cold), preassure(ok).
throttle(negative_small):-temperature(cold), preassure(strong).
throttle(negative_medium):-temperature(cold), preassure(high).

%%cool
throttle(positive_large):-temperature(cool), preassure(weak).
throttle(positive_medium):-temperature(cool), preassure(low).
throttle(zero):-temperature(cool), preassure(ok).
throttle(negative_medium):-temperature(cool), preassure(strong).
throttle(negative_medium):-temperature(cool), preassure(high).

%%normal
throttle(positive_medium):-temperature(normal), preassure(weak).
throttle(positive_small):-temperature(normal), preassure(low).
throttle(zero):-temperature(normal), preassure(ok).
throttle(negative_small):-temperature(normal), preassure(strong).
throttle(negative_medium):-temperature(normal), preassure(high).

%%warm
throttle(positive_medium):-temperature(warm), preassure(weak).
throttle(positive_small):-temperature(warm), preassure(low).
throttle(negative_small):-temperature(warm), preassure(ok).
throttle(negative_medium):-temperature(warm), preassure(strong).
throttle(negative_large):-temperature(warm), preassure(high).

%%hot
throttle(positive_small):-temperature(hot), preassure(weak).
throttle(positive_small):-temperature(hot), preassure(low).
throttle(negative_medium):-temperature(hot), preassure(ok).
throttle(negative_large):-temperature(hot), preassure(strong).
throttle(negative_large):-temperature(hot), preassure(high).

%% FACTS
%% They model the inputs to the system

temperature(temperature#300).
preassure(preassure#150).

%% GOAL
%% Set of possible fuzzy moving action for the throttle. They should 
%% be defuzzified to obtain the crisp action.
%% 
%% NOTE that the high level implementation of Bousi~Prolog does not have
%% a "defuzzify" predicate yet.

goal(Action) :- throttle(Action).

