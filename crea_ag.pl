/*
length(Lista, 3), maplist(same_length([_]), Lista).
	Esto hace que lista, que tenía tres elementos, se divida en una lista de tres listas de 1 elemento.
length(Lista, 4), maplist(same_length([_, _]), Lista).
	Esto hace que lista, que tenía cuatro elementos, se divida en una lista de dos listas de 2 elementos.
*/

/*
	crea_ag_lista_arboles(+Lista, -ListaArbolesGenericos).
		Es cierto si ListaArboles unifica con una lista de árboles
		genéricos sin hijos y con todas las etiquetas de ListaEtiquetas.
*/

crea_ag_lista_arboles([], []).
crea_ag_lista_arboles([Cab|Resto], [a(Cab, [])|R]):- crea_ag_lista_arboles(Resto, R).

/*
	crea_ag(+N, +ListaEtiquetas, -ArbolGenerico).
		Es cierto si ArbolGenerico unifica con un árbol
		genérico que contiene todas las etiquetas de 
		ListaEtiquetas y solo estas y un máximo de N hijos
		por nodo.
*/

crea_ag(N, [Cab|Resto], a(Cab, R)):- length(Resto, L),
									 L < N,
									 crea_ag_lista_arboles(Resto, R).

crea_ag(N, [Cab|Resto], a(Cab, R)):- N > 1,
									 length(Resto, L),
									 L >= N,
									 Div is L div N,
									 N2 is N - 1,
									 length(Lista, N2),
									 maplist(my_length(Div), Lista),
									 append([L1|Lista], Resto),
									 maplist(crea_ag(N), [L1|Lista], R).

my_length(N, Lista):- length(Lista, N).
