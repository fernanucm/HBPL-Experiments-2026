:- hypothetical(true).
:- weak_unification(a3).
:- indexing(false).

a with 0.3.
stock_up(google) with 0.9.

c :- (a with 0.4) => a.
