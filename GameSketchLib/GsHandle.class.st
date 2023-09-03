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
  self refresh;
    when: BlPullEvent do: [ prop write: self gsCenter to: subject];
    when: BlPullEndEvent do: [ prop write: self gsCenter to: subject].
]

{ #category : #accessing }
GsHandle >> gsCenter [
  ^ self position + self radius asPoint
]

{ #category : #accessing }
GsHandle >> initialize [
  super initialize.
  self size: self radius * 2 asPoint;
    geometry: BlCircleGeometry new;
    background: GsColor handleColor;
    border: Color black;
    addEventHandler: BlPullHandler new;
    when: BlMouseDownEvent do: [:e| e consumed: true].
]

{ #category : #accessing }
GsHandle >> point: aPoint [ 
  self gsCenter: (point := aPoint)
]

{ #category : #accessing }
GsHandle >> radius [
  ^ 4.5
]

{ #category : #accessing }
GsHandle >> refresh [
  self point: (prop read: subject)
]
