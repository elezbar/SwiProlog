
sumdel(2,1).
sumdel(A,0):- A<2,!,false.
sumdel(A,X):- sumdel(A,1,0,X).
sumdel(A,B,X,X):- B > A div 2,!.
sumdel(A,B,N,X):- F is A mod B, F is 0, N1 is N + B, B1 is B + 1, sumdel(A,B1,N1,X),!.
sumdel(A,B,N,X):- B1 is B + 1, sumdel(A,B1,N,X),!.

%Получение избыточного числа по номеру
getIzb(1,12).
getIzb(N,X):-getIzb(N,13,1,12,X).
getIzb(N,_,N,X,X):-!.
getIzb(N,I,N1,_,X):-sumdel(I,B), B > I, I1 is I + 1, N2 is N1 + 1, getIzb(N,I1,N2,I,X),!.
getIzb(N,I,N1,X1,X):-I1 is I + 1, getIzb(N,I1,N1,X1,X),!.

%Получение номера максимально приближенного избыточного числа к данному
getMaxIzbInd(A,0):- A < 12,!.
getMaxIzbInd(12,1):- !.
getMaxIzbInd(A,X):- getMaxIzbInd(A,1,X).
getMaxIzbInd(A,B,X):- getIzb(B,N), N > A, X is B - 1,!.
getMaxIzbInd(A,B,X):- B1 is B +1, getMaxIzbInd(A,B1,X),!.
