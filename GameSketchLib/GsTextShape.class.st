"
I represent a text string, rendered with a particular font at a particular location.

"
Class {
	#name : #GsTextShape,
	#superclass : #BrEditableLabel,
	#traits : 'TGsShaped',
	#classTraits : 'TGsShaped classTrait',
	#instVars : [
		'textColor',
		'fontSize',
		'fontName',
		'lengthShown',
		'fullString'
	],
	#category : #'GameSketchLib-Shapes'
}

{ #category : #commands }
GsTextShape >> bold [
  <gsInspectorCmd>
  self text bold
]

{ #category : #accessing }
GsTextShape >> fontName [
  ^ fontName
]

{ #category : #accessing }
GsTextShape >> fontName: aString [
  self inUIProcessDo: [
    self fullSpan fontName: (fontName := aString)]
]

{ #category : #magritte }
GsTextShape >> fontNameDescription [
  <magritteDescription>
  ^ GsDescriptionWrapper new for:(
      MAStringDescription new
      label: 'font name';
      accessor: #fontName);
    jsonKey: 'fontName'    
]

{ #category : #accessing }
GsTextShape >> fontSize [
  ^ fontSize
]

{ #category : #accessing }
GsTextShape >> fontSize: aNumber [
  self inUIProcessDo: [
    self fullSpan fontSize: (fontSize := aNumber)]
]

{ #category : #magritte }
GsTextShape >> fontSizeDescription [
  <magritteDescription>
  ^ GsDescriptionWrapper new for:(
      MANumberDescription new
      label: 'font size';
      accessor: #fontSize);
    jsonKey: 'fontSize'    
]

{ #category : #private }
GsTextShape >> fullSpan [
  ^ self text from: 1 to: self text size
]

{ #category : #accessing }
GsTextShape >> gsHandles [
  self switchToEditor; requestFocus.
  ^ super gsHandles
]

{ #category : #accessing }
GsTextShape >> gsSvgOn: aStream [
  | base tbounds| 
  tbounds := self children first bounds.
  "why is 5 the magic number here?"
  base := (self gsPosition + (5@self fontSize)) roundTo: 0.001.
  aStream
    nextPutAll: '<text id="',self id asString,'"';
    nextPutAll: ' x="', base x asString,'"';
    nextPutAll: ' y="', base y asString,'"';
    nextPutAll: ' font-family="', self fontName,'"';
    nextPutAll: ' font-size="', self fontSize asString,'px"';
    nextPutAll: ' fill="', self textColor,'"';
    nextPutAll: '>', self gsText, '</text>'
]

{ #category : #accessing }
GsTextShape >> gsText [
  ^ self text asString
]

{ #category : #accessing }
GsTextShape >> gsText: aString [
  self inUIProcessDo: [self text: aString]
]

{ #category : #magritte }
GsTextShape >> gsTextDescription [
  <magritteDescription>
  ^ MAStringDescription new
    label: 'Text';
    accessor: #gsText
]

{ #category : #initialization }
GsTextShape >> initialize [
  textColor := Color black.
  fontSize := 16.
  fontName := 'Source Sans Pro'.
  super initialize .
  self 
    aptitude: BrEditorAptitude new;
    fitContent;
    text: 'new text'
]

{ #category : #accessing }
GsTextShape >> lengthShown [
	^ lengthShown
]

{ #category : #accessing }
GsTextShape >> lengthShown: aNumber [
	lengthShown := aNumber.
	self redecorate
]

{ #category : #accessing }
GsTextShape >> positionDescription [
  <magritteDescription>
  ^ GsPointDescription new
    priority: 100;
    accessor: #gsPosition;
    label: 'Position'
    
]

{ #category : #accessing }
GsTextShape >> redecorate [
  super text: ((lengthShown = 0) ifTrue: ['']
    ifFalse: [fullString 
      copyFrom: 1 to: (fullString size min: lengthShown)]). 
  self
    textColor: self textColor;
    fontSize: fontSize.
]

{ #category : #accessing }
GsTextShape >> text: aString [
  lengthShown := aString size.
  fullString := aString.
  super text: aString.
  self redecorate.
 
]

{ #category : #accessing }
GsTextShape >> textColor [
  ^ textColor asHTMLColor
]

{ #category : #accessing }
GsTextShape >> textColor: aHexString [
  self inUIProcessDo: [
    self fullSpan foreground: (
      textColor := Color fromHexString: aHexString)]
]

{ #category : #magritte }
GsTextShape >> textColorDescription [
  <magritteDescription>
  ^ MAStringDescription new
    label: 'Text color';
    accessor: #textColor
]
