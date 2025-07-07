Class {
	#name : 'FiniteCardsManager',
	#superclass : 'CardsManager',
	#instVars : [
		'size',
		'deck'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
FiniteCardsManager >> getCards [
	^deck
]

{ #category : 'as yet unclassified' }
FiniteCardsManager >> getdecksize [
	^size
]

{ #category : 'as yet unclassified' }
FiniteCardsManager >> giveCard [
	| card |
	card:= deck first.
	deck remove: card.
	^card
]

{ #category : 'as yet unclassified' }
FiniteCardsManager >> inicializeWithDeckSize: aSize [
	deck := OrderedCollection new.
	size := aSize .
	
	aSize timesRepeat: [
		deck add: self createACard
	].
]
