Class {
	#name : #FiniteCardsManager,
	#superclass : #CardsManager,
	#instVars : [
		'size',
		'deck',
		'discartDeck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
FiniteCardsManager class >> withDeckSize: aDeckSize [ 
	^self new inicializeWithDeckSize: aDeckSize 
]

{ #category : #'as yet unclassified' }
FiniteCardsManager >> discard: aCard [
	discartDeck add: aCard.
]

{ #category : #'as yet unclassified' }
FiniteCardsManager >> getCards [
	^deck
]

{ #category : #'as yet unclassified' }
FiniteCardsManager >> getDiscardDeck [
	^discartDeck 
]

{ #category : #'as yet unclassified' }
FiniteCardsManager >> getdecksize [
	^size
]

{ #category : #'as yet unclassified' }
FiniteCardsManager >> giveCard [
	|card|
	deck isEmpty ifTrue: [ self reshuffle ].
	deck isEmpty ifTrue: [ ^nil ].

	card:= deck first.
	deck remove: card.
	^card
]

{ #category : #'as yet unclassified' }
FiniteCardsManager >> inicializeWithDeckSize: aSize [
	deck := OrderedCollection new.
	discartDeck :=OrderedCollection new.
	size := aSize .
	
	aSize timesRepeat: [
		deck add: self createACard
	].
]

{ #category : #'as yet unclassified' }
FiniteCardsManager >> reshuffle [
	deck := discartDeck shuffled.
	discartDeck := OrderedCollection new.

	
]
