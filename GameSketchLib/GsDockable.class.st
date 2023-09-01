"
I am a dockable window. You can drag me around inside a {{gtClass:GsDockContainer}}
"
Class {
	#name : #GsDockable,
	#superclass : #BrVerticalPane,
	#instVars : [
		'titleBar',
		'offerElement',
		'docked',
		'pullHandler'
	],
	#category : #'GameSketchLib-UI - Docking'
}

{ #category : #accessing }
GsDockable >> beDocked [
  docked := true.
  self constraints accountByLayout.
]

{ #category : #accessing }
GsDockable >> beUndocked [
  docked ifTrue: [
    | newPosition | newPosition := self parent gsLeft @ self gsTop.
    self parent parent addChild: (self removeFromParent relocate: newPosition )].
  docked := false.
  self constraints ignoreByLayout.
]

{ #category : #accessing }
GsDockable >> dockIn: dockId [
  self parent childNamed: dockId
    ifFound: [:d|
      d addChild: self beDocked removeFromParent]
    ifNone: [ ]
]

{ #category : #accessing }
GsDockable >> ifAtLeft: leftBlock ifAtRight: rightBlock else: elseBlock [
  (self position x < (self offerHolder gsLeft + self threshhold))
     ifTrue: leftBlock
     ifFalse: [
       (self gsRight > (self offerHolder gsRight - self threshhold))
         ifTrue: rightBlock
         ifFalse: elseBlock ]
]

{ #category : #accessing }
GsDockable >> initialize [
  super initialize.
  docked := false.
  self beUndocked.
  self makeOfferElement.
  self size: 150@250;
    addEventHandler: (pullHandler := BlPullHandler new disallowOutOfBounds); 
    when: BlMouseDownEvent do: [:e | e consumed: true];
    when: BlMouseUpEvent do: [:e |  e consumed: true];
    when: BlDragStartEvent do: [:e| 
      self beUndocked.
      pullHandler patchOriginalTopPosition: self position y ];
    when: BlDragEvent do: [:e| 
      self ifAtLeft: [self offerLeftDock]
           ifAtRight:  [self offerRightDock]
           else: [self rescindOffers]];
    when: BlDragEndEvent do: [:e|
      self rescindOffers.
      self ifAtLeft: [ self dockIn: #leftDock ]
      ifAtRight: [ self dockIn: #rightDock ]
      else: []];
    background: GsColor toolBg;
    border: (BlBorder builder
      paint: (GsColor toolBg darker darker);
      width: 2;
      build);
    addChild: self makeTitleBar as: #titleBar
]

{ #category : #accessing }
GsDockable >> makeOfferElement [
  ^ offerElement := BrWidgetContainer new
    hExact: self threshhold;
    vMatchParent;
    background: (Color lightCyan alpha: 0.3).
]

{ #category : #accessing }
GsDockable >> makeTitleBar [
  ^ titleBar := BrLabel new
    aptitude: "(BrTextLabelAptitude new defaultFontName: 'Source Sans Pro');"
      BrGlamorousLabelAptitude;
    background: GsColor toolBg darker darker;
    padding: (BlInsets all: 2);
    hMatchParent;
    text: 'A GsDockable'
]

{ #category : #accessing }
GsDockable >> offerHolder [
  ^ self parent childNamed: #content
    ifFound: #value ifNone: [self parent]
]

{ #category : #accessing }
GsDockable >> offerLeftDock [
  self offerHolder addChild: (offerElement removeFromParent relocate: 0@0)
]

{ #category : #accessing }
GsDockable >> offerRightDock [
  self offerHolder addChild: (offerElement removeFromParent
    relocate: (self offerHolder width - self threshhold)@0)
]

{ #category : #accessing }
GsDockable >> relocate: aPoint [
  "super relocate: requests layout so we have to turn it off again.
   This is necessary if we want to set an initial position for the undocked widget."
  super
    when: BlElementPositionChangedEvent doOnce: [
      docked ifFalse: [self constraints ignoreByLayout ]];
    relocate: aPoint.
  
]

{ #category : #accessing }
GsDockable >> rescindOffers [
  offerElement removeFromParent
]

{ #category : #accessing }
GsDockable >> threshhold [
  ^ 10
]

{ #category : #accessing }
GsDockable >> title [
  ^ titleBar text asString
]

{ #category : #accessing }
GsDockable >> title: aString [
  titleBar text: aString asText
]
