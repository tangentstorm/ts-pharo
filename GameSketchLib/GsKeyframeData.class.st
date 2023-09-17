"
Plain data class to help Magritte work with {{gtClass:GsAnimationTrack}}.
"
Class {
	#name : #GsKeyframeData,
	#superclass : #Object,
	#instVars : [
		'key',
		'val',
		'easing',
		'valDescription'
	],
	#category : #'GameSketchLib-Data'
}

{ #category : #accessing }
GsKeyframeData >> easing [
	^ easing
]

{ #category : #accessing }
GsKeyframeData >> easing: anObject [
	easing := anObject
]

{ #category : #accessing }
GsKeyframeData >> easingDescription [
  <magritteDescription>
  ^ MASingleOptionDescription new
      accessor: #easing;
      default: #linear;
      options: #(linear easeIn) 
]

{ #category : #accessing }
GsKeyframeData >> key [
	^ key
]

{ #category : #accessing }
GsKeyframeData >> key: anObject [
	key := anObject
]

{ #category : #accessing }
GsKeyframeData >> keyDescription [
  <magritteDescription>
  ^ MANumberDescription new
      accessor: #key
]

{ #category : #accessing }
GsKeyframeData >> val [
	^ val
]

{ #category : #accessing }
GsKeyframeData >> val: anObject [
	val := anObject
]

{ #category : #accessing }
GsKeyframeData >> valDescription [
  <magritteDescription>
  ^ valDescription
]

{ #category : #magritte }
GsKeyframeData >> valDescription: aDescription [
  valDescription := aDescription 
]
