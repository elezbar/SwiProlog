inList([H|_],B):-B is H, true.
inList([_|T],B):-inList(T,B).
