/*
aniadir_final(+Elem, +Lista, -ListaR) es cierto cuando ListaR unifica con una lista 
que contiene los mismos elementos que Lista con el elemento Elem añadido al final

*/

aniadir_final(Elem, [], [Elem]).
aniadir_final(Elem, [Cab|Resto], [Cab|R2]):- aniadir_final(Elem, Resto, R2).

