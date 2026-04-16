/*
crea_abb(+ListaEtiquetas, -ArbolBB) 
	Es cierto cuando ArbolBB unifica con un 
	árbol binario de búsquerda que contiene solo 
	las etiquetas de ListaEtiquetas. Los elementos
	vienen ordenados ya en ListaEtiquetas.
*/

crea_abb([], nil).

crea_abb(ListaEtiquetas, a(Cab, AI, AD)):- length(ListaEtiquetas, L),
										   N is L // 2,
										   length(MitadIzq, N),      
										   append(MitadIzq, [Cab|MitadDer], ListaEtiquetas),
										   crea_abb(MitadIzq, AI),
										   crea_abb(MitadDer, AD).
