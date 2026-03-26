/*
permuta(+Lista, -ListaR).
	Es cierto cuando ListaR unifica con una lista que 
	contiene los elementos de ista en orden distinto. 
	Este predicado genera todas las permutaciones 
	posibles al solicitar más soluciones con ";".
*/

permuta([], []).
permuta([Cab|Resto], LR):-  permuta(Resto, R1),
							append(A, B, R1),
							append(A, [Cab| B], LR).
							
%-----------------Solucion de Carpio:-----------------

permutaCarpio([],[]).
permutaCarpio([Cab|Resto], R2):- permutaCarpio(Resto, R), insertar_todas(Cab, R, R2).

/*
insertar_todas(+Elem, +Lista, -ListaR).
	Es cierto si ListaR unifica con una lista que 
	contiene los elementos de Lista con Elem insertado 
	en cualquier posición.
*/

insertar_todas(Elem, Lista, [Elem|Lista]).
insertar_todas(Elem, [Cab|Resto], [Cab|R]):-
						insertar_todas(Elem, Resto, R).