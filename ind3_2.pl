read_str(A,N,Flag):-get0(X),r_str(X,A,[],N,0,Flag).
r_str(-1,A,A,N,N,1):-!.
r_str(10,A,A,N,N,0):-!.
r_str(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1,Flag).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

read_list_str(List):-read_str(A,N,Flag), poisk_i_zamen(A,A1),read_list_str([A1],List,Flag).
read_list_str(List,List,1):-!.
read_list_str(Cur_list,List,0):-
	read_str(A,N,Flag), poisk_i_zamen(A,A1),append(Cur_list,[A1],C_l),read_list_str(C_l,List,Flag).

write_str([]):-!.
write_str([H|Tail]):-put(H),write_str(Tail).

dlin_str(S,N):-dlin_str(S,N,0),!.
dlin_str([],N,N):-!.
dlin_str([_|T],N,I):-I1 is I + 1, dlin_str(T,N,I1),!.

slov(48,1,X):-atom_codes(ноль,X).
slov(49,1,X):-atom_codes(один,X).
slov(50,1,X):-atom_codes(два,X).
slov(51,1,X):-atom_codes(три,X).
slov(52,1,X):-atom_codes(четыре,X).
slov(53,1,X):-atom_codes(п€ть,X).
slov(54,1,X):-atom_codes(шесть,X).
slov(55,1,X):-atom_codes(семь,X).
slov(56,1,X):-atom_codes(восемь,X).
slov(57,1,X):-atom_codes(дев€ть,X).

slov([49,48],2,X):-atom_codes(дес€ть,X).
slov([49,49],2,X):-atom_codes(одиннадцать,X).
slov([49,50],2,X):-atom_codes(двенадцать,X).
slov([49,51],2,X):-atom_codes(тринадцать,X).
slov([49,52],2,X):-atom_codes(четырнадцать,X).
slov([49,53],2,X):-atom_codes(п€тнадцать,X).
slov([49,54],2,X):-atom_codes(шестнадцать,X).
slov([49,55],2,X):-atom_codes(семнадцать,X).
slov([49,56],2,X):-atom_codes(восенадцать,X).
slov([49,57],2,X):-atom_codes(дев€тнадцать,X).

slov(48,2,[]).
slov(50,2,X):-atom_codes(двадцать,X).
slov(51,2,X):-atom_codes(тридцать,X).
slov(52,2,X):-atom_codes(сорок,X).
slov(53,2,X):-atom_codes(п€тьдес€т,X).
slov(54,2,X):-atom_codes(шестьдес€т,X).
slov(55,2,X):-atom_codes(семьдес€т,X).
slov(56,2,X):-atom_codes(восемьдес€т,X).
slov(57,2,X):-atom_codes(дев€носто,X).

slov(48,3,[]).
slov(49,3,X):-atom_codes(сто,X).
slov(50,3,X):-atom_codes(двести,X).
slov(51,3,X):-atom_codes(триста,X).
slov(52,3,X):-atom_codes(четыреста,X).
slov(53,3,X):-atom_codes(п€тьсот,X).
slov(54,3,X):-atom_codes(шестьсот,X).
slov(55,3,X):-atom_codes(семьсот,X).
slov(56,3,X):-atom_codes(восемьсот,X).
slov(57,3,X):-atom_codes(дев€тьсот,X).

slov(48,4,[]).
slov(49,4,X):-atom_codes(тыс€ча,X).
slov(50,4,X):-atom_codes(две,X1), atom_codes(тыс€чи, X2), append(X1, [32|X2], X).
slov(51,4,X):-atom_codes(три,X1), atom_codes(тыс€чи, X2), append(X1, [32|X2], X).
slov(52,4,X):-atom_codes(четыре,X1), atom_codes(тыс€чи, X2), append(X1, [32|X2], X).
slov(53,4,X):-atom_codes(п€ть,X1), atom_codes(тыс€ч, X2), append(X1, [32|X2], X).
slov(54,4,X):-atom_codes(шесть,X1), atom_codes(тыс€ч, X2), append(X1, [32|X2], X).
slov(55,4,X):-atom_codes(семь,X1), atom_codes(тыс€ч, X2), append(X1, [32|X2], X).
slov(56,4,X):-atom_codes(восемь,X1), atom_codes(тыс€ч, X2), append(X1, [32|X2], X).
slov(57,4,X):-atom_codes(дев€ть,X1), atom_codes(тыс€ч, X2), append(X1, [32|X2], X).

zamen(X,S):-zamen(X,S,[]).
zamen([],S,S):-!.
zamen([H|T],S,S1):- dlin_str([H|T],N), N is 2, H is 49,  slov([H|T],N,Pris), append(S1, [32|Pris] ,S2), zamen([],S,S2), !.
zamen([H|T],S,S1):- dlin_str([H|T],N), slov(H,N,Pris), append(S1, [32|Pris] ,S2), zamen(T,S,S2),!.


poisk_i_zamen(S,X):-poisk_i_zamen(S,X,[],[]).
poisk_i_zamen([],X,_,X):-!.
poisk_i_zamen([H|T],X,Ch,Left):-H is 32, zamen(Ch,Ch1), append(Left,Ch1, Left1), append(Left1,[32],Left2), poisk_i_zamen(T,X,[],Left2),!.
poisk_i_zamen([H|T],X,Ch,Left):-H>47, H<58, append(Ch,[H],Ch1), poisk_i_zamen(T,X,Ch1,Left),!.
poisk_i_zamen([H|T],X,Ch,Left):-append(Left,Ch,Left1), append(Left1,[H],Left2),  poisk_i_zamen(T,X,[],Left2),!.


pr:-	see('C:/Users/elezb/github/SwiProlog/in.txt'),read_list_str(List),seen,
		tell('C:/Users/elezb/github/SwiProlog/out.txt'), write_list_str(List),told.
