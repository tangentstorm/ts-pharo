Class {
	#name : #GsJsonExamples,
	#superclass : #Object,
	#traits : 'TGtExampleAssertable',
	#classTraits : 'TGtExampleAssertable classTrait',
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsJsonExamples >> animationsJson [
  <gtExample>
  | scn raw ani |
  scn := self sceneWithOneTrack.
  raw := self validateGsJsonFor: scn.
  self assert: (raw at: #animations) size equals: 1.
  "animation data is just a list of the tracks"
  ani := (raw at: #animations at: #default) first.
  self assert: (ani at: #el) equals: #circle.
  self assert: (ani at: #prop) equals: #position.
  self assert: (ani at: #keys) size equals: 3.
  ^ scn gsJson

]

{ #category : #accessing }
GsJsonExamples >> animationsJsonReader [
  <gtExample>
  | scn jsn new |
  scn := self sceneWithOneTrack.
  jsn := self animationsJson.
  new := GsJsonReader read: jsn.
  self assert: new animations size equals: 1.
  self assert: new animationsData asString equals: scn animationsData asString.
]

{ #category : #accessing }
GsJsonExamples >> brokenAnimationsDescription [
  <gtExample>
  | scn |
  scn := self sceneWithOneTrack.
  
  "attempting to use GsJsonWriter on the basic magritte
   description triggers:

      GsKeyframeData(Object)>>doesNotUnderstand: #elementName

   obviously that's not a 'should' but this test is documenting
   the broken behavior for further investigation."
  self should: [
      GsJsonWriter write: scn
         description: scn brokenAnimationsDescription ]
    raise: MessageNotUnderstood.
   
  ^ scn brokenAnimationsDescription
]

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
GsJsonExamples >> sceneWithOneTrack [
  | scn ani |
  scn := GsScene new 
    addChild: GsCircleShape new as: #circle.
  ani := scn currentAnimation
    addTrackFor: #(circle position) withKeys: {
      00 -> {100@100. #linear}.
      05 -> {210@150. #linear}.
      10 -> {200@200. #linear}}.
  ^ scn
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
