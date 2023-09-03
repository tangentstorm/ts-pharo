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
	#category : #'GameSketchLib-Shapes'
}

{ #category : #accessing }
GsShape class >> newFromData: dict [
  | sketch |
  sketch :=  (dict at: 't') caseOf: {
    ['rect'] -> [GsRectShape new].
    ['ellipse'] -> [GsEllipseShape new].
    ['text'] -> [GsTextShape new].
    ['path'] -> [GsPathShape new]}
  otherwise: [self error: 'unknown sketch type:', dict asString].
  ^ sketch id: (dict at: 'id'); fromData: dict
]

{ #category : #initialization }
GsShape >> initialize [
  super initialize.
  visuals := GsStyle default.
]
