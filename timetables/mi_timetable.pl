
:- load_files('req2.pl').

:- use_module(library(clpfd)).
/*
pairs_keys([a-1,b-2,c-3], Keys).
	Keys = [a, b, c].

pairs_values([a-1,b-2,c-3], R).
	R = [1, 2, 3].
*/

requirements(Rs):- Goal = class_subject_teacher_times(Class, Subject, Teacher, Number),
				   setof(req(Class, Subject, Teacher, Number), Goal, Rs0),
				   maplist(req_with_slots, Rs0, Rs).

/*
class_subject_teacher_times('1a', deu, sjk1, 4).
req('1a', deu, sjk1, 4)-[_,_,_,_]
*/

req_with_slots(R, R-Slots):- R = req(_, _, _, N), length(Slots, N).


classes(Classes):- setof(C, S^N^T^class_subject_teacher_times(C,S,T,N), Classes).

teachers(Teachers):- setof(T, C^S^N^class_subject_teacher_times(C,S,T,N), Teachers).

requirements_variables(Rs, Vars):- requirements(Rs),
								   pairs_slots(Rs, Vars),
								   slots_per_week(SPW),
								   Max #= SPW - 1,
								   Vars ins 0..Max,
								   maplist(constrain_subject, Rs).

pairs_slots(Ps, Vs):- pairs_values(Ps, Vs0),
					  append(Vs0, Vs).

constrain_subject(req(Class, Subj, _Teacher, _Num)-Slots):- strictly_ascending(Slots), % break symmetry
															maplist(slot_quotient, Slots, Qs0),
															strictly_ascending(Qs0).

strictly_ascending(Ls):- chain(Ls, #<).
/*
chain([A,B,C], #<).
	B#=<C+ -1,
	A#=<B+ -1.
*/

slot_quotient(S, Q):- slots_per_day(SPD),
					  Q #= S // SPD.

constrain_teacher(Rs, Teacher):- mi_tfilter(Teacher, Rs, Sub),
								 pairs_slots(Sub, Vs),
								 all_different(Vs).

teacher_req(T0, req(_C, _S, T1, _N)-_, T):- =(T0, T1, T).


constrain_class(Rs, Class):- mi_tfilter

/*
mi_tfilter(+Teacher, +Rs, -Sub).
	Es cierto si Sub unifica con una lista de requisitos del profesor Teacher.
*/

mi_tfilter(_, [], []).

mi_tfilter(Teacher, [req(C, S, Teacher, N)-Slot|Tail], [req(C, S, Teacher, N)-Slot|Rs]):- 
																mi_tfilter(Teacher, Tail, Rs).

mi_tfilter(Teacher, [req(C, S, Teacher2, N)-Slot|Tail], Rs:- Teacher \= Teacher2,
															 mi_tfilter(Teacher, Tail, Rs).
