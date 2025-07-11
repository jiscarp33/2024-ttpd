Class {
	#name : #ACardsManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
ACardsManagerTest >> test_01_ACardManagerGivesARandomCardWithUniformProbabilities [

	| aCardManager aCard |
	aCardManager:= CardsManager new.
	
	aCard:= aCardManager createACard.
	
	self assert: (aCard isKindOf: Card)
]

{ #category : #tests }
ACardsManagerTest >> test_02_ACardManagerDiscardACardAndDoNotRaiseAnError [

	| aCardManager aCard |
	aCardManager := CardsManager new.

	aCard := aCardManager createACard.
	aCardManager discard: aCard
]

{ #category : #tests }
ACardsManagerTest >> test_03_ACardManagerHasNewCards [

	| aCardManager aCard |
	aCardManager := CardsManager new.

	aCard := aCardManager createACard.
	aCardManager discard: aCard
]
