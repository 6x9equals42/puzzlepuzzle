left(X,Y,G) :- right(Y,X,G).
above(X,Y,G) :- below(Y,X,G).
nextoh(X,Y,G) :- left(X,Y,G) ; right(X,Y,G).
nextov(X,Y,G) :- above(X,Y,G) ; below(X,Y,G).
nexto(X,Y,G) :- above(X,Y,G).
nexto(X,Y,G) :- below(X,Y,G).
nexto(X,Y,G) :- left(X,Y,G).
nexto(X,Y,G) :- right(X,Y,G).
adjacent(X,Y,G) :- nexto(X,Y,G).
adjacent(X,Y,G) :- nextov(X,Z,G) , nextoh(Z,Y,G).

all_diff(L) :- \+ (select(X,L,R), memberchk(X,R)).

teststart(Solv):- Solv=[_,_,_,_],
  testgrid(Solv),
  nexto(a,b,Solv),
  nexto(b,d,Solv),
  adjacent(b,c,Solv).
  all_diff(Solv).


start(Sol):- Sol=[[N1,C1],[N2,C2],[N3,C3],[N4,C4],[N5,C5],[N6,C6],[N7,C7],[N8,C8],[N9,C9],[N10,C10],[N11,C11],[N12,C12]],
		grid(Sol),

		nexto([_,green],[_,cyan],Sol), %% here I interpreted next to as different from neighboring, so any time next to appears,
                                   %% imagined it was directly adjacent. Switching to sharing corners would probably reduce the speed
                                   %% even more.

		nexto([abby,_],[charles,_],Sol),
		nexto([abby,_],[_,cyan],Sol),
		nexto([danielle,_],[_,cyan],Sol),
		nexto([charles,_],[freya,_],Sol),
		adjacent([elizabeth,_],[freya,_],Sol),
		adjacent([howard,_],[freya,_],Sol),
		adjacent([thomas,_],[freya,_],Sol),
		nexto([_,gray],[_,cyan],Sol),
		member([howard,purple],Sol),
		adjacent([_,magenta],[ophelia,_],Sol),
		nexto([martin,_],[_,yellow],Sol),
		member([abby,black],Sol),
		member([ophelia,red],Sol),
		nexto([_,orange],[_,white],Sol),

		not(nexto([rochelle,_],[charles,_],Sol)),

		member([stuart,cyan],Sol),

		not(adjacent([stuart,_],[howard,_],Sol)), %% come back to adjacent to if necessary and opposite side
    not(adjacent([_,black],[elizabeth,_],Sol)),


    member([rochelle,brown],Sol),
		adjacent([_,red],[_,gray],Sol),
		adjacent([_,red],[_,cyan],Sol),
		adjacent([_,red],[philip,_],Sol),
		adjacent([_,red],[_,orange],Sol),
		adjacent([_,red],[thomas,_],Sol),
		not(adjacent([_,white],[_,blue],Sol)),
		adjacent([_,magenta],[_,blue],Sol),
    all_diff([N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12]),
    all_diff([C1,C2,C3,C4,C5,C6,C7,C8,C9,C10,C11,C12]).


testgrid([A,B,C,D]):-
  assert(right(A,B,[A,B,C,D])),
  assert(right(C,D,[A,B,C,D])),
  assert(below(A,C,[A,B,C,D])),
  assert(below(B,D,[A,B,C,D])).

grid([A,B,C,D,E,F,G,H,I,J,K,L]):-
  assert(right(A,B,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(right(B,C,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(right(C,D,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(right(E,F,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(right(F,G,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(right(G,H,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(right(I,J,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(right(J,K,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(right(K,L,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(below(A,E,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(below(E,I,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(below(B,F,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(below(F,J,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(below(C,G,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(below(G,K,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(below(D,H,[A,B,C,D,E,F,G,H,I,J,K,L])),
  assert(below(H,L,[A,B,C,D,E,F,G,H,I,J,K,L])).
