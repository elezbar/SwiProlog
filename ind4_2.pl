
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).
pr7_7:- List is [_,_,_,_],
	(
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,fantic,_]);in_list(List,[_,dru,grey])
	);
	(	(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))

	);
	(
		(in_list(List,[_,fantic,white]);in_list(List,[_,fantic,grey]);
		in_list(List,[_,fantic,black])),
		(in_list(List,[_,murl,white]);in_list(List,[_,murl,grey]);
		in_list(List,[_,murl,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))

	);
	(
		(in_list(List,[_,dru,black]);in_list(List,[_,dru,grey]);
		in_list(List,[_,dru,red])),
		(in_list(List,[_,elis,white]);in_list(List,[_,elis,black]);
		in_list(List,[_,elis,red])),
		in_list(List,[misha,_,black]),in_list(List,[maksim,murl,_]),
		in_list(List,[leo,elis,_]),in_list(List,[dima,_,white]),
		(in_list(List,[dima,murl,_]);in_list(List,[dima,dru,_]);
		in_list(List,[dima,elis,)]))
	)
	),
	write(List).
