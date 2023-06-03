Class {
	#name : #CouchDB,
	#superclass : #Object,
	#instVars : [
		'url'
	],
	#category : #CouchDB
}

{ #category : #accessing }
CouchDB class >> atURL: aString [ 
  ^ self new url: aString
]

{ #category : #accessing }
CouchDB >> gtHomeFor: aView [
  <gtView>
  ^ aView forward
      title: 'Home';
      priority: 5;
      object: [STONJSON fromString:
        (ZnClient new get: url)];
      view: #gtItemsFor:
]

{ #category : #accessing }
CouchDB >> gtPrintFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #accessing }
CouchDB >> printOn: aStream [
  super printOn: aStream.
  aStream nextPutAll: ('CouchDB atURL: ',url)
]

{ #category : #accessing }
CouchDB >> url: aString [ 
  url := aString
]
