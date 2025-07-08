Class {
	#name : 'AFiniteCardsManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
AFiniteCardsManagerTest >> test_02_AFiniteCardsManagerInitializesWithASizeOf20 [

| finiteManager|
finiteManager:= FiniteCardsManager withDeckSize: 20.

self assert: finiteManager getdecksize equals: 20
]

{ #category : 'running' }
AFiniteCardsManagerTest >> test_03_AFiniteCardsManagerCreateAFiniteDeckWithCards [

| finiteManager aCard|
finiteManager:= FiniteCardsManager withDeckSize: 20.
aCard:=finiteManager getCards at: 1.

self assert: (aCard isKindOf: Card).
]

{ #category : 'running' }
AFiniteCardsManagerTest >> test_04_AFiniteCardsManagerGiveACard [

| finiteManager aCard|
finiteManager:= FiniteCardsManager withDeckSize: 20.
aCard:=finiteManager giveCard.

self assert: (aCard isKindOf: Card).
]

{ #category : 'running' }
AFiniteCardsManagerTest >> test_05_AFiniteCardsManagerHasADiscardDeck [

| finiteManager aCard anAnotherCard |
finiteManager:= FiniteCardsManager withDeckSize: 20.
aCard:=finiteManager giveCard.
finiteManager discard: aCard.
anAnotherCard:= finiteManager getDiscardDeck at:1.

self assert: (anAnotherCard isKindOf: Card).
]

{ #category : 'running' }
AFiniteCardsManagerTest >> test_06_WhenTheDeckIsEmptyTheDiscardDeckIsShuffled [

| finiteManager  aCard0 aCard1 aCard2 aCard3 aCard4  |
finiteManager:= FiniteCardsManager withDeckSize: 5.
aCard0:=finiteManager giveCard.
aCard1:=finiteManager giveCard.
aCard2:=finiteManager giveCard.
aCard3:=finiteManager giveCard.
aCard4:=finiteManager giveCard.

finiteManager discard: aCard0.
finiteManager discard: aCard1.
finiteManager discard: aCard2.
finiteManager discard: aCard3.
finiteManager discard: aCard4.


self assert: ( finiteManager giveCard isKindOf: Card).
]

{ #category : 'running' }
AFiniteCardsManagerTest >> test_08_WhenNoCardsInDeckAndDiscardDeckNoCardGiven [
	| finiteManager |
	finiteManager := FiniteCardsManager withDeckSize: 0.
	self assert:  finiteManager giveCard equals: nil.
]
