"
I draw a set of colors and maintain a currentColor. Used in GsSketchApp
"
Class {
	#name : #GsPaletteElement,
	#superclass : #BrHorizontalGrid,
	#instVars : [
		'toolApp',
		'colors',
		'currentColor',
		'sceneBuilder',
		'cellSize'
	],
	#category : #'GameSketchLib-UI'
}

{ #category : #accessing }
GsPaletteElement >> colors: aCollection [
  colors := aCollection.
  self rebuildCells
]

{ #category : #accessing }
GsPaletteElement >> currentColor [
	^ currentColor
]

{ #category : #accessing }
GsPaletteElement >> currentColor: aColor [
  currentColor := aColor.
  self highlightCurrent.
  self fireEvent: (GsColorChangedEvent new color: aColor).
]

{ #category : #ui }
GsPaletteElement >> highlightCurrent [
  | cbg |
  cbg := currentColor asBlBackground.
  children do: [:child|
    child removeChildren.
    child background = cbg ifTrue: [
      0 to: 2 do: [:i |
        child addChild: (BlElement new
          size: cellSize - (i * 2) asPoint;
          relocate: i asPoint;
          border: (i=1 
            ifTrue: [Color white]
            ifFalse: [Color black] ))]]]
]

{ #category : #initialization }
GsPaletteElement >> initialize [
  super initialize.
  cellSize := 14.
  currentColor := Color white.
  self colors: GsPalette arne colors; highlightCurrent
]

{ #category : #ui }
GsPaletteElement >> rebuildCells [
  self removeChildren;
	  columnCount: 8;
	  cellSpacing: 1;
	  addChildren: (colors collect: [ :c | 
        BlElement new size: cellSize asPoint; background: c;
          when: BlClickEvent do: [ self currentColor:c ] ]);
      fitContent
]
