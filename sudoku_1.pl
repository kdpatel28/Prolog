:- use_module(library(clpfd)).

sudoku(Rows) :-
    flatten(Rows, Tmp), Tmp ins 1..9,
    transpose(Rows, Columns),
    blocks(Rows, Blocks),
    maplist(all_distinct, Rows),
    maplist(all_distinct, Columns),
    maplist(all_distinct, Blocks),
    maplist(label, Rows).

pretty_print([]).
pretty_print([H|T]) :-
	write(H),nl,
	pretty_print(T).

blocks([A,B,C,D,E,F,G,H,I], Blocks) :-
    blocks(A,B,C,Block1), blocks(D,E,F,Block2), blocks(G,H,I,Block3),
    append([Block1, Block2, Block3], Blocks).

blocks([], [], [], []).
blocks([A,B,C|Bs1],[D,E,F|Bs2],[G,H,I|Bs3], [Block|Blocks]) :-
    Block = [A,B,C,D,E,F,G,H,I],
    blocks(Bs1, Bs2, Bs3, Blocks).


run :- 
Rows = [[_,_,_, _,_,_, _,_,_],
[_,_,_, _,_,3, _,8,5],
[_,_,1, _,2,_, _,_,_],
[_,_,_, 5,_,7, _,_,_],
[_,_,4, _,_,_, 1,_,_],
[_,9,_, _,_,_, _,_,_],
[5,_,_, _,_,_, _,7,3],
[_,_,2, _,1,_, _,_,_],
[_,_,_, _,4,_, _,_,9]],  sudoku(Rows),pretty_print(Rows).

% Query --> run.

