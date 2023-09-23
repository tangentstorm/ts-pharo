"
I am a factor for creating  binary (or ""Boolean"") expressions.
"
Class {
	#name : #Bex,
	#superclass : #Object,
	#instVars : [
		'op',
		'args'
	],
	#category : #Bex
}

{ #category : #accessing }
Bex class >> and: argList [
  self assert: (argList size = 2)
    description: 'AND takes two arguments'.
  ^ Bex op: #and args: argList
]

{ #category : #accessing }
Bex class >> isAbstract [
  ^ self == Bex
]

{ #category : #accessing }
Bex class >> op: anInt args: argList [ 
  ^ BexDef new op: anInt args: argList
]

{ #category : #accessing }
Bex class >> x: aNat [
  "construct a variable such as x0"
  ^ BexVar new vid: aNat
]

{ #category : #accessing }
Bex class >> xor: argList [
  self assert: (argList size = 2)
     description: 'xor takes exactly 2 arguments'.
  ^ Bex op: #xor args: argList
]

{ #category : #accessing }
Bex >> asNodes [
  |res| 
  res := OrderedCollection new.
  res add:self.
  ^ res
]

{ #category : #accessing }
Bex >> border [
  ^ nil.
"  ^ BlBorder paint: Color black."
]

{ #category : #accessing }
Bex >> color [
  "a default color to be overridden"
  ^ Color cyan.
]

{ #category : #accessing }
Bex >> geometry [
  ^ BlCircleGeometry new.
]

{ #category : #accessing }
Bex >> gtDrawingFor: aView [
  <gtView>
  ^ aView explicit
    title: 'Drawing';
    stencil: [self stencil].
]

{ #category : #accessing }
Bex >> immediateChildren [
  ^ {}
]

{ #category : #accessing }
Bex >> nodeString [
  ^ self asString
]

{ #category : #accessing }
Bex >> nodeText [
 ^ self nodeString asRopedText
]

{ #category : #accessing }
Bex >> size [
  ^ 32@32.
]

{ #category : #accessing }
Bex >> stencil [
  ^ BexShape new symbol: op
]
