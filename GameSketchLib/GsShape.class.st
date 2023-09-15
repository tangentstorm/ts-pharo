"
I am a superclass for most of the shapes in GSL.

My subclasses can be built with {{gtClass:GsBuildTool}} and then manipulated with {{gtClass:GsSelectTool}}.

My main attributes are currently: shapePosition 

My main protocol for building is the newAtPoint: / secondPoint pair.

Hopefully soon I should have a method for showing handles.

I should probably be a trait instead.

"
Class {
	#name : #GsShape,
	#superclass : #GsObject,
	#traits : 'TGsShaped',
	#classTraits : 'TGsShaped classTrait',
	#category : #'GameSketchLib-Shapes'
}

{ #category : #building }
GsShape >> buildVisuals: anElement [
  "argument is a prototype shape with current style from scenebuilder"
  self
    background: anElement background;
    border: anElement border
 
]

{ #category : #'gt-extensions' }
GsShape >> gtChildrenShortcutsFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtJsonFor: aView [
  <gtView>
  ^ aView textEditor title: 'JSON'; text: [self gsJson]
]

{ #category : #'gt-extensions' }
GsShape >> gtMeasurementChainFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtOverviewFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtPreviewFor: aView [
  <gtView>
  ^ aView explicit
    title: 'Preview';
    priority: 10;
    stencil: [|res copy|
      res := GsSketchApp new.
      copy := self gsCopy
        relocate: 100@100;
        when: BlElementAddedToParentEvent doOnce: [
          res selection add: copy].
      res scene addChild: copy.
      res]
]

{ #category : #'gt-extensions' }
GsShape >> gtPrintFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtPropertiesFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtResizersFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtShortcutsFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtStatesFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtStylesFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtUserDataFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #'gt-extensions' }
GsShape >> gtWidgetGraphFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #initialization }
GsShape >> initialize [
  super initialize.
  visuals := GsStyle default.
]

{ #category : #traversing }
GsShape >> withAllSubShapes [
  ^ { self }
]
