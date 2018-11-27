:- use_rendering(sudoku).
:- use_module(library(clpfd)).

sudoku(Rows) :-
        length(Rows, 9),
    	lines(Rows),
        transpose(Rows, Columns),
    	lines(Columns),
    	Rows = [A,B,C,D,E,F,G,H,I],
        blocks(A, B, C), 
        blocks(D, E, F), 
        blocks(G, H, I).

lines([A,B,C,D,E,F,G,H,I]):-
    	A ins 1..9,
    	length(A, 9),
		all_distinct(A),
    	B ins 1..9,
    	length(B, 9),
		all_distinct(B),
        C ins 1..9,
    	length(C, 9),
		all_distinct(C),
        D ins 1..9,
    	length(D, 9),
		all_distinct(D),
        E ins 1..9,
    	length(E, 9),
		all_distinct(E),
        F ins 1..9,
    	length(F, 9),
		all_distinct(F),
        G ins 1..9,
    	length(G, 9),
		all_distinct(G),
        H ins 1..9,
    	length(H, 9),
		all_distinct(H),
        I ins 1..9,
        length(I, 9),
		all_distinct(I).

blocks([], [], []).
blocks([A,B,C|T1], [D,E,F|T2], [G,H,I|T3]) :-
        all_distinct([A,B,C,D,E,F,G,H,I]),
        blocks(T1, T2, T3).

/* Query --> Rows=[[_,_,_, _,_,_, _,_,_],
[_,_,_, _,_,3, _,8,5],
[_,_,1, _,2,_, _,_,_],
[_,_,_, 5,_,7, _,_,_],
[_,_,4, _,_,_, 1,_,_],
[_,9,_, _,_,_, _,_,_],
[5,_,_, _,_,_, _,7,3],
[_,_,2, _,1,_, _,_,_],
[_,_,_, _,4,_, _,_,9]], sudoku(Rows).
*/