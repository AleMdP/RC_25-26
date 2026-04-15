arbol2(a(1, a(2, a(4, a(6, nil, nil), nil), nil), a(3, nil, a(5, nil, a(7, nil, nil))))).
arbol3(a(1, a(2, a(3, nil, nil), nil), a(4, nil, a(5, nil, nil)))).
arbol4(a(1, a(2, nil, nil), a(3, nil, nil))).

/*
	balanceado_ab(+ArbolBinario).
		Es cierto si ArbolBinario unifica con un
		árbol binario que PARA TODO nodo la diferencia
		entre la altura del árbol izquierdo y derecho
		es como máximo 1.
*/

balanceado_ab(nil).

balanceado_ab(a(_, ArbolIzq, ArbolDer)):- profundidad_ab(ArbolIzq, ProfI),
										  profundidad_ab(ArbolDer, ProfD),
										  Dif is ProfI - ProfD,
										  Abs is abs(Dif),
										  Abs =< 1,
										  balanceado_ab(ArbolIzq),
										  balanceado_ab(ArbolDer).

%-----------------------------------------------------------

/*
	profundidad_ab(+ArbolBinario, -Profundidad).
		Es cierto si Profundidad unifica con la profundidad
		del árbol binario ArbolBinario.
*/

profundidad_ab(nil, 0).
profundidad_ab(a(_, ArbolIzq, ArbolDer), Prof):- profundidad_ab(ArbolIzq, ProfI),
												 profundidad_ab(ArbolDer, ProfD),
												 Prof2 is max(ProfI, ProfD),
												 Prof is Prof2 + 1.