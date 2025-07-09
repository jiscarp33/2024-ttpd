Class {
	#name : #AInfiniteCardsManagerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
AInfiniteCardsManagerTest >> test_01_AnInfiniteCardsManagerGiveACard [

| infiniteManager aCard |
infiniteManager:= InfiniteCardsManager new.
aCard:=infiniteManager giveCard.
self assert: (aCard isKindOf: Card).
]
