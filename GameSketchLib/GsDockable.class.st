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
		'pullHandler',
		'resizeHandle',
		'plannedSize',
		'workArea',
		'dockContainer'
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
    dockContainer addChild: (self removeFromParent relocate: newPosition )].
  docked := false.
  self constraints ignoreByLayout.
]

{ #category : #accessing }
GsDockable >> dockContainer [
	^ dockContainer
]

{ #category : #accessing }
GsDockable >> dockContainer: anObject [
	dockContainer := anObject
]

{ #category : #accessing }
GsDockable >> dockIn: dockId [
  | docks |
  docks := (self parent query // dockId)
    result ifEmpty: [
      self error: 'no dock named ',dockId asString,' found'].
  docks first addChild: self beDocked removeFromParent

]

{ #category : #accessing }
GsDockable >> ifAtLeft: leftBlock ifAtRight: rightBlock ifAtBottom: bottomBlock else: elseBlock [
  (self position x < (self offerHolder gsLeft + self threshhold))
     ifTrue: leftBlock
     ifFalse: [
       (self gsRight > (self offerHolder gsRight - self threshhold))
         ifTrue: rightBlock
         ifFalse: [
           (self gsBottom > (self offerHolder gsBottom - self threshhold ))
             ifTrue: bottomBlock
             ifFalse: elseBlock] ]
]

{ #category : #accessing }
GsDockable >> initialize [
  super initialize.
  docked := false.
  self beUndocked makeOfferElement.
  self
    background: GsColor toolBg;
    border: (BlBorder builder
      paint: (GsColor toolBg darker darker);
      width: 2;
      build);
    addChild: (self makeTitleBar
        addEventHandler: (pullHandler := BlPullHandler new 
          targetElement: self;
          disallowOutOfBounds); 
    when: BlMouseDownEvent do: [:e | 
       e consumed: true];
    when: BlMouseUpEvent do: [:e |  e consumed: true];
    when: BlDragStartEvent do: [:e| 
      self beUndocked.
      pullHandler patchOriginalTopPosition: self position y ];
    when: BlDragEvent do: [:e| 
      self ifAtLeft: [self offerLeftDock]
           ifAtRight:  [self offerRightDock]
           ifAtBottom: [self offerBottomDock]
           else: [self rescindOffers]];
    when: BlDragEndEvent do: [:e|
      self rescindOffers.
      self ifAtLeft: [ self dockIn: #leftDock ]
      ifAtRight: [ self dockIn: #rightDock ]
      ifAtBottom: [ self dockIn: #bottomDock ]
      else: []]
    )  as: #titleBar;
    addChild: self makeWorkArea as: #workArea;
    addChild: self makeResizeHandle as: #resizeHandle;
    size: (plannedSize := 200@240)

]

{ #category : #accessing }
GsDockable >> makeOfferElement [
  ^ offerElement := BrWidgetContainer new
    background: (Color lightCyan alpha: 0.3).
]

{ #category : #accessing }
GsDockable >> makeResizeHandle [
  | updateHandle updateSize |
  resizeHandle := GsHandle new
    border: Color veryLightGray;
    background: Color transparent.
  updateSize := [
      self size: resizeHandle gsCenter + resizeHandle extent].
  resizeHandle
    addEventHandler: BlPullHandler new;
    when: BlPullEvent do: updateSize;
    when: BlPullEndEvent do: updateSize.
  self when: BlElementExtentChangedEvent do: [
    resizeHandle 
      gsCenter: self extent - resizeHandle extent;
      constraintsDo: [:c | c ignoreByLayout]].
  ^ resizeHandle

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
GsDockable >> makeWorkArea [
  ^ workArea := BrHorizontalFlow new matchParent
    padding: (BlInsets all: 2);
    background: Color white
]

{ #category : #accessing }
GsDockable >> offerBottomDock [
  self offerHolder addChild: (offerElement removeFromParent
    vExact: self threshhold;  hMatchParent;
    relocate: 0@(self offerHolder height - self threshhold))
]

{ #category : #accessing }
GsDockable >> offerHolder [
  ^ self parent childNamed: #content
    ifFound: #value ifNone: [dockContainer]
]

{ #category : #accessing }
GsDockable >> offerLeftDock [
  self offerHolder addChild: (offerElement removeFromParent
    hExact: self threshhold;  vMatchParent;
    relocate: 0@0)
]

{ #category : #accessing }
GsDockable >> offerRightDock [
  self offerHolder addChild: (offerElement removeFromParent
    hExact: self threshhold;  vMatchParent;
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
