/*
crea_lista_n(+Tam, +N, -ListaR)
	Es cierto si ListaR unifica con una lista de tamaño Tam
	que contiene valores aleatorios entre 1 y N.
*/

crea_lista_n(0, _, []).
crea_lista_n(Tam, N, [Cab|R]):- Tam > 0, Tam2 is Tam - 1, crea_lista_n(Tam2, N, R), random(0, N, Cab).