/*
divide(+Elem, +Lista, -Menores, -Mayores).
	Es cierto cuando Menores unifica con una lista que contiene
	los elementos de Lista que son menores o iguales que Elem,
	y Mayores unifica con una lista que contiene los elementos
	de Lista que son mayores que Elem.
*/

divide(_, [], [], []).
divide(Elem, [Cab|Resto], [Cab|Me], Ma):- Cab =< Elem, divide(Elem, Resto, Me, Ma).
divide(Elem, [Cab|Resto], Me, [Cab|Ma]):- Cab > Elem, divide(Elem, Resto, Me, Ma).

/*
quicksort(+Lista, -ListaR).
	Es cierto cuandlo ListaR unifica con una lista que contiene
	los mismos elementos que Lista ordenados de menor a mayor.
*/

quicksort([], []).
quicksort([Cab|RL], Res):- divide(Cab, RL, Me, Ma), 
	quicksort(Me, MeO), quicksort(Ma, MaO), append(MeO, [Cab|MaO], Res).