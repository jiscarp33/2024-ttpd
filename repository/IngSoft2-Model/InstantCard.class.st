Class {
	#name : #InstantCard,
	#superclass : #Card,
	#category : 'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
InstantCard >> affectTo: aShip from: aShip2 playing: aBoardGame [ 
	^self 
]

{ #category : #testing }
InstantCard >> isInstant [ 
	^true
]
