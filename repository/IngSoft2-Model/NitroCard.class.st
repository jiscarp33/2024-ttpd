Class {
	#name : #NitroCard,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
NitroCard >> affectTo: aTargetShip from: aSourceShip playing: aBoardGame [

   aTargetShip activateNitro.
	aBoardGame getCardManager discard:self. 
	^NitroCard  new.

]

{ #category : #testing }
NitroCard >> isNitro [
	^true.
]
