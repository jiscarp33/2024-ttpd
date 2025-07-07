Class {
	#name : 'FiniteCardsManager',
	#superclass : 'Object',
	#instVars : [
		'size'
	],
	#classInstVars : [
		'size'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
FiniteCardsManager >> getdecksize [
	^size
]

{ #category : 'as yet unclassified' }
FiniteCardsManager >> inicializeWithDeckSize: aSize [
	size:=aSize
]
