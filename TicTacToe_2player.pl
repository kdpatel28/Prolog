% To start game
start:-  write('Lets Play Tic Tac Toe'), nl, 
    write('Enter 1 to start with computer'), nl,
    write('Enter 2 to start 2 player game '), nl,
    read(X),
    ( X =:= 1 -> one ; 
    X=:=2 ->  two;
     write('Please enter Valid choice'), start).
    
    

% modules for one and two player
one :- how_to_play_1, strt([a,a,a,a,a,a,a,a,a]).
two :- how_to_play_2, play([a,a,a,a,a,a,a,a,a],x,0).

% guideline for both mode
how_to_play_2 :-
  write('Welcome to 2 player Tic tac toe. 
         Player 1 represented by X and Player 2 by 0. 
         Enter positions For Example to place your move in 5th place enter 5.'),
   nl,
  disp([1,2,3,4,5,6,7,8,9]).

how_to_play_1 :-
  write('Welcome to player Vs computer. You are x player. 
         Enter positions For Example to place your move in 5th place enter 5.'),
  nl,
  disp([1,2,3,4,5,6,7,8,9]).
  
% 2 players Logic
play(Brd,_,_) :- win(Brd, x), write('Player 1 '), write(' win!'), !.
play(Brd,_,_) :- win(Brd, o), write('Player 2 '), write(' win!'), !.
play(_,_,9) :- write('Game is Draw!'), nl,!.
play(Brd,x,MoveNum) :- write('Player 1 move:'), nl,read(N),
  xmove(Brd, N, NewBrd),
  disp(NewBrd), NewMoveNum is MoveNum + 1,
  play(NewBrd,o,NewMoveNum).
  
play(Brd,o,MoveNum) :- write('Player 2 move:'),nl,read(N),
  omove(Brd, N, NewBrd),
  disp(NewBrd),NewMoveNum is MoveNum + 1,
  play(NewBrd,x,NewMoveNum).


% player vs computer Logic
strt(Brd) :- win(Brd, x), write('Player 1 win!').
strt(Brd) :- win(Brd, o), write('Computer win!').
strt(Brd) :- write('Player 1 move:'),read(N),
  xmove(Brd, N, NewBrd),
  disp(NewBrd),
  write('Computer move:!'), nl,
  oplay(NewBrd, NewnewBrd),
  disp(NewnewBrd),
  strt(NewnewBrd).


can_x_win(Brd) :- omove1(Brd, x, NewBrd), win(NewBrd, x).

oplay(Brd,NewBrd) :-
  omove1(Brd, o, NewBrd),
  win(NewBrd, o),!.
oplay(Brd,NewBrd) :-
  omove1(Brd, o, NewBrd),
  not(can_x_win(NewBrd)).
oplay(Brd,NewBrd) :-
  omove1(Brd, o, NewBrd).
oplay(Brd,NewBrd) :-
  not(member(a,Brd)),!,
  write('Game is Draw!'), nl,
  NewBrd = Brd.


% check possible winning combinations 
win(Brd, Plyr) :- Brd = [Plyr,Plyr,Plyr,_,_,_,_,_,_];
                  Brd = [_,_,_,Plyr,Plyr,Plyr,_,_,_];
				  Brd = [_,_,_,_,_,_,Plyr,Plyr,Plyr];
				  Brd = [Plyr,_,_,Plyr,_,_,Plyr,_,_];
                  Brd = [_,Plyr,_,_,Plyr,_,_,Plyr,_];
		          Brd = [_,_,Plyr,_,_,Plyr,_,_,Plyr];
				  Brd = [Plyr,_,_,_,Plyr,_,_,_,Plyr];
				  Brd = [_,_,Plyr,_,Plyr,_,Plyr,_,_].

xmove([a,B,C,D,E,F,G,H,I], 1, [x,B,C,D,E,F,G,H,I]).
xmove([A,a,C,D,E,F,G,H,I], 2, [A,x,C,D,E,F,G,H,I]).
xmove([A,B,a,D,E,F,G,H,I], 3, [A,B,x,D,E,F,G,H,I]).
xmove([A,B,C,a,E,F,G,H,I], 4, [A,B,C,x,E,F,G,H,I]).
xmove([A,B,C,D,a,F,G,H,I], 5, [A,B,C,D,x,F,G,H,I]).
xmove([A,B,C,D,E,a,G,H,I], 6, [A,B,C,D,E,x,G,H,I]).
xmove([A,B,C,D,E,F,a,H,I], 7, [A,B,C,D,E,F,x,H,I]).
xmove([A,B,C,D,E,F,G,a,I], 8, [A,B,C,D,E,F,G,x,I]).
xmove([A,B,C,D,E,F,G,H,a], 9, [A,B,C,D,E,F,G,H,x]).
xmove(Brd, _, Brd) :- write('Illegal move. Please re-enter your move'), nl.

omove([a,B,C,D,E,F,G,H,I], 1, [o,B,C,D,E,F,G,H,I]).
omove([A,a,C,D,E,F,G,H,I], 2, [A,o,C,D,E,F,G,H,I]).
omove([A,B,a,D,E,F,G,H,I], 3, [A,B,o,D,E,F,G,H,I]).
omove([A,B,C,a,E,F,G,H,I], 4, [A,B,C,o,E,F,G,H,I]).
omove([A,B,C,D,a,F,G,H,I], 5, [A,B,C,D,o,F,G,H,I]).
omove([A,B,C,D,E,a,G,H,I], 6, [A,B,C,D,E,o,G,H,I]).
omove([A,B,C,D,E,F,a,H,I], 7, [A,B,C,D,E,F,o,H,I]).
omove([A,B,C,D,E,F,G,a,I], 8, [A,B,C,D,E,F,G,o,I]).
omove([A,B,C,D,E,F,G,H,a], 9, [A,B,C,D,E,F,G,H,o]).
omove(Brd, _, Brd) :- write('Illegal move. Please re-enter your move'), nl.

omove1([a,B,C,D,E,F,G,H,I], Plyr, [Plyr,B,C,D,E,F,G,H,I]).
omove1([A,a,C,D,E,F,G,H,I], Plyr, [A,Plyr,C,D,E,F,G,H,I]).
omove1([A,B,a,D,E,F,G,H,I], Plyr, [A,B,Plyr,D,E,F,G,H,I]).
omove1([A,B,C,a,E,F,G,H,I], Plyr, [A,B,C,Plyr,E,F,G,H,I]).
omove1([A,B,C,D,a,F,G,H,I], Plyr, [A,B,C,D,Plyr,F,G,H,I]).
omove1([A,B,C,D,E,a,G,H,I], Plyr, [A,B,C,D,E,Plyr,G,H,I]).
omove1([A,B,C,D,E,F,a,H,I], Plyr, [A,B,C,D,E,F,Plyr,H,I]).
omove1([A,B,C,D,E,F,G,a,I], Plyr, [A,B,C,D,E,F,G,Plyr,I]).
omove1([A,B,C,D,E,F,G,H,a], Plyr, [A,B,C,D,E,F,G,H,Plyr]).


disp([A,B,C,D,E,F,G,H,I]) :-
	write('|'),	write([A,B,C]),write('|'),nl,
	write('|'),	write([D,E,F]),write('|'),nl,	
    write('|'), write([G,H,I]),write('|'),nl,nl.


% Query to run code :- start.
