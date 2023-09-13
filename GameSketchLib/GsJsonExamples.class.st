Class {
	#name : #GsJsonExamples,
	#superclass : #Object,
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsJsonExamples >> circleData [
  <gtExample>
  ^ self validateGsJsonFor:GsCircleShape new.

]

{ #category : #accessing }
GsJsonExamples >> fromDict: anObject [
  ^ GsJsonReader read: 
    (STONJSON toString: anObject)
]

{ #category : #accessing }
GsJsonExamples >> readScene [
  <gtExample>
  ^ self fromDict: self sceneData 
]

{ #category : #accessing }
GsJsonExamples >> rectData [
  <gtExample>
  ^ self validateGsJsonFor:GsRectShape new.

]

{ #category : #accessing }
GsJsonExamples >> sceneData [
  <gtExample>
  ^ self validateGsJsonFor: (GsScene new
    addChild: (self fromDict: self circleData) as: #circle;
    addChild: (self fromDict: self textData) as: #text;
    addChild: (self fromDict: self rectData) as: #rect). 
]

{ #category : #accessing }
GsJsonExamples >> textData [
  <gtExample>
  ^ self validateGsJsonFor:GsTextShape new.

]

{ #category : #accessing }
GsJsonExamples >> validateGsJsonFor: aShape [
  ^ STONJSON fromString: aShape gsJson 
]
