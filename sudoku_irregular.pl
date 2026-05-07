/*
	X #= 1+3.
		X = 4.
	3 #= Y+2.
		Y = 1.
	
	X #> 5, X #< 8.
		X in 6..7.
	X #> 5.
		X in 6..sup.
*/

:- use_module(library(clpfd)).

sudoku1(
[[1, 2, 3, 4, 5, 6, 7, 8, 9],
[4, 5, 6, 7, 8, 9, 1, 2, 3],
[7, 8, 9, 1, 2, 3, 4, 5, 6],
[2, 1, 4, 3, 6, 5, 8, 9, 7],
[3, 6, 5, 8, 9, 7, 2, 1, 4],
[8, 9, 7, 2, 1, 4, 3, 6, 5],
[5, 3, 1, 6, 4, 8, 9, 7, 2],
[6, 7, 2, 9, 3, 1, 5, 4, 8],
[9, 4, 8, 5, 7, 2, 6, 3, 1]]).

/*
	Sudoku irregular 9x9
	

sudoku_irregular(+Matriz).
	Es cierto si Matriz unifica con una matriz 9x9 
	que cumple las restricciones de un sudoku irregular 9x9.
	
	1.- Puede generar un sudoku irregular válido si Matriz es una variable libre.
	2.- Puede comprobar si Matriz es un sudoku irregular válido si Matriz está instanciada.
	3.- Puede encontrar los huecos que faltan si Matriz está parcialmente instanciada.
	
	
sudoku_irregular(Rows), maplist(label, Rows), maplist(portray_clause, Rows).
*/

sudoku_irregular(Rows):- length(Rows, 9),
					     maplist(same_length(Rows), Rows),
					     append(Rows, Vs),
					     Vs ins 1..9,
					     maplist(all_distinct, Rows),
					     transpose(Rows, Columns),
					     maplist(all_distinct, Columns),
					     Rows = [[P11, P12, P13, P14, P15, P16, P17, P18, P19],
						  	     [P21, P22, P23, P24, P25, P26, P27, P28, P29],
							     [P31, P32, P33, P34, P35, P36, P37, P38, P39],
							     [P41, P42, P43, P44, P45, P46, P47, P48, P49],
							     [P51, P52, P53, P54, P55, P56, P57, P58, P59],
							     [P61, P62, P63, P64, P65, P66, P67, P68, P69],
							     [P71, P72, P73, P74, P75, P76, P77, P78, P79],
							     [P81, P82, P83, P84, P85, P86, P87, P88, P89],
							     [P91, P92, P93, P94, P95, P96, P97, P98, P99]],
					     all_distinct([P11,P12,P21,P31,P32,P41,P51,P52,P62]),
					     all_distinct([P61,P71,P72,P81,P84,P91,P92,P93,P94]),
					     all_distinct([P13,P14,P15,P22,P23,P33,P34,P42,P43]),
					     all_distinct([P53,P63,P73,P74,P75,P82,P83,P85,P95]),
					     all_distinct([P16,P17,P18,P19,P24,P25,P26,P29,P39]),
					     all_distinct([P35,P44,P45,P54,P64,P65,P66,P76,P86]),
					     all_distinct([P27,P28,P36,P37,P46,P55,P56,P57,P58]),
					     all_distinct([P38,P47,P48,P49,P59,P68,P69,P78,P88]),
					     all_distinct([P67,P77,P79,P87,P89,P96,P97,P98,P99]).

