leftof(A,B,[A,B|_]).
leftof(A,B,[_|R]) :- leftof(A,B,R).

nextto(A,B,H) :- leftof(A,B,H); leftof(B,A,H).


solve :-

	% Milk is drunk in the middle house.
	% The Norwegian lives in the first house on the left.
	% The Norwegian lives next to the blue house.

	Houses = [[_,norwegian,_,_,_],[blue,_,_,_,_],[_,_,_,milk,_],_,_],
	%[color,nationality,pet,drink,cigarette]

	% Coffee is drunk in the green house.
	% The green house is immediately to the right of the ivory house.
	leftof([ivory,_,_,_,_],[green,_,_,coffee,_],Houses),
	% Kools are smoked in the yellow house.
	% Kools are smoked in the house next to the house where the horse is kept.
	nextto([yellow,_,_,_,kools],[_,_,horse,_,_],Houses),
	
	% The Englishman lives in the red house.
	member([red,englishman,_,_,_],Houses),
	% The Spaniard owns the dog.
	member([_,spaniard,dog,_,_],Houses),
	% The Ukrainian drinks tea.
	member([_,ukrainian,_,tea,_],Houses),
	% The Old Gold smokern owns the snake.
	member([_,_,snake,_,old_gold],Houses),
	% The man who smokes Chesterfields lives in the house next to the man with the fox
	nextto([_,_,_,_,chesterfields],[_,_,fox,_,_],Houses),
	% The Lucky Strike smoker drinks orange juice.
	member([_,_,_,orange_juice,lucky_strike],Houses),
	% The Japanese smoke Parliaments.
	member([_,japanese,_,_,parliaments],Houses),
	% Somebody owns a zebra
	member([_,_,zebra,_,_],Houses),
	% Somebody drinks water
	member([_,_,_,water,_],Houses),


	Houses = [A,B,C,D,E],
	write('Haus1: '),forall(member(PartOfA,A),( write(PartOfA),write(', ') ) ),nl,
	write('Haus2: '),forall(member(PartOfB,B),( write(PartOfB),write(', ') ) ),nl,
	write('Haus3: '),forall(member(PartOfC,C),( write(PartOfC),write(', ') ) ),nl,
	write('Haus4: '),forall(member(PartOfD,D),( write(PartOfD),write(', ') ) ),nl,
	write('Haus5: '),forall(member(PartOfE,E),( write(PartOfE),write(', ') ) ),nl.
