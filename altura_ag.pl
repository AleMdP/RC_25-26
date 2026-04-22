arbolg1(a(a, [a(b,[a(e, [a(f, [])])]), a(c, []), a(d,[])])).

/*
	altura_ag(+ArbolGenerico, -Altura).
		Es cierto si Altura unifica con la altura de ArbolGenerico.
*/

altura_ag(a(_, ListaArboles), Altura):- altura_ag(ListaArboles, Al),
										Altura is Al + 1.

/*
	altura_ag(+ListaArboles, -Altura).
	
*/

altura_ag([], 0).
altura_ag([Cab|Resto], Altura):- altura_ag(Resto, Al),
								 altura_ag(Cab, Al2),
								 Altura is max(Al, Al2).
