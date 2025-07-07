Class {
	#name : 'AFiniteCardsManagerTest',
	#superclass : 'TestCase',
	#category : 'IngSoft2-Tests',
	#package : 'IngSoft2-Tests'
}

{ #category : 'running' }
AFiniteCardsManagerTest >> test_02_AFiniteCardsManagerInitializesWithASizeOf20 [

| finiteManager|
finiteManager:= FiniteCardsManager withDeckSize: 20.

self assert: finiteManager getdecksize equals: 20
]

{ #category : 'running' }
AFiniteCardsManagerTest >> test_03_AFiniteCardsManagerGiveMeACard [

| finiteManager aCard|
finiteManager:= FiniteCardsManager withDeckSize: 20.
aCard:=finiteManager getCards at: 1.

self assert: (aCard isKindOf: Card).
]
