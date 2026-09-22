% Benchmark files to be checked
%
%  Equations_Rules_Assumptions / Equations_Rules_HypoRules_Assumptions 
%

benchmarks_hypothetical(Benchmarks) :-
  getenv('Benchmark', AtomBenchmark),
  (member(AtomBenchmark, ['stocks-r'])
   ->  findall(Benchmark, benchmark(Benchmark, hypo_rules), Benchmarks)     % stocks-r
   ;   findall(Benchmark, benchmark(Benchmark, hypothetical), Benchmarks)). % stocks-n / stocks-s / stocks

% For stocks-n and stocks-s
benchmark(FileName,   hypothetical) :-
  getenv('Benchmark', AtomBenchmark),
  getenv('Equations', AtomEquations),
  getenv('Rules', AtomRules),
  getenv('Assumptions', AtomAssumptions),
  atomic_list_concat([AtomBenchmark, '_', AtomEquations, '_', AtomRules, '_',AtomAssumptions,'.bpl'], FileName).

% For stocks-r
benchmark(FileName,   hypo_rules) :-
  getenv('Benchmark', AtomBenchmark),
  getenv('Equations', AtomEquations),
  getenv('Rules', AtomRules),
  getenv('HypoRules', AtomHypoRules),
  getenv('Assumptions', AtomAssumptions),
  atomic_list_concat([AtomBenchmark, '_', AtomEquations, '_', AtomRules, '_', AtomHypoRules, '_',AtomAssumptions,'.bpl'], FileName).

