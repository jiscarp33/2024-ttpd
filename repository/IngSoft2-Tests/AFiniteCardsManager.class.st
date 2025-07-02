Class {
	#name : 'AFiniteCardsManager',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
AFiniteCardsManager >> test_01_AFiniteCardManagerCreateaCollectionOfFiveCards [

	| aFiniteCardManager aCollectionOfCards |
	aFiniteCardManager := FiniteCardManager new.
	aCollectionOfCards := aFiniteCardManager with: 5.
	self assert: aCollectionOfCards size equals: 5
]
