:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).

% Proximity relation matrix inducing a fully connected transitive component
middle ~ old = 0.5.
young ~ middle = 0.62.

% Scaled Database Facts (N = 0)
middle(paul).
old(mary).

shareholder(paul, google).
shareholder(paul, greek_bonds).
shareholder(mary, google).

stock_up(google) with 0.9.
stock_up(greek_bonds) with 0.2.

% Core Rules
keep_stock(Name, Stock) :- shareholder(Name, Stock), (stock_up(Stock); young(Name)).
sell_stock(Name, Stock) :- shareholder(Name, Stock), stock_down(Stock), old(Name).

% Entry point for hypothetical rules
invest(Name, Stock) :- invest_1(Name, Stock).

% Chained operational rules (H = 1)
invest_1(Name, Stock) :- 
    shareholder(Name, stock_1) => 
    (stock_up(stock_1) with 0.6) => 
    keep_stock(Name, Stock).

% RQ2 Target Goal
bench :- findall(S,
         invest(paul, S),
         Answers), length(Answers, L), write('Number of answers: '), writeln(L), setenv('Answers', L).