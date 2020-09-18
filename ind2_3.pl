inList([H|_],B):-B is H, true.
inList([_|T],B):-inList(T,B).


prost(A):-A < 2, !, false.
prost(A):-A < 4,!.
prost(A):-prost(A,2).
prost(A,B):-B is A div 2 + 1.
prost(A,B):- Ost is A mod B, not(Ost is 0), B1 is B + 1, prost(A,B1).

allProstDel(1,[]):-!.
allProstDel(2,[]):-!.
allProstDel(A,X):-allProstDel(A,[],2,X).
allProstDel(A,Del,I,Del):- I is A div 2 + 1 .
allProstDel(A,Del,I,X):- F is A mod I, F is 0,prost(I), I1 is I+1,  allProstDel(A,[I|Del],I1,X).
allProstDel(A,Del,I,X):- I1 is I+1, allProstDel(A,Del,I1,X).


nonPowr(A,B,X):- nonPowr(A,B,A,X).
nonPowr(_,[],NoPow,NoPow):-!.
nonPowr(A,[H|T],NoPow,X):- not(inList(NoPow,H)), nonPowr(A,T,[H|NoPow],X).
nonPowr(A,[_|T],NoPow,X):-nonPowr(A,T,NoPow,X).

allProstDelList(A,X):- allProstDelList(A,[],X).
allProstDelList([],X,X):-!.
allProstDelList([H|T],Del,X):- allProstDel(H,Del1), nonPowr(Del,Del1,Del2), allProstDelList(T,Del2,X).
allProstDelList([_|T],Del,X):-  allProstDelList(T,Del,X).

readList(A,N):- readList(A,[],N).
readList(A,A,0):-!.
readList(A,B,N):-read(H), N1 is N-1, readList(A, [H|B], N1).

writeList([]):-!.
writeList([H|T]):-write(H),write(","), writeList(T).

prog:-writeln("input len list"),read(N),writeln("input list"),
readList(A,N),writeln("All prost del:"),
allProstDelList(A,X),writeList(X).
