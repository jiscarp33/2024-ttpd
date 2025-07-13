Class {
	#name : #LeakCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
LeakCard >> affectTo: aShip from: aShip2 playing: aBoardGame [ 

	aShip addActiveCards: self.

	^ self.
]

{ #category : #testing }
LeakCard >> isLeak [
	^true
]
