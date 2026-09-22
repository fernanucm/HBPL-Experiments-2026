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

% Chained operational rules (H = 20)
invest_1(Name, Stock) :- 
    shareholder(Name, stock_1) => 
    (stock_up(stock_1) with 0.6) => 
    invest_2(Name, Stock).

invest_2(Name, Stock) :- 
    shareholder(Name, stock_2) => 
    (stock_up(stock_2) with 0.6) => 
    invest_3(Name, Stock).

invest_3(Name, Stock) :- 
    shareholder(Name, stock_3) => 
    (stock_up(stock_3) with 0.7) => 
    invest_4(Name, Stock).

invest_4(Name, Stock) :- 
    shareholder(Name, stock_4) => 
    (stock_up(stock_4) with 0.7) => 
    invest_5(Name, Stock).

invest_5(Name, Stock) :- 
    shareholder(Name, stock_5) => 
    (stock_up(stock_5) with 0.5) => 
    invest_6(Name, Stock).

invest_6(Name, Stock) :- 
    shareholder(Name, stock_6) => 
    (stock_up(stock_6) with 0.6) => 
    invest_7(Name, Stock).

invest_7(Name, Stock) :- 
    shareholder(Name, stock_7) => 
    (stock_up(stock_7) with 0.6) => 
    invest_8(Name, Stock).

invest_8(Name, Stock) :- 
    shareholder(Name, stock_8) => 
    (stock_up(stock_8) with 0.7) => 
    invest_9(Name, Stock).

invest_9(Name, Stock) :- 
    shareholder(Name, stock_9) => 
    (stock_up(stock_9) with 0.7) => 
    invest_10(Name, Stock).

invest_10(Name, Stock) :- 
    shareholder(Name, stock_10) => 
    (stock_up(stock_10) with 0.5) => 
    invest_11(Name, Stock).

invest_11(Name, Stock) :- 
    shareholder(Name, stock_11) => 
    (stock_up(stock_11) with 0.6) => 
    invest_12(Name, Stock).

invest_12(Name, Stock) :- 
    shareholder(Name, stock_12) => 
    (stock_up(stock_12) with 0.6) => 
    invest_13(Name, Stock).

invest_13(Name, Stock) :- 
    shareholder(Name, stock_13) => 
    (stock_up(stock_13) with 0.7) => 
    invest_14(Name, Stock).

invest_14(Name, Stock) :- 
    shareholder(Name, stock_14) => 
    (stock_up(stock_14) with 0.7) => 
    invest_15(Name, Stock).

invest_15(Name, Stock) :- 
    shareholder(Name, stock_15) => 
    (stock_up(stock_15) with 0.5) => 
    invest_16(Name, Stock).

invest_16(Name, Stock) :- 
    shareholder(Name, stock_16) => 
    (stock_up(stock_16) with 0.6) => 
    invest_17(Name, Stock).

invest_17(Name, Stock) :- 
    shareholder(Name, stock_17) => 
    (stock_up(stock_17) with 0.6) => 
    invest_18(Name, Stock).

invest_18(Name, Stock) :- 
    shareholder(Name, stock_18) => 
    (stock_up(stock_18) with 0.7) => 
    invest_19(Name, Stock).

invest_19(Name, Stock) :- 
    shareholder(Name, stock_19) => 
    (stock_up(stock_19) with 0.7) => 
    invest_20(Name, Stock).

invest_20(Name, Stock) :- 
    shareholder(Name, stock_20) => 
    (stock_up(stock_20) with 0.5) => 
    keep_stock(Name, Stock).

% RQ2 Target Goal
bench :- findall(S,
         invest(paul, S),
         Answers), length(Answers, L), write('Number of answers: '), writeln(L), setenv('Answers', L).