Class {
	#name : #GsSketchExamples,
	#superclass : #GsSceneExamples,
	#category : #'GameSketchLib-Examples'
}

{ #category : #accessing }
GsSketchExamples >> collectionsExample [
  <gtExample>
  | sk a b c|
  sk := GsSketch new.
  sk addChild: (a := GsShape new) as: #a.
  sk addChild: (b := GsShape new) as: #b.
  sk addChild: (c := GsShape new) as: #c.
  sk add: a toList: #ab.
  sk add: b toList: #ab.
  sk add: b toList: #bc.
  sk add: c toList: #bc.
  self assert: sk listData
    equals: { #ab -> { #a. #b }. #bc -> { #b. #c }} asOrderedDictionary.
       
]
