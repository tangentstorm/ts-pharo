Class {
	#name : #GsHandle,
	#superclass : #GsObject,
	#instVars : [
		'point',
		'subject',
		'selector',
		'prop'
	],
	#category : #'GameSketchLib-Tools'
}

{ #category : #accessing }
GsHandle >> for: aSubject prop: aProperty [
  "prop is a magritte description"
  subject := aSubject.
  prop := aProperty.
  self point: (prop read: subject).
  self when: BlPullEvent do: [
    prop write: self gsCenter to: subject].
]

{ #category : #accessing }
GsHandle >> initialize [
  super initialize.
  self size: 9 asPoint;
    geometry: BlCircleGeometry new;
    background: GsColor handleColor;
    border: Color black;
    addEventHandler: BlPullHandler new;
    when: BlMouseDownEvent do: [:e| e consumed: true].
]

{ #category : #accessing }
GsHandle >> point: aPoint [ 
  point := aPoint.
  self relocate: point - (4.5 asPoint)
]

{ #category : #accessing }
GsHandle >> refresh [
  self point: (prop read: subject)
]
