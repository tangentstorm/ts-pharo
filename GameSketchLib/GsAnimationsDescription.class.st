"
I am a custom magritte description for the ""animaitons"" property on a GsSketch.
##Why this is here:

@tangentstorm had trouble getting magritte to accurately navigate the data structure, so this is a standin.

Here is the problem this works around:

{{gtExample:GsJsonExamples>>brokenAnimationsDescription|expanded}}


"
Class {
	#name : #GsAnimationsDescription,
	#superclass : #MAElementDescription,
	#category : #'GameSketchLib-Magritte'
}

{ #category : #accessing }
GsAnimationsDescription >> acceptMagritte: aVisitor [
	aVisitor visitAnimationsDescription: self
]
