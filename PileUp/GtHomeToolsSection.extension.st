Extension { #name : #GtHomeToolsSection }

{ #category : #'*PileUp' }
GtHomeToolsSection >> newPileUpStencil [
  ^ GtToolButtonStencil new 
	title: 'PileUp';
	icon: BrGlamorousVectorIcons largeWindow;
	action: [ :card | 
	  GtWorldUtility
        showSpaceWithTitle: 'pileUp'
    	inPagerWith: [
		  PileUpApp new] asStencil
 		from: card ];
    description: 'Text in Space.'
]
