Class {
	#name : #ALeakCardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
ALeakCardTest >> test_01_ALeakCardIsCreated [

	| aCard |
	aCard:=LeakCard new.
	self assert: (aCard isLeak).


]

{ #category : #running }
ALeakCardTest >> test_01_WhenALeakCardIsPlayedThenTheTargetShipHasLeakCardInActives [

| aCard aShip anotherShip boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	anotherLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
						  withManager: (CardsManager new)
		              andwithNumberOfLaps: 2.
	aCard:= LeakCard new.
	aShip := aBoardGame getShipsPlaying at: 1.
	anotherShip := aBoardGame getShipsPlaying at: 2.
	aCard affectTo: anotherShip from: aShip playing: aBoardGame.
	
		
	
self assert:((anotherShip hasLeak)).




]

{ #category : #running }
ALeakCardTest >> test_02_WhenALeakCardIsPlayedThenTheTargetShipDuplicateConsumeOfFuel [

	| aShip anotherShip aCard boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	anotherLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
						  withManager: (CardsManager new)
		              andwithNumberOfLaps: 2.
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip:= Ship createWithMaxFuel: 1000.
	aCard:= LeakCard new.
	aCard affectTo: anotherShip from: aShip playing: aBoardGame.
	
	aShip consumeFuel: 10.
	anotherShip consumeFuel: 10.
	self assert: aShip getFuel  equals: 990.
	self assert: anotherShip getFuel equals:980

]

{ #category : #running }
ALeakCardTest >> test_03_WhenALeakCardIsPlayedThenTheTargetShipDuplicateConsumeOfFuelAndWhenIsOutOfFuelTheCardDisapear [

	| aShip anotherShip aCard boxesArray aBoard aCollectionOfDice aLoadedDie anotherLoadedDie aBoardGame |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 5.
	anotherLoadedDie := LoadedDie of: 5.
	aCollectionOfDice add: aLoadedDie.
	aCollectionOfDice add: anotherLoadedDie.
	aBoardGame := BoardGame
		              withShip: 3
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
						  withManager: (CardsManager new)
		              andwithNumberOfLaps: 2.
	aShip := Ship createWithMaxFuel: 15.
	anotherShip:= Ship createWithMaxFuel: 15.
	aCard:= LeakCard new.
	aCard affectTo: anotherShip from: aShip playing: aBoardGame.
	
	aShip consumeFuel: 10.
	anotherShip consumeFuel: 10.
	self assert: aShip getFuel  equals: 5.
	self assert: anotherShip getFuel equals:15.
	anotherShip consumeFuel: 10.
		self assert: anotherShip getFuel equals:5.
		

]

{ #category : #running }
ALeakCardTest >> test_04_WhenALeakCardIsRemoveFromActivesFromTheShipThenAppearInTheDiscardDeck [

	| aShip anotherShip aCard boxesArray aBoard aCollectionOfDice aLoadedDie  aBoardGame aFiniteManager anotherCard |
	boxesArray := OrderedCollection new.
	boxesArray add: (NoEffectBox  inPlace: 1).
	boxesArray add: (NoEffectBox inPlace: 2).
	boxesArray add: (NoEffectBox inPlace: 3).
	boxesArray add: (NoEffectBox inPlace: 4).
	aBoard := Board withBoxesArray: boxesArray.
	aCollectionOfDice := OrderedCollection new.
	aLoadedDie := LoadedDie of: 3.

	aCollectionOfDice add: aLoadedDie.

	aFiniteManager:= FiniteCardsManager withDeckSize: 100.
	aBoardGame := BoardGame
		              withShip: 2
		              withBoard: aBoard
		              WithDice: aCollectionOfDice
						  withManager: aFiniteManager 
		              andwithNumberOfLaps: 2.
	aShip := aBoardGame getShipsPlaying at:1.
	anotherShip:=  aBoardGame getShipsPlaying at:2.
	aCard:= LeakCard new.
	anotherCard:=CancellationCard new.
	aCard affectTo: anotherShip from: aShip playing: aBoardGame.

	anotherCard affectTo: aCard  from: anotherShip  playing: aBoardGame .

	aBoardGame playTurn .
	

	self assert: (aFiniteManager getDiscardDeck at:1) isLeak.

		

]
