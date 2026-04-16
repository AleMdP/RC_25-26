/*
	lista_hojas(+ArbolBinario, ?ListaHojas).
		Es cierto cuando ListaHojas unifica con una lista que
		contiene las etiquetas de las hojas de ArbolBinario.
*/

hoja( a(_, nil, nil)).

lista_hojas(nil, []).
lista_hojas(a(Et, AI, AD), [Et]):- hoja(a(Et, AI, AD)).
lista_hojas(a(Et, AI, AD), LH):- \+ hoja(a(Et, AI, AD)),
									lista_hojas(AI, RI),
									lista_hojas(AD, RD),
									append(RI, RD, LH).