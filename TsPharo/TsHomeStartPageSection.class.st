Class {
	#name : #TsHomeStartPageSection,
	#superclass : #GtHomeStartPageSection,
	#category : #TsPharo
}

{ #category : #accessing }
TsHomeStartPageSection >> create [
  ^ self newSectionContainer
    addChild: (self newSectionTitle: self sectionTitle);
	addChild: (self newCardsContainer addChildren: {
	  self newCard: 'TsPharo Notes' description: 'lepiter ToC' 
	    content: [ self startPage asLepiterPagePhlowTool ].
	  self newCard: 'PileUp' description: 'PileUp' 
	    content: [ self pileUpApp].
	  self newCard: 'GsDemos' description: 'GameSketchLib Demos' 
	    content: [ GtInspector forObject: GsDemos new].    
	  self newCard: 'GsAnimator' description: 'animator example' 
	    content: [ GtInspector forObject: (
	      GsAnimatorExamples pathmapAnimation)].
	  self newCard: 'Roassal3' description: 'roassal' 
	    content: [ 
	      |found|
	      found := true.
	      #'Roassal3-GToolkit' asPackageIfAbsent: [found := false].
	      found
	        ifTrue: [ (GtCoder forObject: RSBlocExamples) ]
	        ifFalse: [ self loadingRoassal3Page asLepiterPagePhlowTool ]].})
	
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
TsHomeStartPageSection >> pileUpApp [
  | dir couch |
  dir := 'd:/ver/pileup' asFileReference.
  couch := CouchDB new withConfig: dir / 'config.py'.
  ^ PileUpApp new db: couch;  loadPile: '@home'.
]
