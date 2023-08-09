"
I define some colors and palettes.
"
Class {
	#name : #GsColor,
	#superclass : #Object,
	#category : #GameSketchLib
}

{ #category : #accessing }
GsColor class >> defaultBg [
^ Color lightGray
]

{ #category : #accessing }
GsColor class >> from: aString [
  ^ Color fromString: aString 
]

{ #category : #accessing }
GsColor class >> gold [
  ^ Color fromHexString: 'ffd700'
]

{ #category : #accessing }
GsColor class >> toolBg [
  ^ Color veryVeryLightGray
]
