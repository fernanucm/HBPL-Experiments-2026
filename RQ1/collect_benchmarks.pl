% Execute with SWI-Prolog

:- multifile(data/8).
:- dynamic(last_data/1).

% main(+Type)
%   Type \in {classic, hypothetical}
main(Type) :- 
  (memberchk(Type, [classic, hypothetical]) -> true ;
    writeln('ERROR: Unsupported type.\n\n'), fail),
  locale_create(Locale, default, [ decimal_point('.'), thousands_sep(','), grouping([repeat(3)]) ]), 
  set_locale(Locale),
  data_files(DataFiles),
  consult(DataFiles),
  tex_filename(Type, LaTeXFile),
  open(LaTeXFile, write, Stream, []),
  loop(Type, Stream),
  close(Stream).
  
loop(Type, Stream) :-
  consult(['benchmarks/benchmarks']),
  findall(Benchmark, benchmark(Benchmark, Type), Benchmarks),
  member(Benchmark, Benchmarks),
  benchmark_texname(Benchmark, BenchmarkTeX),
  benchmark_is_type(Type, Benchmark),
  writeln(        '       \\hline'),
  writeln(Stream, '       \\hline'),
  type_lines(Type, Lines),
  format(        '       \\multirow{~d}{*}{~a}\n ', [Lines,BenchmarkTeX]),
  format(Stream, '       \\multirow{~d}{*}{~a}\n ', [Lines,BenchmarkTeX]),
  (Type == classic ->
     Configurations = [false, true]
   ; Configurations = [meta1, meta2, meta3, hbpl]),
  member(Configuration, Configurations),
  data(Configuration, Benchmark, RTime, CTime, I, _G, _L, _H),
  DiffTime is CTime-RTime,
  Data = [Configuration, RTime, DiffTime, I],
  output_data(Stream, Data),
  set_last_data(Configuration, Data),
  fail.
loop(_Type, _Stream).

% type_lines(+Type, -Lines)
type_lines(classic, 2).
type_lines(hypothetical, 4).

% tex_filename(+Type, -LaTeXFile)
tex_filename(Type, LaTeXFile) :-
  atomic_list_concat(['data/data_',Type,'.tex'], LaTeXFile).

benchmark_is_type(hypothetical, BenchmarkName) :-
  !,
  atom_concat('h',_,BenchmarkName).
benchmark_is_type(classic, BenchmarkName) :-
  !,
  \+ atom_concat('h',_,BenchmarkName).

output_data(Stream, Data) :-
  !,
  Data = [Configuration, CPUTime, DiffTime, I],
  output_overhead(Stream, Data),
  configuration_texname(Configuration, ConfigurationTexName),
  (Configuration == false -> EOL = '' ; EOL = '\\\\\n'),
  TexData = [ConfigurationTexName, CPUTime, DiffTime, I, EOL],
  format(        '       & ~a & ~3:f & ~3:f & ~:d ~a ', TexData),
  format(Stream, '       & ~a & ~3:f & ~3:f & ~:d ~a ', TexData).

output_overhead(Stream, [true, CPUTime, _DiffTime, _I]) :-
  last_data([false, LastCPUTime, _LastDiffTime, _LastI]),
  !,
  Overhead is 100*(CPUTime-LastCPUTime)/LastCPUTime,
  format(        '& \\multirow{~d}{*}{~2:f\\%} \\\\\n', [2,Overhead]),
  format(Stream, '& \\multirow{~d}{*}{~2:f\\%} \\\\\n', [2,Overhead]).
output_overhead(_Stream, _Data).

set_last_data(false, Data) :-
  !,
  retractall(last_data(_)),
  assertz(last_data(Data)).
set_last_data(true, _Data).

data_files(['data/data_hbpl_overhead_false.pl', 
            'data/data_hbpl_overhead_true.pl',
            'data/data_meta1.pl',
            'data/data_meta2.pl',
            'data/data_meta3.pl',
            'data/data_hbpl.pl'
            ]).
  
% benchmark_name(+Benchmark, -BenchmarkTeX)
benchmark_texname(Benchmark, BenchmarkTeX) :-
  atom_concat(BenchmarkName, '.pl', Benchmark),
  atomic_list_concat(['\\textit{',BenchmarkName,'}'], BenchmarkTeX).

configuration_texname(true,  'Enabled').
configuration_texname(false, 'Disabled').
configuration_texname(meta1, '$meta1$').
configuration_texname(meta2, '$meta2$').
configuration_texname(meta3, '$meta3$').
configuration_texname(hbpl,  '$hbpl$').


