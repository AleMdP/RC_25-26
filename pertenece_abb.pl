arbol1ABB(a(5, a(3, a(2, a(1, nil, nil), nil), a(4, nil, nil)), a(7, a(6, nil, nil), a(8, nil, nil)))).

pertenece_abb(Elem, a(Elem, _, _)).

pertenece_abb(Elem, a(Cab, MitadI, _)):- Cab > Elem, 
										 pertenece_abb(Elem, MitadI).
													
pertenece_abb(Elem, a(Cab, _, MitadD)):- Cab < Elem, 
										 pertenece_abb(Elem, MitadD).