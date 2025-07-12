Class {
	#name : #CardBox,
	#superclass : #Box,
	#instVars : [
		'cardManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
CardBox class >> inPlace: aPosition [
	^self new initializeInPlace: aPosition.
]

{ #category : #'as yet unclassified' }
CardBox >> effectShips: aCollectionOfShips playing: aShip [
	| aCard |
	aCard := cardManager  giveCard .
	aShip addCard: aCard.
]

{ #category : #'as yet unclassified' }
CardBox >> getCardManager [
	^cardManager.
]

{ #category : #initialization }
CardBox >> initializeInPlace: aPosition [
	place := aPosition.
	
]

{ #category : #'as yet unclassified' }
CardBox >> useCardManager: aCardManager [ 
	cardManager := aCardManager.
]
