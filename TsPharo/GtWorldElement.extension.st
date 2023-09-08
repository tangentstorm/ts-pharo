Extension { #name : #GtWorldElement }

{ #category : #'*TsPharo-Gt' }
GtWorldElement >> newActionItemsInto: anActionbar [
	super newActionItemsInto: anActionbar.
	anActionbar addItem: self newScaleUpButton.
	anActionbar addItem: self newScaleDownButton.
	anActionbar addItem: self newWindowButton.
	anActionbar addItem: self newNotificationsBadge.
	anActionbar addItem: self newSpotterButton.
	anActionbar addItem: self newStatusButton.
	GtImage isSyncEnabled
		ifTrue: [ anActionbar addItem: self newSynchronizeButton ].
	anActionbar addItem: self newSubSpaceButton
]

{ #category : #'*TsPharo-Gt' }
GtWorldElement >> newScaleDownButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude;
		label: 'Scale down UI';
		icon: BrGlamorousVectorIcons remove;
		action: [ :aButton :aModel :anEvent | BlGlutinHostSpace zoomFactor: BlGlutinHostSpace zoomFactor / 1.2 ]
]

{ #category : #'*TsPharo-Gt' }
GtWorldElement >> newScaleUpButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude;
		label: 'Scale up UI';
		icon: BrGlamorousVectorIcons add;
		action: [ :aButton :aModel :anEvent | BlGlutinHostSpace zoomFactor: BlGlutinHostSpace zoomFactor * 1.2 ]
]

{ #category : #'*TsPharo-Gt' }
GtWorldElement >> newWindowButton [
	^ BrButton new
		aptitude: BrGlamorousButtonWithIconAptitude;
		label: 'Scale up UI';
		icon: BrGlamorousVectorIcons spawn;
		action: [ :aButton :aModel :anEvent | 
		  GtWorld open  ]
]
