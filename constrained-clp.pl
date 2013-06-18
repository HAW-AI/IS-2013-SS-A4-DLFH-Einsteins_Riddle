:- use_module(library(clpfd)).

solve:-
  Houses = [1, 2, 3, 4, 5],
  Colors = [Red, Green, Ivory, Blue, Yellow],
  Nationalities = [Englishman, Spaniard, Ukrainian, Norwegian, Japanese],
  Pets = [Dog, Snake, Zebra, Fox, Horse],
  Drinks = [Tea, OrangeJuice, Milk, Water, Coffee],
  Cigarettes = [OldGold, Kools, Chesterfield, LuckyStrike, Parliament],
  HouseValues = [Colors,Nationalities,Pets,Drinks,Cigarettes],
  
  Colors ins 1..5,
  Nationalities ins 1..5,
  Pets ins 1..5,
  Drinks ins 1..5,
  Cigarettes ins 1..5,

  Norwegian #= 1,
  Blue #= 2,
  Milk #= 3,
  
  Green #= (Ivory+1),
  Coffee #= Green,
  (Yellow #= (Horse-1)) #\/ (Yellow #= (Horse+1)),
  Yellow #= Kools,
  Englishman #= Red,
  Spaniard #= Dog,
  Ukrainian #= Tea,
  OldGold #= Snake,
  (Chesterfield #= (Fox + 1)) #\/ (Chesterfield #= (Fox - 1)),
  LuckyStrike #= OrangeJuice,
  Japanese #= Parliament,

  %no house with same value
  maplist(all_different,HouseValues),
  
  %label value as used to be sure every value has been set
  maplist(label,HouseValues),
  
  printHouses(Houses,HouseValues).
  
printHouses([],_).
printHouses([HouseNr|RestHouseNr],HouseValues) :-
  printHouse(HouseNr,HouseValues),
  printHouses(RestHouseNr,HouseValues).

printHouse(HouseNr,HouseValues) :-
  ColorsLabel = ['Red', 'Green', 'Ivory', 'Blue', 'Yellow'],
  NationalitiesLabel = ['Englishman', 'Spaniard', 'Ukrainian', 'Norwegian', 'Japanese'],
  PetsLabel = ['Dog', 'Snake', 'Zebra', 'Fox', 'Horse'],
  DrinksLabel = ['Tea', 'Orange Juice', 'Milk', 'Water', 'Coffee'],
  CigarettesLabel = ['OldGold', 'Kools', 'Chesterfield', 'LuckyStrike', 'Parliament'],
  HouseValueLabels = [ColorsLabel, NationalitiesLabel, PetsLabel ,DrinksLabel ,CigarettesLabel], 
	
  string_concat('House ', HouseNr, ThisHouseStr),
  string_concat(ThisHouseStr, ': ', ThatHouseStr),
  write(ThatHouseStr),
  printValues(HouseNr,HouseValues, HouseValueLabels),
  nl.
	
printValues(_,[],_).
printValues(HouseNr,[Value],[ValueLabel|LabelRest]) :-
  printValue(HouseNr,Value,ValueLabel),
  printValues(HouseNr,[],LabelRest).
printValues(HouseNr,[Value|Rest],[ValueLabel|LabelRest]) :-
  printValue(HouseNr,Value,ValueLabel),
  write(', '),
  printValues(HouseNr,Rest,LabelRest).

printValue(HouseNr,Pos,Labels) :-
  nth1(At,Pos,HouseNr),
  nth1(At, Labels, Name),
  write(Name).