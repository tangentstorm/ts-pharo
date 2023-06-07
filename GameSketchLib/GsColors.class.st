Class {
	#name : #GsColors,
	#superclass : #Object,
	#category : #GameSketchLib
}

{ #category : #accessing }
GsColors class >> defaultBg [
^ Color lightGray
]

{ #category : #accessing }
GsColors class >> gold [
  ^ Color fromHexString: 'ffd700'
]

{ #category : #accessing }
GsColors class >> toolBg [
  ^ Color veryVeryLightGray
]
