Class {
	#name : #TsHomeStartPageSection,
	#superclass : #GtHomeStartPageSection,
	#instVars : [
		'cardContainer'
	],
	#category : #TsPharo
}

{ #category : #accessing }
TsHomeStartPageSection >> bexSketchAppCard [
  ^ self newCard: 'BexSketchApp'
	description: 'drawing logical diagrams'
	content: [ GtInspector forObject:BexSketchApp new ]
]

{ #category : #accessing }
TsHomeStartPageSection >> create [
  cardContainer := self newCardsContainer.
  ^ self newSectionContainer
    addChild: (self newSectionTitle: self sectionTitle);
    addChild: (cardContainer addChildren: {
      self gslFeaturesCard.
      self bexSketchAppCard.
      self pileupCard.
      self gsDemosCard.
      self lepiterCard.
      self sketchAppCard.
      self gsPlayerAppCard.
      self roassal3Card})
]

{ #category : #accessing }
TsHomeStartPageSection >> gsDemosCard [
  ^ self newCard: 'GsDemos'
	description: 'GameSketchLib Demos'
	content: [ GtInspector forObject: GsDemos new ]
]

{ #category : #accessing }
TsHomeStartPageSection >> gsPlayerAppCard [
  ^ self newCard: 'GsPlayerApp'
	description: 'animation player example'
	content: [ GtInspector forObject:
	  GsAnimationExamples pathmapAnimation ]
]

{ #category : #accessing }
TsHomeStartPageSection >> gslFeaturesCard [
  ^ self newCard: 'GSL Features' description: 'features list' 
	content: [(self database pageNamed: 'GSL Features') asLepiterPagePhlowTool].
]

{ #category : #accessing }
TsHomeStartPageSection >> lepiterCard [
  ^ self newCard: 'TsPharo Notes'
	description: 'lepiter ToC'
	content: [ self startPage asLepiterPagePhlowTool ]
]

{ #category : #accessing }
TsHomeStartPageSection >> loadingRoassal3Page [
  ^ self database pageNamed: 'Getting Roassal3 to run in GT'
]

{ #category : #accessing }
TsHomeStartPageSection >> newCard: aTitle description: aDescription content: aBlock [
	^ self
		newHeaderCardWithTitle: aTitle
		description: aDescription
		size: 200 @ 150
		content: (BrLabel new
				text: aTitle;
				aptitude: BrGlamorousLabelAptitude new bold;
				padding: (BlInsets all: 20)) asScalableElement
		action: [ :card | 
			GtWorldUtility
				showSpaceWithTitle: aTitle
				inPagerWith: aBlock asStencil
				from: card ]
]

{ #category : #accessing }
TsHomeStartPageSection >> pileupCard [
  ^ self newCard: 'PileUp'
	description: 'PileUp'
	content: [
	  | dir couch |
      dir := 'd:/ver/pileup' asFileReference.
      couch := CouchDB new withConfig: dir / 'config.py'.
      PileUpApp new db: couch;  loadPile: '@home'. ]
]

{ #category : #accessing }
TsHomeStartPageSection >> roassal3Card [
  ^ self newCard: 'Roassal3' description: 'roassal' 
	content: [ 
	  |found|
	  found := true.
	  #'Roassal3-GToolkit' asPackageIfAbsent: [found := false].
	  found
	    ifTrue: [(GtCoder forObject: (#RSBlocExamples asClass))]
	    ifFalse: [self loadingRoassal3Page asLepiterPagePhlowTool ]].
]

{ #category : #accessing }
TsHomeStartPageSection >> sketchAppCard [
  ^ self newCard: 'GsSketchApp'
	description: 'Drawing Tool'
	content: [ GtInspector forObject: (GsSketchApp new) ]
]
