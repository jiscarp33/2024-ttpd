Class {
	#name : #LeakCard,
	#superclass : #PermanentCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
LeakCard >> affectTo: aShip from: aShip2 playing: aBoardGame [ 

	aShip addActiveCards: self.

	^ LeakCard new.
]

{ #category : #testing }
LeakCard >> isLeak [
	^true
]
