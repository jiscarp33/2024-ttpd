Class {
	#name : 'FiniteCardManager',
	#superclass : 'Object',
	#instVars : [
		'mazo',
		'descarte'
	],
	#category : 'IngSoft2-Model',
	#package : 'IngSoft2-Model'
}

{ #category : 'as yet unclassified' }
FiniteCardManager >> cardsdistribution [

	| cardsDistribution |
	cardsDistribution := OrderedCollection new.
	cardsDistribution add: (Array with: OverloadCard with: 10).
	cardsDistribution add: (Array with: AllyCard with: 20).
	cardsDistribution add: (Array with: AccelerationCard with: 30).
	cardsDistribution add: (Array with: CancellationCard with: 40).
	cardsDistribution add: (Array with: RedoCard with: 50).
	cardsDistribution add: (Array with: RepeatCard with: 60).
	^cardsDistribution.
]

{ #category : 'as yet unclassified' }
FiniteCardManager >> createACard [
	| dist valor clase |
	dist := self cardsdistribution.
	valor := (Random new next * 60).
	clase := (dist detect: [:e | valor <= (e at: 2)] ifNone: [dist last]) at: 1.
	^ clase new.

]

{ #category : 'instance creation' }
FiniteCardManager >> with: anInteger [ 

	mazo := OrderedCollection new.
	descarte := OrderedCollection new.

	anInteger timesRepeat: [
		mazo add: self createACard.
	].

	^ mazo
]
