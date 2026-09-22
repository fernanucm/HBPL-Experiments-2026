% Library example adapted to BPL from 
%   R. Caballero, M. Rodriguez-Artalejo, C. A. Romero-Diaz, 
%   "A transformation-based implementation for CLP with qualification and proximity,"
%   Theory Pract. Log. Program. 14 (1) (2014) 1-63. doi:10.1017/S1471068412000014

% Directives
:-transitivity(no).
:-weak_unification(a1).
:-filtering_warning(false).

% Proximity relation Ss:
sciFi ~ fantasy = 0.9.
adventure ~ fantasy = 0.7.
essay ~ philosophy = 0.8.
essay ~ biography = 0.7.

% Book representation: book( ID, Title, Author, Lang, Genre, VocLvl, Pages ).
library([ book(1, 'Tintin', 'Herge', french, comic, easy, 65),
          book(2, 'Dune', 'F.P. Herbert', english, sciFi, medium, 345),
          book(3, 'Kritik der reinen Vernunft', 'I. Kant', german, philosophy, difficult, 1011),
          book(4, 'Beim Hauten der Zwiebel', 'G. Grass', german, biography, medium, 432) ]).

% Auxiliary predicate for computing list membership:
my_member(B, [B|_]).
my_member(B, [_|T]) :- my_member(B,T).

% Predicates for getting the explicit attributes of a given book:
getId(book(Id, _Title, _Author, _Lang, _Genre, _VocLvl, _Pages), Id).
getTitle(book(_Id, Title, _Author, _Lang, _Genre, _VocLvl, _Pages),  Title).
getAuthor(book(_Id, _Title, Author, _Lang, _Genre, _VocLvl, _Pages), Author).
getLanguage(book(_Id, _Title, _Author, Lang, _Genre, _VocLvl, _Pages), Lang).
getGenre(book(_Id, _Title, _Author, _Lang, Genre, _VocLvl, _Pages), Genre).
getVocLvl(book(_Id, _Title, _Author, _Lang, _Genre, VocLvl, _Pages), VocLvl).
getPages(book(_Id, _Title, _Author, _Lang, _Genre, _VocLvl, Pages), Pages).

% Function for guessing the reader level of a given book:
guessRdrLvl(B,basic)        :- getVocLvl(B, easy), getPages(B,N), N < 50.
guessRdrLvl(B,intermediate) :- getVocLvl(B, easy), getPages(B,N), N >= 50 with 0.8.
guessRdrLvl(B,basic)        :- getGenre(B, children) with 0.9.
guessRdrLvl(B,proficiency)  :- getVocLvl(B, difficult), getPages(B,N), N >= 200 with 0.9.
guessRdrLvl(B,upper)        :- getVocLvl(B, difficult), getPages(B,N), N < 200 with 0.8.
guessRdrLvl(B,intermediate) :- getVocLvl(B, medium) with 0.8.
guessRdrLvl(B,upper)        :- getVocLvl(B, medium) with 0.7.

% Function for answering a particular kind of user queries:
search(Language, Genre, Level, Id)  :- library(Library), my_member(Book, Library),
                                        getLanguage(Book, Language), getGenre(Book, Genre),
                                        guessRdrLvl(Book, Level), getId(Book, Id).
                                        
                                        
%% Goal:
% BPL> search(german,essay,intermediate,Id)

