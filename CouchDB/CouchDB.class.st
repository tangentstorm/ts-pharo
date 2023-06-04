"
I am an extremely primitive client for Apache CouchDB.
You probably want to look at one of these instead:

https://github.com/jmari/SCouchDB
https://github.com/eMaringolo/pharo-couchdb/

"
Class {
	#name : #CouchDB,
	#superclass : #Object,
	#instVars : [
		'uid',
		'pwd',
		'db',
		'host',
		'port',
		'url'
	],
	#category : #CouchDB
}

{ #category : #accessing }
CouchDB >> db [
	^ db
]

{ #category : #accessing }
CouchDB >> db: anObject [
	db := anObject
]

{ #category : #'gt inspector' }
CouchDB >> gtHomeFor: aView [
  <gtView>
  ^ aView forward
      title: 'Home';
      priority: 5;
      object: [STONJSON fromString:
        (ZnClient new get: self url)];
      view: #gtItemsFor:
]

{ #category : #'gt inspector' }
CouchDB >> gtPrintFor: aView [
  <gtView>
  ^ aView empty
]

{ #category : #accessing }
CouchDB >> host [
	^ host
]

{ #category : #accessing }
CouchDB >> host: anObject [
	host := anObject
]

{ #category : #initialization }
CouchDB >> initialize [
  host:='localhost'.
  port:='5984'.
  uid:=nil.
  pwd:=nil.
  db:=nil.
]

{ #category : #accessing }
CouchDB >> port [
	^ port
]

{ #category : #accessing }
CouchDB >> port: anObject [
	port := anObject
]

{ #category : #accessing }
CouchDB >> printOn: aStream [
  super printOn: aStream.
  aStream nextPutAll: ('(http://',host,':',port,'/',db,')')
]

{ #category : #accessing }
CouchDB >> rebuildUrl [
|r| r := 'http://'.
(uid isNil)|(pwd isNil) ifFalse:[
  r := r,uid,':',pwd,'@'].
r := r,host,':',port,'/'.
db ifNotNil: [r := r,db].
url := ZnUrl fromString: r.
]

{ #category : #accessing }
CouchDB >> url [
  |r| r := 'http://'.
  (uid isNil)|(pwd isNil) ifFalse:[
    r := r,uid,':',pwd,'@'].
  r := r,host,':',port,'/'.
  db ifNotNil: [r := r,db].
  ^ r
]

{ #category : #accessing }
CouchDB >> withConfig: aPath [
|args|
args := ((aPath asFileReference contents lines last
  splitOn: 'CouchDBClient(') last splitOn:', ')
  collect:[:s|s trimBoth: [:c|(c=$')|(c=$))]].
uid := args removeFirst.
pwd := args removeFirst.
db  := args removeFirst.
self rebuildUrl.
^ self
]
