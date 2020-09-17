inList([H|_],B):-B is H, true.
inList([_|T],B):-inList(T,B).

allDel(A,X):-allDel(A,[],2,X).
allDel(A,Del,I,Del):- I is A div 2 + 1 .
allDel(A,Del,I,X):- F is A mod I, F is 0, I1 is I+1, allDel(A,[I|Del],I1,X).
allDel(A,Del,I,X):- I1 is I+1, allDel(A,Del,I1,X).
