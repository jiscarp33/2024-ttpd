Class {
	#name : #ACardBoxTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ACardBoxTest >> test_02_WhenAShipLandsInACardBoxThenACardIsAddedToItsCollectionOfCards [

	| aCardManager aCardBox aShip anotherShip aCollectionOfShips |
	aShip := Ship createWithMaxFuel: 1000.
	anotherShip := Ship createWithMaxFuel: 1000.
	aCollectionOfShips := OrderedCollection new.
	aCollectionOfShips add: aShip.
	aCollectionOfShips add: anotherShip.
	aCardManager := CardsManager new.
	aCardBox := CardBox inPlace: 5.
	aCardBox useCardManager: aCardManager .
	aShip moves: 4.
	aShip consumeFuel: 4.
	aCardBox effectShips: aCollectionOfShips playing: aShip.
	self assert: aShip getCards size equals: 1. 
	
	
]

{ #category : #tests }
ACardBoxTest >> test_03_CardBoxDrawsCardFromExternalManager [
    | cardManager box   aShip otherBox |
    cardManager := FiniteCardsManager withDeckSize: 5.
    box := CardBox new.
	otherBox:=CardBox new.
    box useCardManager: cardManager.
	otherBox useCardManager: cardManager.
	aShip:= Ship createWithMaxFuel: 100.
	    

    box effectShips:  nil playing: aShip.
	otherBox effectShips: nil playing:aShip.
    self assert: (cardManager getDeck size) equals: 3.
]
