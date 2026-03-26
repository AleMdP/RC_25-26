/*
ordenada(+Lista)
	es cierto si Lista está ordenada de menor a mayor.
*/

ordenada([]).
ordenada([_]).
ordenada([Cab1,Cab2|Resto]):- Cab1 =< Cab2, ordenada([Cab2|Resto]).