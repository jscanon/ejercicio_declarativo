calificacion(informatica,0).
calificacion(bases,3).
calificacion(seminario,4).
calificacion(matematicas,3).
calificacion(informatica,4).
calificacion(bases,5).
calificacion(seminario,2).
calificacion(matematicas,2).
calificacion(informatica,2).
calificacion(bases,3).
calificacion(seminario,1).
calificacion(matematicas,1).
calificacion(informatica,0).
calificacion(bases,0).
calificacion(seminario,0).
calificacion(matematicas,5).
calificacion(informatica,0).
calificacion(bases,5).
calificacion(seminario,1).
calificacion(matematicas,2).
calificacion(informatica,4).
calificacion(bases,1).
calificacion(seminario,0).
calificacion(matematicas,4).
calificacion(informatica,2).
calificacion(bases,0).
calificacion(seminario,4).
calificacion(matematicas,2).
calificacion(informatica,1).
calificacion(bases,5).
calificacion(seminario,3).
calificacion(matematicas,3).
calificacion(informatica,3).
calificacion(bases,0).
calificacion(seminario,3).
calificacion(matematicas,5).



notas(L):-findall(X,(calificacion(_,X)),L).

suma([],0).
suma([X|Y],R):- suma(Y, R1), R is R1 + X.

long([],0).
long([_|Y],R):- long(Y, R1), R is R1 + 1.

promedio(R):-notas(L1), suma(L1,S),long(L1,T),R is S/T.

evaluar(X):-
    promedio(R),R<3, X=pierde;
    promedio(R),R>=3, X=pasa.


pasaopierde(X,Y):-
	X < 3 -> Y = perdida; 
	X >=3-> Y = pasada.


perdidas(X):-calificacion(X,N),pasaopierde(N,Z),Z=perdida.
pasadas(X):-calificacion(X,N),pasaopierde(N,Z),Z=pasada.


listaperdidas(L):-findall(X,perdidas(X),L).
listapasadas(L):-findall(X,pasadas(X),L).