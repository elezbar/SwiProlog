inList([H|_],B):-B is H, true.
inList([_|T],B):-inList(T,B).

allDel(1,[]):-!.
allDel(2,[]):-!.
allDel(A,X):-allDel(A,[],2,X).
allDel(A,Del,I,Del):- I is A div 2 + 1 .
allDel(A,Del,I,X):- F is A mod I, F is 0, I1 is I+1, allDel(A,[I|Del],I1,X).
allDel(A,Del,I,X):- I1 is I+1, allDel(A,Del,I1,X).

nonPowr(A,B,X):- nonPowr(A,B,A,X).
nonPowr(_,[],NoPow,NoPow):-!.
nonPowr(A,[H|T],NoPow,X):- not(inList(NoPow,H)), nonPowr(A,T,[H|NoPow],X).
nonPowr(A,[_|T],NoPow,X):-nonPowr(A,T,NoPow,X).

allDelList(A,X):- allDelList(A,[],X).
allDelList([],X,X):-!.
allDelList([H|T],Del,X):- allDel(H,Del1), nonPowr(Del,Del1,Del2), allDelList(T,Del2,X).
allDelList([_|T],Del,X):-  allDelList(T,Del,X).

readList(A,N):- readList(A,[],N).
readList(A,A,0):-!.
readList(A,B,N):-read(H), N1 is N-1, readList(A, [H|B], N1).

writeList([]):-!.
writeList([H|T]):-write(H),write(","), writeList(T).

prog:-writeln("input len list"),read(N),writeln("input list"),
readList(A,N),writeln("All del:"),
allDelList(A,X),writeList(X).
