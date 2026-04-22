arbolg1(a(a, [a(b,[a(e, [])]), a(c, []), a(d,[])])).

/*
	cuenta_nodos(+ArbolGen, -Num).
		Es cierto si Num unifica con el número
		de nodos de ArbolGen.
*/

cuenta_nodos_ag(a(_, ListaArboles), R2):- cuenta_nodos_ag(ListaArboles, R),
										  R2 is R + 1.
									   
/*
	cuenta_nodos(+ListaArboles, -Num).
		Es cierto si Num unifica con el número de nodos
		de la lista de árboles genéricos ListaArboles.
*/

cuenta_nodos_ag([], 0).
cuenta_nodos_ag([Cab|Resto], Total):- cuenta_nodos_ag(Resto, R),
									  cuenta_nodos_ag(Cab, RCa),
									  Total is R + RCa.
							  
/*
	Parecen el mismo método, pero al tener distintos parámetros,
	uno con un árbol y otro con una lista de árboles, son distintos.
*/