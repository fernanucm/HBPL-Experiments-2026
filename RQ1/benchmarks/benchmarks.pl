% List of benchmark files to be checked
%
benchmark('deriv.pl',   classic).
benchmark('fact.pl',    classic).
benchmark('facttr.pl',  classic).
benchmark('fib.pl',     classic).
benchmark('nrev.pl',    classic).
benchmark('path.pl',    classic).
benchmark('primes.pl',  classic).
benchmark('qsort.pl',   classic).
benchmark('queens.pl',  classic).
benchmark('hderiv.pl',  hypothetical).
benchmark('hfact.pl',   hypothetical).
benchmark('hfacttr.pl', hypothetical).
benchmark('hnrev.pl',   hypothetical).
benchmark('hpath.pl',   hypothetical).
benchmark('hprimes.pl', hypothetical).
benchmark('hqsort.pl',  hypothetical).
benchmark('hqueens.pl', hypothetical).
benchmark('hypo1.pl',   hypothetical).
benchmark('hypo2.pl',   hypothetical).
benchmark('hypo3.pl',   hypothetical).
benchmark('hypo4.pl',   hypothetical).
benchmark('hypo5.pl',   hypothetical).
benchmark('hypo6.pl',   hypothetical).
benchmark('hypo7.pl',   hypothetical).

benchmarks_classic(Benchmarks) :-
  findall(Benchmark, benchmark(Benchmark, classic), Benchmarks).

benchmarks_hypothetical(Benchmarks) :-
  findall(Benchmark, benchmark(Benchmark, hypothetical), Benchmarks).
