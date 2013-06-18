leftof(A,B,[A,B|_]).
leftof(A,B,[_|R]) :- leftof(A,B,R).

nextto(A,B,H) :- leftof(A,B,H); leftof(B,A,H).

first(A,[A|_]).

inthemiddle(A,[_,_,A,_,_]).

solve :-

	Houses = [_,_,_,_,_],
	%[color,nationality,pet,drink,cigarette]

	permutation([red,green,yellow,ivory,blue],[C1,C2,C3,C4,C5]),
	permutation([englishman,spaniard,ukrainian,norwegian,japanese],[N1,N2,N3,N4,N5]),
	permutation([dog,snake,zebra,fox,horse],[P1,P2,P3,P4,P5]),
	permutation([tea,orange_juice,milk,water,coffee],[D1,D2,D3,D4,D5]),
	permutation([old_gold,kools,chesterfield,lucky_strike,parliament],[Z1,Z2,Z3,Z4,Z5]),

	A = [C1,N1,P1,D1,Z1],
	B = [C2,N2,P2,D2,Z2],
	C = [C3,N3,P3,D3,Z3],
	D = [C4,N4,P4,D4,Z4],
	E = [C5,N5,P5,D5,Z5],

	% The Englishman lives in the red house.
	member([red,englishman,_,_,_],Houses),
	% The Spaniard owns the dog.
	member([_,spaniard,dog,_,_],Houses),
	% Coffee is drunk in the green house.
	member([green,_,_,coffee,_],Houses),
	% The Ukrainian drinks tea.
	member([_,ukrainian,_,tea,_],Houses),
	% The green house is immediately to the right of the ivory house.
	leftof([ivory,_,_,_,_],[green,_,_,_,_],Houses),
	% The Old Gold smokern owns the snake.
	member([_,_,snake,_,old_gold],Houses),
	% Kools are smoked in the yellow house.
	member([yellow,_,_,_,kools],Houses),
	% Milk is drunk in the middle house.
	inthemiddle([_,_,_,milk,_],Houses),
	% The Norwegian lives in the first house on the left.
	first([_,norwegian,_,_,_],Houses),
	% The man who smokes Chesterfields lives in the house next to the man with the fox
	nextto([_,_,_,_,chesterfields],[_,_,fox,_,_],Houses),
	% Kools are smoked in the house next to the house where the horse is kept.
	nextto([_,_,_,_,kools],[_,_,horse,_,_],Houses),
	% The Lucky Strike smoker drinks orange juice.
	member([_,_,_,orange_juice,lucky_strike],Houses),
	% The Japanese smoke Parliaments.
	member([_,japanese,_,_,parliaments],Houses),
	% The Norwegian lives next to the blue house.
	nextto([_,norwegian,_,_,_],[blue,_,_,_,_],Houses),

	Houses = [A,B,C,D,E],
	write('Haus1: '),forall(member(PartOfA,A),( write(PartOfA),write(', ') ) ),nl,
	write('Haus2: '),forall(member(PartOfB,B),( write(PartOfB),write(', ') ) ),nl,
	write('Haus3: '),forall(member(PartOfC,C),( write(PartOfC),write(', ') ) ),nl,
	write('Haus4: '),forall(member(PartOfD,D),( write(PartOfD),write(', ') ) ),nl,
	write('Haus5: '),forall(member(PartOfE,E),( write(PartOfE),write(', ') ) ),nl.
