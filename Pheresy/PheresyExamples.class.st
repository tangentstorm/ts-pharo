Class {
	#name : #PheresyExamples,
	#superclass : #Object,
	#traits : 'TCondMethod + TCaseMethod',
	#classTraits : 'TCondMethod classTrait + TCaseMethod classTrait',
	#category : #Pheresy
}

{ #category : #accessing }
PheresyExamples >> caseExample [
  <gtExample>
  | res |
  res := #err.
  self case: #sym of: {
    #abc -> [self error: 'this should not run'].
    #sym -> [res := #ok]}.
  self assert: res equals: #ok
]

{ #category : #accessing }
PheresyExamples >> caseExampleWithPredicate [
  <gtExample>
  |res|
  self case: #sym of: {
    #abc -> [self error: 'this should not run'].
    [:x| x beginsWith: 'sy'] -> [res := #ok]}.
  self assert: res equals: #ok.
]
