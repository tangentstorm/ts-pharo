"
I represent a chart with a coordinate space, and some number of plots,  axes, and labels.

"
Class {
	#name : #GsChart,
	#superclass : #GsObject,
	#instVars : [
		'axes',
		'min',
		'max',
		'plots',
		'names',
		'ticks'
	],
	#category : #'GameSketchLib-Charts'
}

{ #category : #accessing }
GsChart >> add: aPlot [
  self add: aPlot as: ''
]

{ #category : #accessing }
GsChart >> add: aPlot as: aName [
  plots add: aPlot.
  names add: aName.
]

{ #category : #accessing }
GsChart >> buildAxis: aName [
  | axis |
  axis :=  (axes at:  aName).
  aName = #y ifTrue: [|yScale parentHeight|
    "TODO: query actual values from bloc"
    parentHeight := 456. yScale := parentHeight / ticks. 
    
    "build the ticks for y axis"
    (min y to: max y count: ticks y) do: [:i |
      axis addChild: (BlElement new
        size: 16@1;
        border: Color black;
        relocate: 8@(parentHeight - (i * yScale))) ]].

  ^ axis.
]

{ #category : #accessing }
GsChart >> defaultXAxis [
  ^ GsObject new
    vExact: 24 ;
    hMatchParent;
    background: Color blue
]

{ #category : #accessing }
GsChart >> defaultYAxis [
  ^ GsObject new hExact: 24 ; vMatchParent
]

{ #category : #accessing }
GsChart >> initialize [
  super initialize.
  axes := Dictionary new.
  axes at: #x put: self defaultXAxis.
  axes at: #y put: self defaultYAxis.
  plots := OrderedCollection new.
  names := OrderedCollection new.
  self border: Color veryVeryLightGray.
  self matchParent.
]

{ #category : #accessing }
GsChart >> max: aPoint [
  max := aPoint 
]

{ #category : #accessing }
GsChart >> min: aPoint [
  min := aPoint 
]

{ #category : #accessing }
GsChart >> plotHolder [
  ^ GsObject new matchParent
    background: (Color fromHexString: '3399cc')
]

{ #category : #accessing }
GsChart >> rebuild [
  self removeChildren;
    border: Color veryVeryLightGray;
    addChild: (BrHorizontalPane new
	  padding: (BlInsets all: 8);
      addChild: (BrVerticalPane new
        addChild: (self buildAxis: #y) as: #yAxis;
        addChild: (BlElement new size:24@24) as: #spacer;
        vMatchParent;
        hFitContent);
      addChild: (BrVerticalPane new
        addChild: self plotHolder as: #plotHolder;
        addChild: (self buildAxis: #x) as: #xAxis;
        matchParent);
      matchParent)
]

{ #category : #accessing }
GsChart >> ticks: aPoint [
  ticks := aPoint 
]
