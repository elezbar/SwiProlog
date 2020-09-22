readList(A,N):- readList(A,[],N).
readList(A,A,0):-!.
readList(A,B,N):-read(H), N1 is N-1, readList(A, [H|B], N1).

writeList([]):-!.
writeList([H|T]):-write(H),write(","), writeList(T).

spisindex(A,X,N):-spisindex(A,X,0,[],N).
spisindex([],_,_,S,S):-!.
spisindex([H|T],H,I,S,N):-I1 is I + 1, append(S,[I],S1), spisindex(T,H,I1,S1,N),!.
spisindex([_|T],X,I,S,N):-I1 is I+1, spisindex(T,X,I1,S,N),!.

kolpowt(A,N,X):-kolpowt(A,N,0,X).
kolpowt([],_,X,X):-!.
kolpowt([H|T],H,I,X):-I1 is I+1, kolpowt(T,H,I1,X),!.
kolpowt([_|T],N,I,X):-kolpowt(T,N,I,X).

maxpowt(A,X):-maxpowt(A,A,0,X).
maxpowt(_,[],N,N):-!.
maxpowt(A,[H|T],N,X):-kolpowt(A,H,X1), kolpowt(A,N,X2), X1>X2, maxpowt(A,T,X1,X).
maxpowt(A,[_|T],N,X):-kolpowt(A,T,N,X).
