"
I represent a text string, rendered with a particular font at a particular location.

"
Class {
	#name : #GsTextShape,
	#superclass : #BrEditableLabel,
	#instVars : [
		'textColor',
		'fontSize',
		'fontName'
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
  self fullSpan fontName: (fontName := aString). 
]

{ #category : #accessing }
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
  self fullSpan fontSize: (fontSize := aNumber)
]

{ #category : #accessing }
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
GsTextShape >> gsText [
  ^ self text asString
]

{ #category : #accessing }
GsTextShape >> gsText: aString [
  self text: aString
]

{ #category : #accessing }
GsTextShape >> gsTextDescription [
  <magritteDescription>
  ^ MAStringDescription new
    label: 'Text';
    accessor: #gsText
]

{ #category : #accessing }
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
GsTextShape >> redecorate [
  self textColor: self textColor; fontSize: fontSize
]

{ #category : #accessing }
GsTextShape >> text: aString [
  super text: aString.
  self redecorate.
 
]

{ #category : #accessing }
GsTextShape >> textColor [
  ^ textColor asHTMLColor
]

{ #category : #accessing }
GsTextShape >> textColor: aHexString [
  self fullSpan foreground: (
    textColor := Color fromHexString: aHexString)
]

{ #category : #accessing }
GsTextShape >> textColorDescription [
  <magritteDescription>
  ^ MAStringDescription new
    label: 'Text color';
    accessor: #textColor
]
