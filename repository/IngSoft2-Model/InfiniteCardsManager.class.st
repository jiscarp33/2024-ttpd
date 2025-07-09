Class {
	#name : #InfiniteCardsManager,
	#superclass : #CardsManager,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
InfiniteCardsManager >> giveCard [
	^self createACard 
]
