:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).

% Proximity relation matrix inducing a fully connected transitive component
middle ~ old = 0.5.
young ~ middle = 0.62.

% Scaled Database Facts (N = 10)
middle(paul).
old(mary).

shareholder(paul, google).
shareholder(paul, greek_bonds).
shareholder(mary, google).

stock_up(google) with 0.9.
stock_up(greek_bonds) with 0.2.
shareholder(paul, stock_1).
stock_up(stock_1) with 0.2.
shareholder(paul, stock_2).
stock_up(stock_2) with 0.2.
shareholder(paul, stock_3).
stock_up(stock_3) with 0.2.
shareholder(paul, stock_4).
stock_up(stock_4) with 0.2.
shareholder(paul, stock_5).
stock_up(stock_5) with 0.2.
shareholder(paul, stock_6).
stock_up(stock_6) with 0.2.
shareholder(paul, stock_7).
stock_up(stock_7) with 0.2.
shareholder(paul, stock_8).
stock_up(stock_8) with 0.2.
shareholder(paul, stock_9).
stock_up(stock_9) with 0.2.
shareholder(paul, stock_10).
stock_up(stock_10) with 0.2.

% Core Rules
keep_stock(Name, Stock) :- shareholder(Name, Stock), (stock_up(Stock); young(Name)).
sell_stock(Name, Stock) :- shareholder(Name, Stock), stock_down(Stock), old(Name).

% RQ2 Target Goal: Nested Implication Structure (Depth K = 0)
bench :- findall(S,
     keep_stock(paul, S),
    Answers), length(Answers, L), write('Number of answers: '), writeln(L), setenv('Answers', L).