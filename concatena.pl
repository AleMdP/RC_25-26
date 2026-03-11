/*
concatena(?List1, ?List2, ?ListR).
	es cierto cuando ListR unifica con una lista
	que contiene los elementos de la lista List1
	en el mismo orden y seguidos de los elementos
	de la lista List2 en el mismo orden.
*/

concatena([],R,R).
concatena([Cab|Resto], List2, [Cab|ListR]):- concatena(Resto, List2, ListR).