/*
num_elem(+Lista, -Resultado)
	es cierto si Resultado unifica con
	el número de elementos de Lista.
	
Principio de inducción
	1) num_elem([], ).
	2) num_elem(n-1) -> num_elem(n).
	
*/

num_elem([], 0).
num_elem([_|Resto], R2) :- num_elem(Resto, R), R2 is R+1.).
