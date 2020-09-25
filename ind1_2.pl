
sumdel(2,1).
sumdel(A,0):- A<2,!,false.
sumdel(A,X):- sumdel(A,1,0,X).
sumdel(A,B,X,X):- B > A div 2,!.
sumdel(A,B,N,X):- F is A mod B, F is 0, N1 is N + B, B1 is B + 1, sumdel(A,B1,N1,X),!.
sumdel(A,B,N,X):- B1 is B + 1, sumdel(A,B1,N,X),!.

% Получение избыточного числа по номеру
getIzb(1,12).
getIzb(N,X):-getIzb(N,13,1,12,X).
getIzb(N,_,N,X,X):-!.
getIzb(N,I,N1,_,X):-sumdel(I,B), B > I, I1 is I + 1, N2 is N1 + 1, getIzb(N,I1,N2,I,X),!.
getIzb(N,I,N1,X1,X):-I1 is I + 1, getIzb(N,I1,N1,X1,X),!.

% Получение номера максимально приближенного избыточного числа к данному
getMaxIzbInd(A,0):- A < 12,!.
getMaxIzbInd(12,1):- !.
getMaxIzbInd(A,X):- getMaxIzbInd(A,1,X).
getMaxIzbInd(A,B,X):- getIzb(B,N), N > A, X is B - 1,!.
getMaxIzbInd(A,B,X):- B1 is B +1, getMaxIzbInd(A,B1,X),!.

% Проверка возможности составления числа из суммы двух избыточных
provSumIzb(A):- A < 24,!, false.
provSumIzb(A):- getMaxIzbInd(A,X), X1 is X - 1, provSumIzb(A,1,X1,X1),!.
provSumIzb(_,Low,High,Highmax):- Low > Highmax, High < 2,!,false.
provSumIzb(A,Low,High,Highmax):- Low > Highmax, High1 is High - 1,
                              provSumIzb(A,1,High1,Highmax),!.
provSumIzb(A,Low,High,_):- getIzb(Low,N1), getIzb(High,N2), A is N1 + N2,!.
provSumIzb(A,Low,High,Highmax):- Low < Highmax +1,Low1 is Low + 1, provSumIzb(A,Low1,High,Highmax),!.

%Подсчёт всех чисел, состоящий из суммы 2 избыточных.
kolvoIzb(X):- kolvoIzb(X,0,24).
kolvoIzb(K,K,200):-!.
kolvoIzb(X,K,I):- provSumIzb(I), I1 is I+1, K1 is K + 1, kolvoIzb(X,K1,I1),!.
kolvoIzb(X,K,I):-  I1 is I+1, kolvoIzb(X,K,I1),!.
