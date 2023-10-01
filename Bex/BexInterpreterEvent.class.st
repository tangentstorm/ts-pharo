Class {
	#name : #BexInterpreterEvent,
	#superclass : #Announcement,
	#instVars : [
		'ip'
	],
	#category : #'Bex-RPN'
}

{ #category : #accessing }
BexInterpreterEvent >> ip [
  ^ ip
]

{ #category : #accessing }
BexInterpreterEvent >> ip: aNumber [
  ip := aNumber
]
